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

    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input', help='Input template')
    parser.add_argument('--set', nargs="*", action=keyval, help= 'Set a number of key-value pairs with "key=value"')

    args = parser.parse_args()
    return args
  
Benchmark = namedtuple("Benchmark", "mu,m1,m2,m3,mstop,msq,tanbeta,udd")

decoupled = 3000
scanname = "RPV1L_scan_3TeV_higgsino"; benchmark = Benchmark._make([200,1000,1000,decoupled,decoupled,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
overwrite = False

map_params = {
    "MUTEMPLATE":[benchmark.mu],
    "M1TEMPLATE":[-1000,-500,-300,300,500,1000],
    "M2TEMPLATE":[-1000,-500,-300,300,500,1000],
    "M3TEMPLATE":[benchmark.m3],
    "MSTOPTEMPLATE":[benchmark.mstop],
    "TANBETATEMPLATE":[benchmark.tanbeta],
    }
udd_params = {"3321em1":10**(-1)}
dimensions = 2

testtag = "hacked"
testtag = ""

template = "LesHouches.in.MSSMBpV_template"
targetstop = False # and map_params["MSTOPTEMPLATE"] == [benchmark.mstop]

def main():
    pool = Pool(6)
    global map_params
    global udd_params
    global benchmark
    global template
    global testtag
    if not os.path.exists(scanname): os.mkdir(scanname)
    os.chdir(scanname)
    for mu          in map_params["MUTEMPLATE"]:
        if abs(mu)<180: continue
        for m1          in map_params["M1TEMPLATE"]:
          for m2          in map_params["M2TEMPLATE"]:
            for m3          in map_params["M3TEMPLATE"]:
                for mstop       in map_params["MSTOPTEMPLATE"]:
                    #if m3 <= mstop+175: continue
                    for tanbeta     in map_params["TANBETATEMPLATE"]:
                        for udd_name, udd_choice in udd_params.iteritems():
                            if not udd_choice: udd_choice = udd_params_mfv
                            elif type(udd_choice) is float or type(udd_choice) is int:
                                tmp = udd_choice
                                udd_choice = deepcopy(udd_params_null)
                                if "332" in udd_name:
                                    udd_choice["UDDTEMPLATE323"] = -tmp
                                    udd_choice["UDDTEMPLATE332"] = tmp
                                elif "all" in udd_name:
                                    udd_choice["UDDTEMPLATE112"] = -tmp
                                    udd_choice["UDDTEMPLATE121"] = tmp
                                    udd_choice["UDDTEMPLATE113"] = -tmp
                                    udd_choice["UDDTEMPLATE131"] = tmp
                                    udd_choice["UDDTEMPLATE123"] = -tmp
                                    udd_choice["UDDTEMPLATE132"] = tmp

                                    udd_choice["UDDTEMPLATE212"] = -tmp
                                    udd_choice["UDDTEMPLATE221"] = tmp
                                    udd_choice["UDDTEMPLATE213"] = -tmp
                                    udd_choice["UDDTEMPLATE231"] = tmp
                                    udd_choice["UDDTEMPLATE223"] = -tmp
                                    udd_choice["UDDTEMPLATE232"] = tmp

                                    udd_choice["UDDTEMPLATE312"] = -tmp
                                    udd_choice["UDDTEMPLATE321"] = tmp
                                    udd_choice["UDDTEMPLATE313"] = -tmp
                                    udd_choice["UDDTEMPLATE331"] = tmp
                                    udd_choice["UDDTEMPLATE323"] = -tmp
                                    udd_choice["UDDTEMPLATE332"] = tmp
                                else:
                                    print "Wrong lambda:",udd_name,udd_choice
                                    sys.exit(1)

                            vardim = [ x==y for x,y in zip((mu,m1,m2,m3,mstop,benchmark.msq,tanbeta,udd_name),benchmark)].count(False)
                            if vardim > dimensions: continue
                            tag = "mu%d_m1%d_m2%d_m3%d_mstop%d_tanbeta%d_udd%s"%(mu,m1,m2,m3,mstop,tanbeta,udd_name)
                            actualmstop = mstop
                            if testtag: tag = testtag + "_" +tag
                            print tag
                            #if os.path.exists(tag+"/Messages.out"):
                            if os.path.exists(tag+"/SPheno.spc.MSSMBpV"):
                                if not targetstop and not overwrite: continue
                                if overwrite:
                                    os.system("rm -rf {0}".format(tag))
                                if targetstop:
                                    pattern = "mu%d_m1%d_m2%d_m3%d_mstop*_tanbeta%d_udd%s"%(mu,m1,m2,m3,tanbeta,udd_name)
                                    if testtag: pattern = testtag + "_" +pattern
                                    actualmstop = getNewMstop(pattern,mstop)
                                    if not actualmstop: continue
                                    tag = "mu%d_m1%d_m2%d_m3%d_mstop%d_tanbeta%d_udd%s"%(mu,m1,m2,m3,actualmstop,tanbeta,udd_name)
                                    if testtag: tag = testtag + "_" +tag
                            os.system("mkdir -p {0}".format(tag))
                            os.chdir(tag)
                            with open( "../../"+template) as infile:
                                content = infile.read()
                                if "sbR_q3L_epsilon" in testtag or "sbR_q3L_epsilon" in scanname:
                                    content = content.replace("M3GTEMPLATE",str((actualmstop+0)*abs(actualmstop+0))) #requires mass squared
                                    #content = content.replace("M3GTEMPLATE",str((actualmstop+100)*abs(actualmstop+100))) #requires mass squared
                                if "sbR_q3L" in testtag or "sbR_q3L" in scanname:
                                    content = content.replace("M3GTEMPLATE","MSTOPTEMPLATE")
                                    #content = content.replace("M3GTEMPLATE",str((actualmstop+200)*abs(actualmstop+200))) #requires mass squared
                                else:
                                    content = content.replace("M3GTEMPLATE","DECOUPSQUARE")
                                content = content.replace("DECOUPLED",str(decoupled))
                                content = content.replace("DECOUPSQUARE",str(decoupled**2))
                                content = content.replace("MUTEMPLATE",str(mu))
                                content = content.replace("M1TEMPLATE",str(m1))
                                content = content.replace("M2TEMPLATE",str(m2))
                                content = content.replace("M3TEMPLATE",str(m3))
                                content = content.replace("MSQTEMPLATE",str(benchmark.msq**2))
                                content = content.replace("MSTOPTEMPLATE",str(actualmstop*abs(actualmstop))) #requires mass squared
                                content = content.replace("TANBETATEMPLATE",str(tanbeta))
                                for udd,value in udd_choice.iteritems():
                                    content = content.replace(udd,str(value))
                            with open("LesHouches.in.MSSMBpV","w") as outfile:
                                outfile.write(content)
                            if "hacked" in testtag:
                                pool.apply_async(os.system,("cd %s/%s && MSSMBpVhacked LesHouches.in.MSSMBpV && mv SPheno.spc.MSSMBpVhacked SPheno.spc.MSSMBpV"%(scanname,tag),))
                            else:
                                pool.apply_async(os.system,("cd %s/%s && MSSMBpV LesHouches.in.MSSMBpV"%(scanname,tag),))
                            os.chdir("..")
    pool.close()
    pool.join()


udd_params_null = {
    "UDDTEMPLATE111":0.,         # L3(1,1,1)
    "UDDTEMPLATE112":0.,         # L3(1,1,2)
    "UDDTEMPLATE113":0.,         # L3(1,1,3)
    "UDDTEMPLATE121":0.,         # L3(1,2,1)
    "UDDTEMPLATE122":0.,         # L3(1,2,2)
    "UDDTEMPLATE123":0.,         # L3(1,2,3)
    "UDDTEMPLATE131":0.,         # L3(1,3,1)
    "UDDTEMPLATE132":0.,         # L3(1,3,2)
    "UDDTEMPLATE133":0.,         # L3(1,3,3)
    "UDDTEMPLATE211":0.,         # L3(2,1,1)
    "UDDTEMPLATE212":0.,         # L3(2,1,2)
    "UDDTEMPLATE213":0.,         # L3(2,1,3)
    "UDDTEMPLATE221":0.,         # L3(2,2,1)
    "UDDTEMPLATE222":0.,         # L3(2,2,2)
    "UDDTEMPLATE223":0.,         # L3(2,2,3)
    "UDDTEMPLATE231":0.,         # L3(2,3,1)
    "UDDTEMPLATE232":0.,         # L3(2,3,2)
    "UDDTEMPLATE233":0.,         # L3(2,3,3)
    "UDDTEMPLATE311":0.,         # L3(3,1,1)
    "UDDTEMPLATE312":0.,         # L3(3,1,2)
    "UDDTEMPLATE313":0.,         # L3(3,1,3)
    "UDDTEMPLATE321":0.,         # L3(3,2,1)
    "UDDTEMPLATE322":0.,         # L3(3,2,2)
    "UDDTEMPLATE323":0.,         # L3(3,2,3)
    "UDDTEMPLATE331":0.,         # L3(3,3,1)
    "UDDTEMPLATE332":0.,         # L3(3,3,2)
    "UDDTEMPLATE333":0.,         # L3(3,3,3)
}

udd_params_mfv = deepcopy(udd_params_null)
udd_params_mfv["UDDTEMPLATE112"] = 3e-12
udd_params_mfv["UDDTEMPLATE121"] = -udd_params_mfv["UDDTEMPLATE112"]
udd_params_mfv["UDDTEMPLATE113"] = 6e-9
udd_params_mfv["UDDTEMPLATE131"] = -udd_params_mfv["UDDTEMPLATE113"]
udd_params_mfv["UDDTEMPLATE123"] = 5e-7
udd_params_mfv["UDDTEMPLATE132"] = -udd_params_mfv["UDDTEMPLATE123"]
udd_params_mfv["UDDTEMPLATE212"] = 1.2e-8
udd_params_mfv["UDDTEMPLATE221"] = -udd_params_mfv["UDDTEMPLATE212"]
udd_params_mfv["UDDTEMPLATE213"] = 1.2e-5
udd_params_mfv["UDDTEMPLATE231"] = -udd_params_mfv["UDDTEMPLATE213"]
udd_params_mfv["UDDTEMPLATE223"] = 4e-5
udd_params_mfv["UDDTEMPLATE232"] = -udd_params_mfv["UDDTEMPLATE223"]
udd_params_mfv["UDDTEMPLATE312"] = 4e-5
udd_params_mfv["UDDTEMPLATE321"] = -udd_params_mfv["UDDTEMPLATE312"]
udd_params_mfv["UDDTEMPLATE313"] = 6e-5
udd_params_mfv["UDDTEMPLATE331"] = -udd_params_mfv["UDDTEMPLATE313"]
udd_params_mfv["UDDTEMPLATE323"] = 2e-4
udd_params_mfv["UDDTEMPLATE332"] = -udd_params_mfv["UDDTEMPLATE323"]

def getNewMstop(pattern,mstoptarget):
    files = glob.glob(pattern+"/SPheno.spc.MSSMBpV")
    massmap = {}
    modulo = 10
    print pattern, files
    for f in files:
        with open(f) as infile:
            massblock  = False
            decayblock = False
            mstopR = int(f[f.find("mstop")+5:f.find("_tanbeta")])
            for line in infile:
                if line.startswith("#"): continue
                elif "Block MASS" in line: 
                    massblock = True
                elif massblock:
                    pdgid, mass = line.split()[:2]
                    pdgid, mass = int(pdgid), float(mass)
                    if pdgid==1000002: 
                        massmap[mstopR] = mass
                        print "Found %d %d"%(mstopR,mass)
                        break
    lowR, lowmass = 0, 0
    highR, highmass = decoupled, decoupled
    for mstopR, mstop in massmap.iteritems():
        if mstop > lowmass and mstop < mstoptarget:
            lowmass = mstop
            lowR = mstopR
        if mstop < highmass and mstop > mstoptarget:
            highmass = mstop
            highR = mstopR
    mstopR = int(((highR-lowR)*(mstoptarget-lowmass)/(highmass -lowmass)+lowR)/modulo)*modulo
    #mstopR = int((lowR+highR)/(2.*modulo))*modulo
    if mstopR in massmap: mstopR = None
    print "Will return:",mstopR
    return mstopR
        
if __name__ == "__main__": main()
