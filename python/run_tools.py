import os
import LesHouches_converter as LH
import logging

log = logging.getLogger(__name__)

def get_run_folders(outputfolder, n):
    outmax = max([int(x) for x in os.listdir(outputfolder) if x.isnumeric()])
    return ["{}/{}".format(outputfolder,outmax+1+i) for i in range(n)]

def read_folders(folders, model):
    ''' Returns list of dictionaries with the contents of the folder '''
    sp_list = []
    for folder in folders:
        sp_list.append( SPhenoPoint(folder, model) )
    return sp_list

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
        elif os.path.isfile(folder_or_file): #create from file
            infile = folder_or_file
            self.inputdict = LH.lhfile_to_dict(infile)
        else:
            print(folder_or_file, model)
            raise WTF

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
            return
        if self.outputdict:
            log.warning("Output already exists")
            return
        runfolder = self.get_run_folder(outputfolder)
        self.prepare_run_folder(runfolder, self.inputdict)
        cmd = "cd {} && {} LesHouches.in".format(runfolder, self.model)
        os.system(cmd)

    def modify_point(self, moddict, modfile=None):
        if self.outputdict:
            log.error("Will modify a SP which has already output!")
        import json
        from copy import deepcopy
        if not moddict and not modfile: return self
        mods = {}
        if modfile:
            with open(modfile) as infile:
                mods = json.load(infile)
        if moddict:
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
    
