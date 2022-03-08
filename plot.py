#!/usr/bin/env python3
import os, sys, glob, array, math
import argparse
import plots
import run_tools
import logging
logging.basicConfig(format="%(levelname)8s %(name)10s: %(message)s")
log = logging.getLogger(__name__)

def parse_args():

    from parser_helpers import keyvalue
    
    default_model = "MSSMTriRpV"
    models = [x for x in os.listdir("SPheno/models") if not "README" in x]

    parser = argparse.ArgumentParser()
    parser.add_argument('--model', default=default_model, choices=models, help='Choose a model')
    parser.add_argument('-i', '--input', help='Input folder')
    parser.add_argument('-o', '--output', help='Output folder')
    parser.add_argument('-c', '--constraints', default = {}, action=keyvalue, nargs="*", help='Selection to be applied on the available models')
    parser.add_argument('--plots', default = [], choices=plots.plots.keys(), nargs="*", help= 'List of plots to produce')
    parser.add_argument('--plots2D', default = [], choices=plots.plots2D.keys(), nargs="*", help= 'List of 2D plots to produce')
    parser.add_argument('--verbose', '-v', action='count', default=0)
    parser.add_argument('--merge-decays', '-m', action='store_true')

    args = parser.parse_args()
    if not args.output:
        args.output = "outputs_plots_{}".format(args.model)
    loggers = [logging.getLogger(name) for name in logging.root.manager.loggerDict]
    for logger in loggers:
        logger.setLevel(max(10,30-10*args.verbose))

    return args

def main():
    args    = parse_args()
    manager = run_tools.SPhenoPointManager(args.input, args.model, withoutput=True)
    for plotname in args.plots:
        plot = plots.plots[plotname]
        skimmed = manager.skim({k:v for k,v in args.constraints.items() if k not in plot.freevars})
        for point in skimmed.points:
            if args.merge_decays:
                point.mergeDecays()
            xvalue = point.get_var(plot.xvar)
            yvalue = point.get_var(plot.yvar)
            plot.add_point(xvalue, yvalue, "BR" in plot.yvar)
        plot.do_plot(args.output)

    for plotname in args.plots2D:
        plot = plots.plots2D[plotname]
        skimmed = manager.skim({k:v for k,v in args.constraints.items() if k not in plot.freevars})
        for point in skimmed.points:
            xvalue = point.get_var(plot.xvar)
            yvalue = point.get_var(plot.yvar)
            zvalue = point.get_var(plot.zvar)
            plot.add_point(xvalue, yvalue, zvalue)
        plot.do_plot(args.output)
                


if __name__ == "__main__": main()
