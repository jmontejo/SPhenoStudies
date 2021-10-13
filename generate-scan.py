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

    # create a keyvaluevalue class for argparse
    class keyvaluevalue(argparse.Action):
        def __call__( self , parser, namespace,
                     value, option_string = None):

            key, value = value.split(':')
            v1,v2 = value.split('=')
            setattr(namespace, self.dest, (key,v1,float(v2)))

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
    parser.add_argument('--values', default = [], nargs="*", action=keyvalue, help= 'Set a number of key-value pairs with "key=value"')
    parser.add_argument('--values-file', help= 'Read values from json file. These can still be overriden with --values')
    parser.add_argument('--ranges', default = [], nargs="*", action=keyrange, help= 'Set a number of key-value pairs with "key=value"')
    parser.add_argument('--ranges-file', help= 'Read ranges from json file. These can still be overriden with --ranges')
    parser.add_argument('--target', action=keyvaluevalue, help= 'Set a target output based on a known input with "input:output=value", e.g MSTOPSQUARE:1000002_mass:10=1000 \
                                                                 If the input contains SQUARE the initial point will be the target squared.')
    args = parser.parse_args()
    if not args.output:
        args.output = "outputs_{}".format(args.model)
    if args.target and (args.target in args.values or args.target in args.ranges):
        log.fatal("Target can not be in --values or --ranges")

    return args

def main():
    args    = parse_args()
    manager = run_tools.SPhenoPointManager(args.output, args.model)
    basesphenopoint = run_tools.SPhenoPoint(args.input, args.model)
    for point in LH.generate_point(args.ranges, args.ranges_file):
        sphenopoint = basesphenopoint.modify_point(point)
        sphenopoint = sphenopoint.modify_point(args.values, args.values_file)
        if args.target:
            while(True):
                target = manager.get_target(sphenopoint, args.target)
                sphenopointtarget = sphenopoint.modify_point(target)
                sphenopointtarget = manager.exists(sphenopointtarget)
                hasrun = sphenopointtarget.run(args.output)
                if not hasrun: break
                manager.add_point(sphenopointtarget)
        else:
            sphenopoint = manager.exists(sphenopoint)
            sphenopoint.run(args.output)

if __name__ == "__main__": main()
