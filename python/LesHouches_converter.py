from copy import deepcopy
import json
import sys
from collections import OrderedDict
import logging
log = logging.getLogger(__name__)

def safe_float(x):
    try:
        x = float(x)
    except ValueError:
        pass
    return x

def lhfile_to_dict(lhfile):
    lhdict = OrderedDict()
    with open(lhfile) as infile:
        block = None
        for line in infile:
            if "#" in line:
                comment = line[line.find("#"):]
                line = line[:line.find("#")]
            else:
                comment = None
            tokens = line.split()
            if not tokens: continue
            key1 = tokens[0]
            key = key1 if len(tokens)==2 else " ".join(tokens[:-1])
            value = tokens[-1]

            if key1.lower() == "block":
                block = value
                lhdict[block] = OrderedDict()
            elif "decay" in key1.lower():
                break
            else:
                lhdict[block][key] = value
    return lhdict


def lhfile_to_decaydict(lhfile):
    decaydict = OrderedDict()
    with open(lhfile) as infile:
        decay = None
        for line in infile:
            if "#" in line:
                comment = line[line.find("#"):]
                line = line[:line.find("#")]
            else:
                comment = None
            tokens = line.split()
            if not tokens: continue
            key1 = tokens[0]

            if key1.lower() == "decay":
                pdgid = int(tokens[1])
                width = float(tokens[2])
                decay = pdgid
                decaydict[pdgid] = (width, [])
            elif decay is None:
                continue
            else:
                br, nbody, *rest = tokens
                rest = tuple(int(x) for x in rest)
                decaydict[decay][1].append((rest,float(br)))
    return decaydict

def dict_to_lhfile(thedict, lhfile):
    with open(lhfile,"w") as outfile:
        for block, indict in thedict.items():
            outfile.write("Block {} #\n".format(block))
            for k, v in indict.items():
                outfile.write("    {:<10} {:<10} #\n".format(k,v))

def jsonfile_to_dict(jsonfile):
    with open(jsonfile) as infile:
        thedict = json.load(infile)
    return thedict

def dict_to_jsonfile(thedict, jsonfile):
    with open(jsonfile,"w") as outfile:
        json.dump(thedict, outfile, allow_nan=False, indent=4)

def split_io_dict(thedict):
    inputdict, outputdict = {},{}
    inputkeys = ["MODSEL","SMINPUTS","MINPAR","EXTPAR","SPhenoInput","DECAYOPTIONS","RVLAMUDDIN","MSD2IN","MSE2IN","MSL2IN","MSQ2IN","MSU2IN","RVTUDDIN","TDIN","TEIN","TUIN"]
    for k, v in thedict:
       if k in inputkeys:
           inputdict[k] = v
       else:
           outputdict[k] = v
    return inputdict, outputdict

def generate_point(rangedict, rangefile):
    if not rangedict and not rangefile:
        return [{}]
    ranges = {}
    if rangefile:
        with open(rangefile) as infile:
            ranges = json.load(infile)
    if rangedict:
        ranges.update(rangedict)

    import itertools
    keys, values = zip(*ranges.items())
    permutations_dicts = [dict(zip(keys, v)) for v in itertools.product(*values)]
    return permutations_dicts

def test(lhfile):
    lhdict = lhfile_to_dict(lhfile) 
    for k,v in lhdict.items():
        log.info(k,v)
    jsonout = "testout.json"
    dict_to_jsonfile(lhdict,jsonout)
    jsondict = jsonfile_to_dict(jsonout)
    lhout = "testout.leshouches"
    dict_to_lhfile(jsondict,lhout)

if __name__ == "__main__": 
    log.setLevel("DEBUG")
    test("LesHouches.in.MSSMBpV_template")
    #test("SPheno.spc.MSSMBpV")
