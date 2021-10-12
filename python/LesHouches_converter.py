from copy import deepcopy
import json
import sys
from collections import OrderedDict

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
            else:
                lhdict[block][key] = value
    return lhdict

def dict_to_lhfile(thedict, lhfile):
    with open(lhfile,"w") as outfile:
        for block, indict in thedict.items():
            outfile.write("Block {}\n".format(block))
            for k, v in indict.items():
                outfile.write("    {:<10} {}\n".format(k,v))

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

def validate_dict(thedict):
    haserror = False
    for block, blockdict in thedict.items():
        for k,v in blockdict.items():
            try:
                v = float(v)
            except ValueError as err:
                haserror = True
                print("ValueError: {}".format(err))
    return haserror

def generate_point(rangedict, rangefile):
    ranges = {}
    if rangefile:
        with open(rangefile) as infile:
            ranges = json.load(infile)
    if rangedict:
        ranges.update(rangedict)

    import itertools
    keys, values = zip(*ranges.items())
    permutations_dicts = [dict(zip(keys, v)) for v in itertools.product(*values)]
    print(permutations_dicts)
    return permutations_dicts

def modify_lhdict(lhdict, moddict, modfile=None):
    if not moddict and not modfile: return lhdict
    mods = {}
    if modfile:
        with open(modfile) as infile:
            mods = json.load(infile)
    if moddict:
        mods.update(moddict)

    modified = deepcopy(lhdict)
    for block, blockdict in modified.items():
        if not "RVLAMUDDIN" in block: continue
        for k,v in blockdict.items():
            tmpv = v
            for modk,modv in mods.items():
                tmpv = tmpv.replace(modk,str(modv))
            modified[block][k] = tmpv
    return modified

def test(lhfile):
    lhdict = lhfile_to_dict(lhfile) 
    for k,v in lhdict.items():
        print(k,v)
    jsonout = "testout.json"
    dict_to_jsonfile(lhdict,jsonout)
    jsondict = jsonfile_to_dict(jsonout)
    lhout = "testout.leshouches"
    dict_to_lhfile(jsondict,lhout)

if __name__ == "__main__": 
    test("LesHouches.in.MSSMBpV_template")
    #test("SPheno.spc.MSSMBpV")
