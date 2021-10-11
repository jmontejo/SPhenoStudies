import ROOT as root
import os, sys, glob, array, math
from collections import namedtuple
Benchmark = namedtuple("Benchmark","mu, m1, m2, m3, mstop, msq, tanbeta, udd")
Plot            = namedtuple("Plot"         ,"name, graphmap, varx, vary, xtitle, ytitle, refhisto, constraint")
Plot2D      = namedtuple("Plot2D"       ,"name, graph, varx, vary, varz, xtitle, ytitle, ztitle, constraint")
Fit             = namedtuple("Fit"          ,"name, func, nparam")


decoupled = 3000
#scanname = "RPV1L_scan_3TeV_bino_sbR_q3L_epsilon"; benchmark = Benchmark._make([decoupled,200,decoupled,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_wino_sbR_q3L_epsilon"; benchmark = Benchmark._make([decoupled,decoupled,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_higgsino_sbR_q3L_epsilon"; benchmark = Benchmark._make([200,decoupled,decoupled,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_bino"; benchmark = Benchmark._make([decoupled,200,decoupled,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_wino"; benchmark = Benchmark._make([decoupled,decoupled,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
scanname = "RPV1L_scan_3TeV_higgsino"; benchmark = Benchmark._make([200,1000,1000,decoupled,decoupled,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_1TeVewk_bino"; benchmark = Benchmark._make([1000,200,1000,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_1TeVewk_wino"; benchmark = Benchmark._make([1000,1000,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_wino"; benchmark = Benchmark._make([decoupled,decoupled,200,1000,1500,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd) #################GG production
#scanname = "RPV1L_scan_3TeV_higgsino"; benchmark = Benchmark._make([200,decoupled,decoupled,1000,1500,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd) #################GG production
#scanname = "RPV1L_scan_3TeV_wino_sbR_q3L_epsilon"; benchmark = Benchmark._make([decoupled,decoupled,200,1000,1500,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)  #################GG production
#scanname = "RPV1L_scan_5TeV_wino_sbR_q3L_epsilon"; benchmark = Benchmark._make([decoupled,decoupled,200,2000,2500,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)  #################GG production
#scanname = "RPV1L_scan_3TeV_1TeVbino_300gev_higgsino"; benchmark = Benchmark._make([200,1000,decoupled,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_1TeVewk_higgsino"; benchmark = Benchmark._make([200,1000,1000,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_0p6TeVewk_higgsino"; benchmark = Benchmark._make([200,600,600,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_1TeVewk_higgsino"; benchmark = Benchmark._make([200,1000,1000,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_1Tevewk_wino_sbR_q3L_epsilon"; benchmark = Benchmark._make([1000,1000,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
##scanname = "RPV1L_scan_3TeV_1TeVewk_wino"; benchmark = Benchmark._make([1000,1000,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_0p5TeVewk_wino"; benchmark = Benchmark._make([500,500,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_0p5TeVbino_wino"; benchmark = Benchmark._make([decoupled,500,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
##scanname = "RPV1L_scan_3TeV_0p5TeVhiggsino_wino"; benchmark = Benchmark._make([500,decoupled,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_1TeVewk_decouplestop_wino"; benchmark = Benchmark._make([1000,1000,200,decoupled,decoupled,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_0p4TeVewk_decouplestop_wino"; benchmark = Benchmark._make([400,400,200,decoupled,decoupled,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_2TeV_0p5TeVewk_wino"; benchmark = Benchmark._make([500,500,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_0p3TeVewk_wino"; benchmark = Benchmark._make([300,300,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_0p5TeVewk_negmu_wino"; benchmark = Benchmark._make([-500,500,200,decoupled,1000,decoupled,10,"3321em1"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_0p5TeVewk_wino"; benchmark = Benchmark._make([500,500,200,decoupled,1000,decoupled,10,"3321em4"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
#scanname = "RPV1L_scan_3TeV_bino"; benchmark = Benchmark._make([400,200,decoupled,decoupled,1000,decoupled,10,"3321em0"]) #(mu,m1,m2,m3,mstop,msq,tanbeta,udd)
stopMassEigenstate = 10
stopMassEigenstate = None
tag = "lightewk"
ewk = ["mu","m1","m2"]
if "_bino" in scanname: ewk.remove("m1")
if "_wino" in scanname: ewk.remove("m2")
if "_higgsino" in scanname: ewk.remove("mu")


#prefix = "" if not tag else tag+"_"
prefix = ""
#tag = "3g2400"
plotfolder = scanname+"_plots"
if tag: plotfolder += "_"+tag
if stopMassEigenstate: plotfolder += "_stopMassDelta%d"%stopMassEigenstate
plotfolder += "/"
if not os.path.exists(plotfolder): os.mkdir(plotfolder)
mass_ranges = {
    "1000002_mass":(200,3000),
    "2000006_mass":(1000,5000),
    }

root.gROOT.LoadMacro("atlasstyle-00-03-05/AtlasStyle.C")
root.gROOT.LoadMacro("atlasstyle-00-03-05/AtlasUtils.C")
root.SetAtlasStyle()
root.gStyle.SetOptTitle(0)
root.gStyle.SetOptStat(0)
root.gStyle.SetOptFit(0)
root.gStyle.SetPalette(1)
root.gStyle.SetHistLineWidth(2)
root.gStyle.SetLabelFont(43,"XYZ")
root.gStyle.SetLabelSize(30,"XYZ")
root.gStyle.SetTitleFont(43,"XYZ")
root.gStyle.SetTitleSize(30,"XYZ")
root.gROOT.SetBatch(1)
root.TH1.SetDefaultSumw2(1)

print_rpv_mapping = False
debug = True
doNotMergeDecays        = False
doMergeUpDownQuarks = False
doMergeLightQuarks  = True
doprint = False
doplots = True
dobenchmark = False
uddaxis = array.array('d',[-12,1.1])
gluinomassaxis = array.array('d',[0,2500])
lifetimeaxis = array.array('d',[-5,4])
tanbetaaxis = array.array('d',[0,51])

files = glob.glob(scanname+"/"+prefix+"mu*/SPheno.spc.MSSMBpV*")
print files, scanname+"/"+prefix+"mu*/SPheno.spc.MSSMBpV*"
#print (scanname+"/"+prefix+"mu*/SPheno.spc.MSSMBpV"), files
#files = [f for f in files if "m35000" not in f and not "1em-1" in f]
#files = [f for f in files if not "1em6" in f and not "1em5" in f and not "1em4" in f and not "1em3" in f]
#files = [f for f in files if "1em6" in f]
#files = [f for f in files if not "1em7" in f and not "1em6" in f and not "1em5" in f and not "1em4" in f and not "1em3" in f]

if doplots:
    plot_list = [
        #Plot("masssplit_vs_udd",{},     "udd","1000024_1000022_mass","log10(lambda332)","DeltaM(C1,N1)",0,["udd"]),
        #Plot("masssplitC1N1_vs_m1",{},      "m1","1000024_1000022_mass","M1","DeltaM(C1,N1)",0,["m1"]),
        #Plot("masssplitC1N1_vs_m2",{},      "m2","1000024_1000022_mass","M2","DeltaM(C1,N1)",0,["m2"]),
        #Plot("masssplitC1N1_vs_mu",{},      "mu","1000024_1000022_mass","mu","DeltaM(C1,N1)",0,["mu"]),
        #Plot("masssplitC1N1_vs_tanbeta",{}, "tanbeta","1000024_1000022_mass","tanbeta","DeltaM(C1,N1)",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("masssplitN2N1_vs_m1",{},      "m1","1000023_1000022_mass","M1","DeltaM(N2,N1)",0,["m1"]),
        #Plot("masssplitN2N1_vs_m2",{},      "m2","1000023_1000022_mass","M2","DeltaM(N2,N1)",0,["m2"]),
        #Plot("masssplitN2N1_vs_mu",{},      "mu","1000023_1000022_mass","mu","DeltaM(N2,N1)",0,["mu"]),
        #Plot("masssplitN2N1_vs_tanbeta",{}, "tanbeta","1000023_1000022_mass","tanbeta","DeltaM(N2,N1)",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("masssplitN2C1_vs_m1",{},      "m1","1000023_1000024_mass","M1","DeltaM(N2,N1)",0,["m1"]),
        #Plot("masssplitN2C1_vs_m2",{},      "m2","1000023_1000024_mass","M2","DeltaM(N2,N1)",0,["m2"]),
        #Plot("masssplitN2C1_vs_mu",{},      "mu","1000023_1000024_mass","mu","DeltaM(N2,N1)",0,["mu"]),
        #Plot("masssplitN2C1_vs_tanbeta",{}, "tanbeta","1000023_1000024_mass","tanbeta","DeltaM(N2,N1)",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("neutralino1_mass_vs_chargino1_mass",{},    "1000024_mass","1000022_mass","C1 mass","N1 mass",0,ewk),
        #Plot("neutralino1_ctau_vs_stop",{}, "1000002_mass","1000022_ctau","stop mass","log10(N1 ctau [cm])",0,["mstop"]),
        #Plot("neutralino1_ctau_vs_tanbeta",{}, "tanbeta","1000022_ctau","tan beta","log10(N1 ctau [cm])",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("neutralino1_ctau_vs_udd",{}, "udd","1000022_ctau","log10(lambda332)","log10(N1 ctau [cm])",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("neutralino1_lifetime_vs_udd",{}, "udd","1000022_lifetime","log10(lambda332)","log10(N1 lifetime [ns])",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("neutralino1_lifetime_vs_tanbeta",{}, "tanbeta","1000022_lifetime","tan beta","log10(N1 lifetime [ns])",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("neutralino1_br_vs_udd",{}, "udd","1000022_BR","log10(lambda332)","N1 BR",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("neutralino1_br_vs_lifetime",{}, "1000022_lifetime","1000022_BR","N1 lifetime [ns]","N1 BR",0,["udd"]),
        #Plot("neutralino2_lifetime_vs_udd",{}, "udd","1000023_lifetime","log10(lambda332)","log10(N2 lifetime [ns])",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("neutralino2_br_vs_udd",{}, "udd","1000023_BR","log10(lambda332)","N2 BR",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("neutralino2_br_vs_lifetime",{}, "1000023_lifetime","1000023_BR","N2 lifetime [ns]","N2 BR",0,["udd"]),
        #Plot("neutralino2_br_vs_N1lifetime",{}, "1000022_lifetime","1000023_BR","N1 lifetime [ns]","N2 BR",0,["udd"]),
        #Plot("chargino1_lifetime_vs_udd",{}, "udd","1000024_lifetime","log10(lambda332)","log10(C1 lifetime [ns])",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("chargino1_br_vs_udd",{}, "udd","1000024_BR","log10(lambda332)","C1 BR",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("chargino1_br_vs_lifetime",{}, "1000024_lifetime","1000024_BR","C1 lifetime [ns]","C1 BR",root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["udd"]),
        #Plot("chargino1_br_vs_N1lifetime",{}, "1000022_lifetime","1000024_BR","N1 lifetime [ns]","C1 BR",root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["udd"]),
        #Plot("chargino1_br_vs_lifetime_scantanbeta",{}, "1000024_lifetime","1000024_BR","C1 lifetime [ns]","C1 BR",root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["tanbeta"]),
        #Plot("chargino1_br_vs_N1lifetime_scantanbeta",{}, "1000022_lifetime","1000024_BR","N1 lifetime [ns]","C1 BR",root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["tanbeta"]),
        #Plot("chargino1_br_vs_lifetime_scantanbetaudd",{}, "1000024_lifetime","1000024_BR","C1 lifetime [ns]","C1 BR",root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["tanbeta","udd"]),
        #Plot("chargino1_br_vs_N1lifetime_scantanbetaudd",{}, "1000022_lifetime","1000024_BR","N1 lifetime [ns]","C1 BR",root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["tanbeta","udd"]),
        ##Plot("neutralino1_width_vs_udd",{}, "udd","1000022_width","log10(lambda332)","N1 width [GeV]",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),

        ###Plot("stop_mass_vs_m3",{},     "m3","1000002_mass","m3","stop mass",0,["m3"]),
        ###Plot("stop_mass_vs_mstop",{},     "mstop","1000002_mass","mtR","stop mass",0,["mstop"]),
        #Plot("stop_mass_vs_udd",{},     "udd","1000002_mass","log10(lambda332)","stop mass",0,["udd"]),
        ###Plot("stop_mass_vs_tanbeta",{},     "tanbeta","1000002_mass","tan beta","stop mass",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("stop_br_vs_udd"  ,{}, "udd","1000002_BR","log10(lambda332)","Stop BR"  ,root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        ##Plot("stop_br_vs_mstop"  ,{}, "mstop","1000002_BR","mtR","Stop BR"  ,0,["mstop"]),
        ##Plot("stop_brbs_vs_mstop"  ,{}, "mstop","1000002_BR15","mtR","Stop BR to bs"  ,0,["mstop"]),
        #Plot("stop_br_vs_stop_mass"  ,{}, "1000002_mass","1000002_BR","stop mass","Stop BR"  ,0,["mstop"]),
        ##Plot("stop_brbs_vs_stop_mass"  ,{}, "1000002_mass","1000002_BR15","stop mass","Stop BR to bs"  ,0,["mstop"]),
        #Plot("stop_br_vs_neutralino_lifetime"  ,{}, "1000022_lifetime","1000002_BR","log10(N1 lifetime [ns])","Stop BR"  ,root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["udd"]),

        ##Plot("gluino_br_vs_neutralino_lifetime",{}, "1000022_lifetime","1000021_BR","log10(N1 lifetime [ns])","Gluino BR",root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["udd"]),
        #Plot("gluino_br_vs_udd",{}, "udd","1000021_BR","log10(lambda332)","Gluino BR",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        ##Plot("gluino_brtbs_vs_udd",{}, "udd","1000021_BR156","log10(lambda332)","Gluino BR to tbs",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        ##Plot("gluino_brqqq_vs_udd",{}, "udd","1000021_BR111","log10(lambda332)","Gluino BR to qqq",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        ##Plot("gluino_br_vs_gluino_mass",{}, "1000021_mass","1000021_BR","gluino mass","Gluino BR",root.TH1F("h1","h1",len(gluinomassaxis)-1,gluinomassaxis),["m3"]),
        ##Plot("gluino_mass_vs_m3",{},     "m3","1000021_mass","m3","gluino mass",0,["m3"]),
        ##Plot("gluino_mass_vs_tanbeta",{},     "tanbeta","1000021_mass","tan beta","gluino mass",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        ##Plot("gluino_mass_vs_udd",{},     "udd","1000021_mass","log10(lambda332)","gluino mass",0,["udd"]),

        ##Plot("Su6_mass_vs_m3",{},     "m3","2000006_mass","m3","Su6 mass",0,["m3"]),
        ##Plot("Su6_mass_vs_tanbeta",{},     "tanbeta","2000006_mass","tan beta","Su6 mass",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        ##Plot("Su6_mass_vs_udd",{},     "udd","2000006_mass","log10(lambda332)","Su6 mass",0,["udd"]),
    ]
    plot2d_list = [
        #Plot2D("neutralino1_lifetime_vs_udd_vs_mstop",[],"udd","mstop","1000022_lifetime","log10(lambda332)","mtR","log10(N1 lifetime [cm])",["udd","mstop"]),
        #Plot2D("neutralino1_lifetime_vs_udd_vs_stopmass",[],"udd","1000002_mass","1000022_lifetime","log10(lambda332)","Stop mass","log10(N1 lifetime [cm])",["udd","mstop"]),
        #Plot2D("stop_mass_vs_udd_vs_mstop",[],"udd","mstop","1000002_mass","log10(lambda332)","mtR","Stop mass",["udd","mstop"]),
        #Plot2D("stop_mass_vs_udd_vs_m3",[],"udd","m3","1000002_mass","log10(lambda332)","m3","Stop mass",["udd","m3"]),
        #Plot2D("stop_mass_vs_mstop_vs_m3",[],"mstop","m3","1000002_mass","mtR","m3","Stop mass",["mstop","m3"]), #Scan first
        #Plot2D("stop_brbs_vs_udd_vs_stop_mass"  ,[], "udd","1000002_mass","1000002_BR15","log10(lambda332)","Stop mass","Stop BR to bs",["udd","mstop"]),
        Plot2D("masssplitN2C1_vs_m1_vs_m2",[],    "m1","m2","1000023_1000024_mass","M1","M2","DeltaM(N2,C1)",["m1","m2"]),
        Plot2D("masssplitN2N1_vs_m1_vs_m2",[],    "m1","m2","1000023_1000022_mass","M1","M2","DeltaM(N2,N1)",["m1","m2"]),
    ]
    fit_list_2d = [
        #Fit("stop_brbs_vs_udd_vs_stop_mass",root.TF2("tf2_stop_brbs_vs_udd_vs_stop_mass", "[0]/(([1]+exp(-[2]*x))*([3]+exp(-[4]*y)))",-2.5,0,400,1600), 5),
    ]
    fit_list = [
        #Fit("gluino_brtbs_vs_udd",root.TF1("tf1_gluino_brtbs_vs_udd", "1./(1+exp(-[0]*(x-[1])))",-6,1), 3),
        #Fit("gluino_brqqq_vs_udd",root.TF1("tf1_gluino_brqqq_vs_udd", "1./(1+exp(-[0]*(x-[1])))",-6,1), 3),
        #Fit("neutralino1_lifetime_vs_udd",root.TF1("tf1_neutralino1_lifetime_vs_udd", "([0]+[1]*x)",-6,1), 2),
    ]

def main():
    for i,f in enumerate(files):
        ftag = f.replace(scanname+"/"+prefix,"")
        mu, m1, m2, m3, mstop, tanbeta, udd = os.path.dirname(ftag).split("_")
        mu, m1, m2, m3, mstop, tanbeta, udd = int(mu[2:]), int(m1[2:]), int(m2[2:]), int(m3[2:]), int(mstop[5:]), int(tanbeta[7:]), udd[3:]
        parameters = Benchmark(mu, m1, m2, m3, mstop, benchmark.msq, tanbeta, udd)

        particles = {
            1000021:particle(1000021,"gluino","#tilde{g}",                          0,0,[]),
            1000002:particle(1000002,"stop",    "#tilde{t}",                            0,0,[]),
            1000022:particle(1000022,"N1",      "#tilde{#chi_{1}^{0}}",     0,0,[]),
            1000023:particle(1000023,"N2",      "#tilde{#chi_{2}^{0}}",     0,0,[]),
            1000024:particle(1000024,"C1",      "#tilde{#chi_{1}^{#pm}}",   0,0,[]),
        }

        with open(f) as infile:
            if debug: print f
            massblock  = False
            decayblock = False
            for line in infile:
                if line.startswith("#"): continue
                elif "Block MASS" in line: 
                    massblock = True
                elif "DECAY" in line and not "DECAY1L" in line: 
                    decayblock = True
                    massblock = False
                    activedecay = int(line.split()[1])
                    width = float(line.split()[2])
                    particles[activedecay].setWidth(width)
                elif "Block" in line: 
                    decayblock = False
                    massblock = False
                elif massblock:
                    pdgid, mass = line.split()[:2]
                    pdgid, mass = int(pdgid), float(mass)
                    if not pdgid in particles.keys():
                        particles[pdgid] = particle(pdgid, str(pdgid), str(pdgid),0,0,[])
                    particles[pdgid].mass = mass
                elif decayblock:
                    br, nbody, id1, id2, id3 = line.split()[:5]
                    if nbody == "2": particles[activedecay].decays.append(( (abs(int(id1)),abs(int(id2))               ), float(br) ))
                    if nbody == "3": particles[activedecay].decays.append(( (abs(int(id1)),abs(int(id2)),abs(int(id3)) ), float(br) ))

        for pdg,p in particles.iteritems():
            #if pdg==1000021: print p.decays
            p.mergeDecays()
            #if pdg==1000021: sys.exit(1)
    
        if doprint:
            print " ------------ Results "
            print os.path.dirname(ftag).replace("_"," ")
            for pdgid, p in particles.iteritems():
                print pdgid,p

        if doplots:
            for plot in plot_list:
                plotConstraint = True
                for var in parameters._fields:
                    if var in plot.constraint: 
                        continue
                    if var=="mstop" and stopMassEigenstate:
                        if abs(getattr(benchmark, "mstop") - particles[1000002].mass) > stopMassEigenstate:
                            plotConstraint = False
                            break
                    elif getattr(parameters,var)!= getattr(benchmark, var): 
                        if debug: print "Will fail:",f,var, getattr(parameters,var), getattr(benchmark, var)
                        plotConstraint = False
                        break
                if not plotConstraint: continue
                if debug: print "Will use:",f
                varx = decode(plot.varx,particles,parameters)
                vary = decode(plot.vary,particles,parameters)
                if isinstance(vary,list):
                    for ids,vy in vary:
                        if ids not in plot.graphmap.keys(): plot.graphmap[ids] = []
                        #print i,ids,varx,vary,vy
                        plot.graphmap[ids].append((varx,vy))
                else:
                        if 0 not in plot.graphmap.keys(): plot.graphmap[0] = []
                        plot.graphmap[0].append((varx,vary))
            for plot2d in plot2d_list:
                plotConstraint = True
                for var in parameters._fields:
                    if var in plot2d.constraint: 
                        continue
                    if getattr(parameters,var)!= getattr(benchmark, var): 
                        plotConstraint = False
                        break
                if not plotConstraint: continue
                varx = decode(plot2d.varx,particles,parameters)
                vary = decode(plot2d.vary,particles,parameters)
                varz = decode(plot2d.varz,particles,parameters)
                plot2d.graph.append((varx,vary,varz))

    if doplots:
        can = root.TCanvas()
        for plot in plot_list:
            leg = root.TLegend(0.2,0.6,0.5,0.9)
            leg.SetLineWidth(0)
            tmpgraphs = []
            for i,(ids, graphpoints) in enumerate(plot.graphmap.iteritems()):
                if not graphpoints: continue
                graphpoints = sorted(graphpoints, key=lambda x:x[0])
                print graphpoints
                graph = root.TGraph(len(graphpoints),array.array("d",[x for x,y in graphpoints]),array.array("d",[y for x,y in graphpoints]))
                tmpgraphs.append(graph)
                if i==0: 
                    if plot.refhisto:
                        plot.refhisto.Draw()
                        if plot.vary in mass_ranges.keys(): 
                            plot.refhisto.SetMinimum(mass_ranges[plot.vary][0])
                            plot.refhisto.SetMaximum(mass_ranges[plot.vary][1])
                        if "BR" in plot.vary:
                            if not "udd" in plot.varx: plot.refhisto.SetMaximum(2.1)
                            else:                                            plot.refhisto.SetMaximum(1.1)
                        plot.refhisto.GetYaxis().SetTitle(plot.ytitle)
                        xaxis = plot.refhisto.GetXaxis()
                        yaxis = plot.refhisto.GetYaxis()
                    else:
                        graph.Draw("AP")
                        graph.GetYaxis().SetTitle(plot.ytitle)
                        xaxis = graph.GetXaxis()
                        yaxis = graph.GetYaxis()
                    xaxis.SetTitle(plot.xtitle)
                    xaxis.SetTitleOffset(1)
                    if "udd" in plot.varx: xaxis.SetRangeUser(-12,1)
                    if "width" in plot.vary: yaxis.SetRangeUser(1e-30,1)
                    if "lifetime" in plot.vary: yaxis.SetRangeUser(-8,8)
                    if "ctau" in plot.vary:  yaxis.SetRangeUser(-8,10)
                    if "BR" in plot.vary: yaxis.SetRangeUser(1e-5,2.1)
                graph.SetMarkerColor(i+1)
                graph.SetLineColor(i+1)
                graph.SetMarkerStyle(20)
                graph.Draw("same PL")
                if plot.vary.endswith("BR"): parent = int(plot.vary.split("_")[0])
                else: 
                    parent = 0
                    ids = [0]
                name = getname([parent]) +" #rightarrow "+getname(ids)
                leg.AddEntry(graph,name,"P")
                #x,y = root.Double(), root.Double()
                #for i in range( graph.GetN()):
                #   graph.GetPoint(i,x,y)
                #   print i,x,y
            if plot.vary.endswith("BR"): leg.Draw("same")
            can.SetLogy(0)
            can.SaveAs(plotfolder+plot.name+".pdf")
            can.SetLogy(1)
            can.SaveAs(plotfolder+plot.name+"_log.pdf")
            can.SetLogy(0)
            for i,(ids, graphpoints) in enumerate(plot.graphmap.iteritems()):
                if not graphpoints: continue
                graphpoints = sorted(graphpoints, key=lambda x:x[0])
                graph = root.TGraph(len(graphpoints),array.array("d",[x for x,y in graphpoints]),array.array("d",[y for x,y in graphpoints]))
                for fit in fit_list:
                    fit.func.SetParameters(*[1 for i in range(fit.nparam)])
                    if fit.name == plot.name:
                        graph.Fit(fit.func)
                        graph.Draw("AP")
                        can.SetLogz(0)
                        can.SaveAs(plotfolder+plot.name+"_fit.pdf")
                        can.SetLogz(1)
                        can.SaveAs(plotfolder+plot.name+"_fit_log.pdf")
        can.SetLogy(0)
        for plot2d in plot2d_list:
            graphpoints = plot2d.graph
            if not graphpoints: continue
            graph = root.TGraph2D(len(graphpoints),array.array("d",[x for x,y,z in graphpoints]),array.array("d",[y for x,y,z in graphpoints]),array.array("d",[z for x,y,z in graphpoints]))
            themap = {}
            if print_rpv_mapping:
                thecleanmap = {}
                for x,y,z in graphpoints:
                    yround = int(round(y*4,-2)/4)
                    if (x,yround) in themap:
                        if abs(yround-y) > abs(yround-themap[ (x,yround) ][0] ):
                            print (x,y,z), yround, themap[ (x,yround) ][0]
                            continue
                    themap[ (x,yround) ] = (y,z)
                    thecleanmap[ (x,yround) ] = round(z,3)
                for x,y in sorted(thecleanmap.keys()):
                    if y<400:continue
                    z = thecleanmap[(x,y)]
                    print "({0:4d},{1: 2.1f}):{2:.3f},".format(y,x,z)
                sys.exit(1)
            graph.Draw("colz")
            histo = graph.GetHistogram()
            if plot2d.varx in mass_ranges.keys(): 
                histo.SetMinimum(mass_ranges[plot2d.varx][0])
                histo.SetMaximum(mass_ranges[plot2d.varx][1])
            if plot2d.vary in mass_ranges.keys(): 
                histo.SetMinimum(mass_ranges[plot2d.vary][0])
                histo.SetMaximum(mass_ranges[plot2d.vary][1])
            can.SetRightMargin(0.2)
            xaxis = histo.GetXaxis()
            xaxis.SetTitle(plot2d.xtitle)
            xaxis.SetTitleOffset(1)
            yaxis = histo.GetYaxis()
            yaxis.SetTitle(plot2d.ytitle)
            yaxis.SetTitleOffset(1.2)
            zaxis = histo.GetZaxis()
            zaxis.SetTitle(plot2d.ztitle)
            zaxis.SetTitleOffset(1.2)
            if "ctau" in plot2d.varz:  histo.GetZaxis().SetRangeUser(-8,10)
            if "BR" in plot2d.varz:  histo.GetZaxis().SetRangeUser(0,1)
            if "1000002_mass" in plot2d.vary:  histo.GetYaxis().SetRangeUser(200,2000)
            can.cd()
            root.gPad.Update()
            can.SetLogz(0)
            can.SaveAs(plotfolder+plot2d.name+".pdf")
            can.SetLogz(1)
            can.SaveAs(plotfolder+plot2d.name+"_log.pdf")
            if "udd" in plot2d.varx: 
                xaxis.SetRangeUser(-3,1)
                root.gPad.Update()
                can.SetLogz(0)
                can.SaveAs(plotfolder+plot2d.name+"_short.pdf")
                can.SetLogz(1)
                can.SaveAs(plotfolder+plot2d.name+"_short_log.pdf")
            for fit in fit_list_2d:
                fit.func.SetParameters(*[1 for i in range(fit.nparam)])
                if fit.name == plot2d.name:
                    histo.Fit(fit.func)
                    can.SetLogz(0)
                    can.SaveAs(plotfolder+plot2d.name+"_fit.pdf")
                    can.SetLogz(1)
                    can.SaveAs(plotfolder+plot2d.name+"_fit_log.pdf")

def getname(ids):
    name = ""
    for part in ids:
        if   part == 1000002: name += "#tilde{t} " 
        elif part == 1000021: name += "#tilde{g} " 
        elif part == 1000022: name += "#tilde{#chi_{1}^{0}} " 
        elif part == 1000023: name += "#tilde{#chi_{2}^{0}} " 
        elif part == 1000024: name += "#tilde{#chi_{1}^{#pm}} " 
        elif part ==             1: name += "q " 
        elif part ==             2: name += "q' " 
        elif part ==            11: name += "l " 
        elif part ==            12: name += "v " 
        elif part ==             5: name += "b " 
        elif part ==             6: name += "t " 
        elif part ==             3: name += "s " 
        elif part ==             4: name += "c " 
        elif part ==            25: name += "h " 
        elif part ==            24: name += "W " 
        elif part ==            23: name += "Z " 
        else:                                   name += str(part)+" "
    return name

class particle:
    def __init__(self,pdgid, name, symbol, mass, width, decays):
        self.pdgid = pdgid
        self.name = name
        self.symbol = symbol
        self.mass = mass
        self.width = width
        self.decays = decays
    
    def setWidth(self,width):
        self.width = width
        self.ctau  = math.log10(3e10 * 6.582119514e-25 / width)
        self.lifetime  = math.log10(1e9 * 6.582119514e-25 / width)

    def mapids(self,ids):
        tmpids = sorted(list(ids))
        if doNotMergeDecays: return tuple(tmpids)

        if doMergeUpDownQuarks:
            tmpids = sorted([(x+1)%2+1 if x<=6 else x for x in tmpids])
            print tmpids, sorted(list(ids))
        else: #else doMergeUpDownQuarks
            if len(tmpids)==2 or tmpids[-1]>4:
                if tmpids[0] == tmpids[1]:
                    if tmpids[0] == 2 or tmpids[0] == 3 or tmpids[0] == 4: 
                        tmpids[0] = 1
                        tmpids[1] = 1
                    if tmpids[0] == 13 or tmpids[0] == 15: 
                        tmpids[0] = 11
                        tmpids[1] = 11
                    if tmpids[0] == 14 or tmpids[0] == 16: 
                        tmpids[0] = 12
                        tmpids[1] = 12
                if tmpids[0] == tmpids[1]-1:
                    if tmpids[0] == 1 or tmpids[0] == 3: 
                        tmpids[0] = 1
                        tmpids[1] = 2
                    if tmpids[0] == 13 or tmpids[0] == 15: 
                        tmpids[0] = 11
                        tmpids[1] = 12
            elif len(tmpids)==3: #only if 3 light quarks
                tmpids[0] = 1
                tmpids[1] = 1
                tmpids[2] = 1
            if doMergeLightQuarks:
                tmpids = sorted([x if x>=5 else 1 for x in tmpids])
            #print ids,"-->",tmpids
        return tuple(tmpids)
        
    def mergeDecays(self):
        mergedecay = {}
        for decay in self.decays:
            theids = self.mapids(decay[0])
            if not theids in mergedecay.keys():
                mergedecay[theids] = decay[1]
            else:
                mergedecay[theids] += decay[1]
        self.decays = [(ids,br) for ids, br in mergedecay.iteritems()]
        self.decays.sort(key=lambda x: x[1],reverse=True)


    def skimmedDecays(self,thr,onlythis):
        if not onlythis: return [(ids,br) for (ids,br) in self.decays if br > thr]
        theids = tuple(int(i) for i in onlythis)
        tmp = [br for (ids,br) in self.decays if ids==theids]
        if debug: print theids, tmp
        if len(tmp): return tmp[0]
        else: return 0


    def __str__(self):
        thestr = 'particle(pdgid=%d, name=%s, symbol=%s, mass=%f, width=%f)' % (self.pdgid, self.name, self.symbol, self.mass, self.width)
        for decay in self.decays:
            if decay[1]<1e-3: break
            thestr += '\n\t'+str(decay)
        return thestr

def decode(var,particles,parameters):
    if not "_" in var: 
        if "udd" in var: return -float(getattr(parameters, var)[6:])
        return getattr(parameters, var)
    if len(var.split("_"))==3:
        pdgid1, pdgid2, var = var.split("_")
        particle1 = particles[int(pdgid1)]
        particle2 = particles[int(pdgid2)]
        return getattr(particle1, var)- getattr(particle2, var)
    else:
        pdgid, var = var.split("_")
        particle = particles[int(pdgid)]
        if not "BR" in var: return getattr(particle, var)
        return particle.skimmedDecays(1e-3,var.replace("BR",""))


if __name__ == "__main__": main()
