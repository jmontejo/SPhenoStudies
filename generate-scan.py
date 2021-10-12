#!/usr/bin/env python3
import os, glob
from collections import namedtuple
from multiprocessing import Pool
import argparse
import subprocess
import LesHouches_converter as LH
import run_tools
import json

def parse_args():
    
    # create a keyvalue class for argparse
    class keyvalue(argparse.Action):
        def __call__( self , parser, namespace,
                     values, option_string = None):
            setattr(namespace, self.dest, dict())
              
            for value in values:
                key, value = value.split('=')
                getattr(namespace, self.dest)[key] = value

    # create a keyrange class for argparse
    class keyrange(argparse.Action):
        def __call__( self , parser, namespace,
                     values, option_string = None):
            setattr(namespace, self.dest, dict())
              
            for value in values:
                key, value = value.split('=')
                getattr(namespace, self.dest)[key] = eval(value)

    default_template = "LesHouches.in.MSSMBpV_template"
    default_model = "MSSMTriRpV"
    models = [x for x in os.listdir("SPheno/models") if not "README" in x]

    parser = argparse.ArgumentParser()
    parser.add_argument('model', default=default_model, choices=models, help='Choose a model')
    parser.add_argument('-i', '--input', default=default_template, help='Input template')
    parser.add_argument('-o', '--output', help='Output folder')
    parser.add_argument('--values', nargs="*", action=keyvalue, help= 'Set a number of key-value pairs with "key=value"')
    parser.add_argument('--values-file', help= 'Read values from json file. These can still be overriden with --values')
    parser.add_argument('--ranges', nargs="*", action=keyrange, help= 'Set a number of key-value pairs with "key=value"')
    parser.add_argument('--ranges-file', help= 'Read ranges from json file. These can still be overriden with --ranges')
    args = parser.parse_args()
    if not args.output:
        args.output = "outputs_{}".format(args.model)

    return args

def main():
    args = parse_args()
    lhdict = LH.lhfile_to_dict(args.input)
    for point in LH.generate_point(args.ranges, args.ranges_file):
        tmplhdict = LH.modify_lhdict(lhdict, point)
        tmplhdict = LH.modify_lhdict(tmplhdict, args.values, args.values_file)
        LH.validate_dict(tmplhdict)
        run_folder = run_tools.get_run_folder(args.output)
        run_tools.prepare_run_folder(run_folder, tmplhdict)
        run_tools.run(run_folder, args.model)

if __name__ == "__main__": main()
