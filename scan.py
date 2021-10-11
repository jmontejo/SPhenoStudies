#!/usr/bin/env python3
import os, glob
from copy import deepcopy
from collections import namedtuple
from multiprocessing import Pool
import argparse
import subprocess
import LesHouches_converter as LH

def parse_args():
    
    # create a keyvalue class for argparse
    class keyvalue(argparse.Action):
        def __call__( self , parser, namespace,
                     values, option_string = None):
            setattr(namespace, self.dest, dict())
              
            for value in values:
                key, value = value.split('=')
                getattr(namespace, self.dest)[key] = value

    default_template = "LesHouches.in.MSSMBpV_template"
    default_model = "TriRpV"
    models = [x for x in os.listdir("SPheno/models") if not "README" in x]

    parser = argparse.ArgumentParser()
    parser.add_argument('model', default=default_model, choices=models, help='Choose a model')
    parser.add_argument('-i', '--input', default=default_template, help='Input template')
    parser.add_argument('-o', '--output', help='Output folder')
    parser.add_argument('--values', nargs="*", action=keyvalue, help= 'Set a number of key-value pairs with "key=value"')
    args = parser.parse_args()
    if not args.output:
        args.output = "outputs_{}".format(args.model)

    return args
  
Benchmark = namedtuple("Benchmark", "mu,m1,m2,m3,mstop,msq,tanbeta,udd")

def modify_lhdict(lhdict, moddict):
    modified = deepcopy(lhdict)
    for block, blockdict in modified.items():
        for k,v in blockdict.items():
            for modk,modv in moddict.items():
                momdified[block][k] = v.replace(modk,modv)
    return modified

def get_run_folder(outputfolder):
    return outputfolder+"/1"

def prepare_run_folder(run_folder, lhdict):
    ''' Create a folder and write inside the LesHouches and json files '''
    os.makedirs(run_folder,exist_ok=True)
    LH.dict_to_lhfile  (lhdict, run_folder+"/LesHouches.in")
    LH.dict_to_jsonfile(lhdict, run_folder+"/LesHouches.json")
    
def run(run_folder, model):
    ''' Run a folder '''
    cmd = "cd {} && {} LesHouches.in".format(run_folder, model)
    os.system(cmd)

def main():
    args = parse_args()
    lhdict = LH.lhfile_to_dict(args.input)
    if args.values:
        lhdict = modify_lhdict(lhdict, args.values)
    run_folder = get_run_folder(args.output)
    prepare_run_folder(run_folder, lhdict)
    run(run_folder, args.model)

if __name__ == "__main__": main()
