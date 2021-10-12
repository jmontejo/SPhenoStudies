import os
import LesHouches_converter as LH

def get_run_folders(outputfolder, n):
    outmax = max([int(x) for x in os.listdir(outputfolder) if x.isnumeric()])
    return ["{}/{}".format(outputfolder,outmax+1+i) for i in range(n)]

def get_run_folder(outputfolder):
    listdir = os.listdir(outputfolder)
    outmax = 0 if not listdir else max([int(x) for x in os.listdir(outputfolder) if x.isnumeric()])
    return "{}/{}".format(outputfolder,outmax+1)


def prepare_run_folder(run_folder, lhdict):
    ''' Create a folder and write inside the LesHouches and json files '''
    os.makedirs(run_folder,exist_ok=True)
    LH.dict_to_lhfile  (lhdict, run_folder+"/LesHouches.in")
    LH.dict_to_jsonfile(lhdict, run_folder+"/LesHouches.json")
    
def run(run_folder, model):
    ''' Run a folder '''
    cmd = "cd {} && {} LesHouches.in".format(run_folder, model)
    os.system(cmd)
