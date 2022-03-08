import os, sys
import LesHouches_converter as LH
from copy import deepcopy
from particle import particle

import logging
log = logging.getLogger(__name__)

class SPhenoPointManager:
    def __init__(self, outfolder=None, model=None, withoutput=False,massprecision=10):
        self.outfolder = outfolder
        self.model     = model
        self.points    = []
        self.massprecision = massprecision
        if outfolder:
            os.makedirs(outfolder, exist_ok=True)
            for folder in os.listdir(outfolder):
                spp = SPhenoPoint(os.path.join(outfolder,folder),model)
                if withoutput and not spp.hasoutput():
                    continue
                self.points.append( spp )

    def add_point(self, point):
        self.points.append(point)

    def skim(self, constraints):
        log.debug("Will skim based on {}".format(constraints))
        skimmed = SPhenoPointManager(model=self.model)
        for point in self.points:
            for k, v in constraints.items():
                val = point.get_var(k, float)
                if "mass" in k: #approximate constraints on output masses
                    if val > v+self.massprecision or val < v-self.massprecision:
                        break
                else:
                    if v != val:
                        break
                log.debug("Point satisfies {} {} {}: {}".format(k,val,v,point.folder))
            else:
                skimmed.add_point(point)
        log.debug("Skimmed points {} -> {}".format(len(self.points),len(skimmed.points)))
        return skimmed

    def get_same_input(self, sphenopoint, ignore=None, equalkeys=False):
        ''' Returns all points that have the same input as the given point, except for variables included in 'ignore' '''
        same_points = []
        trimref = deepcopy(sphenopoint.inputdict)
        for block, ignoredict in ignore.items():
            for k in ignoredict:
                del trimref[block][k]
        for spp in self.points: #FIXME try hashes
            trimspp = deepcopy(spp.inputdict)
            vals = []
            for block, ignoredict in ignore.items():
                for k in ignoredict:
                    vals.append( trimspp[block].pop(k) )
            if trimref == trimspp:
                log.info("Found point with same inputs: {}".format(spp.folder))
                if equalkeys:
                    allequal = all([x == vals[0] for x in vals])
                    if not allequal: continue
                same_points.append(spp)
        return same_points

    def exists(self, sphenopoint):
        ''' 
        Checks if a point with the same input has been prepared already
        and returns the previously existing point if so
        '''
        for spp in self.points: #FIXME try hashes
            if spp.inputdict == sphenopoint.inputdict:
                log.warning("SPhenoPoint exists: {}".format(spp.folder))
                return spp
        return sphenopoint

    def get_target(self, refpoint, target):
        import math
        inparam, outparam, targetvalue = target
        targetkeys  = refpoint.get_target_keys(inparam)
        minv, maxv = -math.inf, math.inf
        minp, maxp = None, None
        tmpminp, tmpmaxp = None, None
        tmpminv, tmpmaxv = math.inf, -math.inf #notice inversion
        for point in self.get_same_input(refpoint, ignore=targetkeys, equalkeys=True):
            if not point.hasoutput(): continue
            value = point.get_output(outparam, float)
            if value > targetvalue and value < maxv:
                maxv = value
                maxp = point
            if value < targetvalue and value > maxv:
                minv = value
                minp = point
            if not maxp and value > tmpmaxv:
                tmpmaxv = value
                tmpmaxp = point
            if not minp and value < tmpminv:
                tmpminv = value
                tmpminp = point

        if not minp and tmpminv!=maxv:
            minp = tmpminp
            minv = tmpminv
        if not maxp and tmpmaxv!=minv:
            maxp = tmpmaxp
            maxv = tmpmaxv

        if not minp and not maxp:
            prediction = pow(targetvalue,2) if "square" in inparam.lower() else targetvalue
        elif not minp:
            maxin = maxp.get_input(targetkeys, float)
            prediction = maxin / 2.
        elif not maxp:
            minin = minp.get_input(targetkeys, float)
            prediction = minin * 2.
        else:
            minin = minp.get_input(targetkeys, float)
            maxin = maxp.get_input(targetkeys, float)
            massprecision = pow(self.massprecision,2) if "square" in inparam.lower() else self.massprecision
            prediction = int(((maxin-minin)*(targetvalue-minv)/(maxv -minv)+minin)/massprecision)*massprecision
        log.debug("Interpolating next target point: {} {}".format(inparam,prediction))
        return {inparam:prediction}


class SPhenoPoint:
    def __init__(self, folder_or_file, model):
        self.inputdict = None
        self.outputdict = None
        self.folder = None
        self.inputhash = None
        self.model     = model
        if os.path.isdir(folder_or_file): #read existing folder
            folder = folder_or_file
            self.process_folder(folder)
        elif os.path.isfile(folder_or_file): #create from file
            infile = folder_or_file
            self.inputdict = LH.lhfile_to_dict(infile)
        else:
            log.critical("Could not initialize SPhenoPoint with input: {}".format(folder_or_file))
            if not os.path.exists(folder_or_file):
                log.critical("Input does not exist")
            sys.exit(1)
    
    def process_folder(self,folder):
        self.folder = folder
        if os.path.exists(folder+"/LesHouches.in"):
            self.inputdict = LH.lhfile_to_dict(folder+"/LesHouches.in")
            self.inputs    = self.input_to_inputs(self.inputdict)
        if os.path.exists(folder+"/SPheno.spc.{}".format(self.model)):
            self.outputdict = LH.lhfile_to_dict(folder+"/SPheno.spc.{}".format(self.model))
            self.decaydict  = LH.lhfile_to_decaydict(folder+"/SPheno.spc.{}".format(self.model))
            self.particles  = self.outputs_to_particles(self.outputdict, self.decaydict)
        else:
            log.warning("Could not find output {}/SPheno.spc.{}".format( self.folder, self.model))

    def mergeDecays(self):
        for p in self.particles.values():
            p.mergeDecays()

    def hasoutput(self):
        if not self.folder: return False
        return os.path.exists(os.path.join(self.folder,"Messages.out"))
    def hasinput(self):
        return self.inputdict is not None

    def input_to_inputs(self, inputdict):
        inputs = {}
        from inputs import map_inputs
        for iname, ituple in map_inputs.items():
            blockname, *key = ituple
            if len(key) == 1:
                key = key[0]
                inputs[iname] = inputdict[blockname][str(key)]
            elif blockname in inputdict:
                for strkey, val in inputdict[blockname].items():
                    tuplekey = list(int(x) for x in strkey.split())
                    if key == tuplekey:
                        inputs[iname] = val
                        break
        return inputs

    def outputs_to_particles(self, outputdict, decaydict):
        particles = {}
        for block, blockdict in outputdict.items():
            if "mass" in block.lower():
                for pdgid, mass in blockdict.items():
                    particles[int(pdgid)] = particle(int(pdgid), str(pdgid),mass,0,[])
        for pdgid, (width, decays) in decaydict.items():
            particles[pdgid].setWidth(width)
            particles[pdgid].decays.extend(decays)
        return particles

    def get_var(self, var, convertto=None):
        if var in self.inputs:
            return float(self.inputs[var])
        return self.get_output(var, convertto)

    def get_output(self, outputvar, convertto=None):
        *pdgid, var = outputvar.split("_")
        if len(pdgid)==1:
            pdgid = pdgid[0]
            particle = self.particles[int(pdgid)]
            if not "BR" in var: 
                try:
                    v=  getattr(particle, var)
                except AttributeError as e:
                    log.error("Problem with point {}".format(self.folder))
                    if var=="lifetime":
                        log.warning("Will manually set particle lifetime to 9e9 {}".format(pdgid))
                        v = 9e9
                    else:
                        raise e
            else: 
                v = particle.skimmedDecays(1e-3,var.replace("BR",""))
            if convertto: v = convertto(v)
        else:
            pdgid1, pdgid2 = pdgid
            particle1 = self.particles[int(pdgid1)]
            particle2 = self.particles[int(pdgid2)]
            v1=  float(getattr(particle1, var))
            v2=  float(getattr(particle2, var))
            v = v1 -v2
        return v
        
    def get_input(self, inputkeys, convertto=None):
        ''' Returns value of input matching the keys
            The input is a dictionary for convenience but only the first match is returned
        '''
        for block, bdict in inputkeys.items():
            for k in bdict:
                v =  self.inputdict[block][k]
                if convertto: v = convertto(v)
                return v

    def get_run_folder(self, outputfolder):
        if not os.path.exists(outputfolder):
            os.makedirs(outputfolder,exist_ok=True)
        listdir = os.listdir(outputfolder)
        outmax = 0 if not listdir else max([int(x) for x in os.listdir(outputfolder) if x.isnumeric()])
        return "{}/{}".format(outputfolder,outmax+1)

    def prepare_run_folder(self, run_folder, lhdict):
        ''' Create a folder and write inside the LesHouches and json files '''
        os.makedirs(run_folder,exist_ok=True)
        LH.dict_to_lhfile  (lhdict, run_folder+"/LesHouches.in")


    def run(self, outputfolder):
        ''' Run a folder '''
        if not self.validate():
            log.error("Can not run point, some problem with input")
            return False
        if self.hasoutput():
            log.warning("Output already exists")
            return False
        if not self.folder:
            self.folder = self.get_run_folder(outputfolder)
        self.prepare_run_folder(self.folder, self.inputdict)
        log.info("About to run {}".format(self.folder))
        cmd = "cd {} && {} LesHouches.in".format(self.folder, self.model)
        os.system(cmd)
        self.process_folder(self.folder)
        return True

    def modify_point(self, moddict, modfile=None, target=None):
        if self.outputdict:
            log.error("Will modify a SP which has already output!")
        import json
        if not moddict and not modfile: return self
        mods = {}
        if modfile:
            with open(modfile) as infile:
                mods = json.load(infile)
        if moddict:
            mods.update(moddict)

        if target:
            mods.pop(target[0],None)
    
        modified = deepcopy(self)
        for block, blockdict in modified.inputdict.items():
            for k,v in blockdict.items():
                tmpv = v
                for modk,modv in mods.items():
                    tmpv = tmpv.replace(modk,repr(modv))
                modified.inputdict[block][k] = tmpv
        return modified

    def validate(self):
        isgood = True
        for block, blockdict in self.inputdict.items():
            for k,v in blockdict.items():
                try:
                    v = float(v)
                except ValueError as err:
                    isgood = False
                    log.error("Found error while validating {}: {}".format(self.folder, err))
        return isgood
    
    def get_target_keys(self,pattern):
        target = {}
        for block, blockdict in self.inputdict.items():
            for k,v in blockdict.items():
                if pattern in v:
                    d = target.setdefault(block, {})
                    d[k] = v
        return target
