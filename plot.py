import ROOT as root
import os, sys, glob, array, math
import argparse
from plots import plots

def parse_args():
    
    parser = argparse.ArgumentParser()
    parser.add_argument('model', default=default_model, choices=models, help='Choose a model')
    parser.add_argument('-i', '--input', nargs="*", help='Input folders to consider, allows wildcards')
    parser.add_argument('-o', '--output', help='Output folder')
    parser.add_argument('-c', '--constrains', nargs="*", help='Selection to be applied on the available models')
    parser.add_argument('--plots', default = [], nargs="*", help= 'List of plots to produce')

    args = parser.parse_args()

    return args

def main():
    args    = parse_args()
    manager = run_tools.SPhenoPointManager(args.output, "Plots")
    for plotname in args.plots:
        if plotname not in plots:
            log.warning("Plot not recognized, will skip: {}".format(plot))
            plot = plots[plotname]
            skimmedpoints = manager.skim(plot.freevars())
            for point in skimmedpoints:
                xvalue = point.get_output(plot.xvar)
                yvalue = point.get_output(plot.yvar)
                plot.add_point(xvalue, yvalue)
            plot.do_plot()
                


if __name__ == "__main__": main()
