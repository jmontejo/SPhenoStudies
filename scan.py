import os, glob
from copy import deepcopy
from collections import namedtuple
from multiprocessing import Pool
import argparse

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
    default_output = "outputs"
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input', default=default_template, help='Input template')
    parser.add_argument('-o', '--output', default=default_output, help='Output folder')
    parser.add_argument('--set', nargs="*", action=keyval, help= 'Set a number of key-value pairs with "key=value"')

    args = parser.parse_args()
    return args
  
Benchmark = namedtuple("Benchmark", "mu,m1,m2,m3,mstop,msq,tanbeta,udd")

def prepare_run_folder(run_folder):
    ''' Create a folder and write inside the LesHouches and json files '''
    

def main():
    args = parse_args()
        
if __name__ == "__main__": main()
