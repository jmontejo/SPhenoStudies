import os
import LesHouches_converter as LH
import logging
from copy import deepcopy
from particle import particle

log = logging.getLogger(__name__)

class SPhenoPointManager:
    def __init__(self, outfolder, model):
        os.makedirs(outfolder, exist_ok=True)
        self.outfolder = outfolder
        self.model     = model
        self.folders   = os.listdir(outfolder)
        self.points    = []
        for folder in self.folders:
            spp = SPhenoPoint(os.path.join(outfolder,folder),model)
            self.points.append( spp )

    def add_point(self, point):
        self.points.append(point)

    def skim(self, constraints):

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
                log.warning("Found match: {}".format(spp.folder))
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
                log.warning(spp.inputdict)
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
            modulo = 10
            if "square" in inparam.lower():
                modulo = pow(modulo,2)
            print(maxin,minin,targetvalue,maxv,minv)
            prediction = int(((maxin-minin)*(targetvalue-minv)/(maxv -minv)+minin)/modulo)*modulo
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
            self.folder = folder
            if os.path.exists(folder+"/LesHouches.in"):
                self.inputdict = LH.lhfile_to_dict(folder+"/LesHouches.in")
            if os.path.exists(folder+"/SPheno.spc.{}".format(model)):
                self.outputdict = LH.lhfile_to_dict(folder+"/SPheno.spc.{}".format(model))
                self.particles  = self.output_to_particles(self.outputdict)
        elif os.path.isfile(folder_or_file): #create from file
            infile = folder_or_file
            self.inputdict = LH.lhfile_to_dict(infile)
        else:
            print(folder_or_file, model)
            raise WTF

    def hasoutput(self):
        return self.outputdict is not None
    def hasinput(self):
        return self.inputdict is not None

    def output_to_particles(self, outputdict):
        particles = {}
        for block, blockdict in outputdict.items():
            if "mass" in block.lower():
                for pdgid, mass in blockdict.items():
                    particles[int(pdgid)] = particle(int(pdgid), str(pdgid), str(pdgid),mass,0,[])
        print(particles)
        return particles

    def get_output(self, outputvar, convertto=None):
        pdgid, var = outputvar.split("_")
        particle = self.particles[int(pdgid)]
        if not "BR" in var: v=  getattr(particle, var)
        else: v = particle.skimmedDecays(1e-3,var.replace("BR",""))
        if convertto: v = convertto(v)
        return v
        
    def get_input(self, inputkeys, convertto=None):
        ''' Returns all points that have the same input as the given point, except for variables included in 'ignore' '''
        same_points = []
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
        log.warning("About to run {}".format(self.folder))
        if not self.validate():
            log.error("Can not run point, some problem with input")
            return False
        if self.folder:
            log.warning("Output already exists")
            return False
        self.folder = self.get_run_folder(outputfolder)
        self.prepare_run_folder(self.folder, self.inputdict)
        log.warning("About to actual run {}".format(self.folder))
        cmd = "cd {} && {} LesHouches.in".format(self.folder, self.model)
        os.system(cmd)
        return True

    def modify_point(self, moddict, modfile=None):
        if self.outputdict:
            log.error("Will modify a SP which has already output!")
        import json
        if not moddict and not modfile: return self
        mods = {}
        if modfile:
            with open(modfile) as infile:
                mods = json.load(infile)
        if moddict:
            print(moddict)
            mods.update(moddict)
    
        modified = deepcopy(self)
        for block, blockdict in modified.inputdict.items():
            for k,v in blockdict.items():
                tmpv = v
                for modk,modv in mods.items():
                    tmpv = tmpv.replace(modk,str(modv))
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
                    print("ValueError: {}".format(err))
        return isgood
    
    def get_target_keys(self,pattern):
        target = {}
        for block, blockdict in self.inputdict.items():
            for k,v in blockdict.items():
                if pattern in v:
                    d = target.setdefault(block, {})
                    d[k] = v
        return target
