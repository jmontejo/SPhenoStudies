#!/usr/bin/env python3
import os, sys, glob, array, math
import argparse
from plots import plots
import run_tools

def parse_args():

    from parser_helpers import keyvalue
    
    default_model = "MSSMTriRpV"
    models = [x for x in os.listdir("SPheno/models") if not "README" in x]

    parser = argparse.ArgumentParser()
    parser.add_argument('model', default=default_model, choices=models, help='Choose a model')
    parser.add_argument('-i', '--input', help='Input folder')
    parser.add_argument('-o', '--output', help='Output folder')
    parser.add_argument('-c', '--constraints', default = {}, action=keyvalue, nargs="*", help='Selection to be applied on the available models')
    parser.add_argument('--plots', default = [], nargs="*", help= 'List of plots to produce')

    args = parser.parse_args()
    if not args.output:
        args.output = "plots_{}".format(args.model)

    return args

def main():
    args    = parse_args()
    manager = run_tools.SPhenoPointManager(args.input, args.model, withoutput=True)
    for plotname in args.plots:
        if plotname not in plots:
            log.warning("Plot not recognized, will skip: {}".format(plot))
            continue
        plot = plots[plotname]
        skimmed = manager.skim({k:v for k,v in args.constraints.items() if k not in plot.freevars})
        for point in skimmed.points:
            xvalue = point.get_var(plot.xvar)
            yvalue = point.get_var(plot.yvar)
            print(point.folder,xvalue,yvalue,plot.xvar,plot.yvar)
            plot.add_point(xvalue, yvalue)
        plot.do_plot(args.output)
                


if __name__ == "__main__": main()
