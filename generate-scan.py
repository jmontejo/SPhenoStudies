#!/usr/bin/env python3
import os, glob
from collections import namedtuple
from multiprocessing import Pool
import argparse
import subprocess
import LesHouches_converter as LH
import run_tools
import json
import logging
logging.basicConfig(format="%(levelname)8s %(name)10s: %(message)s")
log = logging.getLogger(__name__)

def parse_args():
    
    from parser_helpers import keyvalue, keyvaluevalue, keyrange

    default_template = "LesHouches.in.MSSMBpV_template"
    default_model = "MSSMTriRpV"
    models = [x for x in os.listdir("SPheno/models") if not "README" in x]

    parser = argparse.ArgumentParser()
    parser.add_argument('--model', default=default_model, choices=models, help='Choose a model')
    parser.add_argument('-i', '--input', default=default_template, help='Input template')
    parser.add_argument('-o', '--output', help='Output folder')
    parser.add_argument('--values', default = [], nargs="*", action=keyvalue, help= 'Set a number of key-value pairs with "key=value"')
    parser.add_argument('--values-file', help= 'Read values from json file. These can still be overriden with --values')
    parser.add_argument('--ranges', default = [], nargs="*", action=keyrange, help= 'Set a number of key-range pairs with "key=range".' 
                                                                                    '"range" can be any python expression such as [1,2,3] or range(8)')
    parser.add_argument('--ranges-file', help= 'Read ranges from json file. These can still be overriden with --ranges')
    parser.add_argument('--target', action=keyvaluevalue, help= 'Set a target output based on a known input with "input:output=value", e.g MSTOPSQUARE:1000002_mass:10=1000 \
                                                                 If the input contains SQUARE the initial point will be the target squared.')
    parser.add_argument('--verbose', '-v', action='count', default=0)

    args = parser.parse_args()
    if not args.output:
        args.output = "outputs_{}".format(args.model)
    loggers = [logging.getLogger(name) for name in logging.root.manager.loggerDict]
    for logger in loggers:
        logger.setLevel(max(10,30-10*args.verbose))

    return args

def main():
    args    = parse_args()
    manager = run_tools.SPhenoPointManager(args.output, args.model)
    basesphenopoint = run_tools.SPhenoPoint(args.input, args.model)
    for point in LH.generate_point(args.ranges, args.ranges_file):
        log.debug("Generated new scan point: {}".format(point))
        sphenopoint = basesphenopoint.modify_point(point)
        sphenopoint = sphenopoint.modify_point(args.values, args.values_file, args.target)
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
