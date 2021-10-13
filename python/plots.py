from collections import namedtuple

class Plot:
    def __init__(self, name, varx, vary, xtitle, ytitle, refhisto, freevars):
        self.name = name
        self.varx = varx
        self.vary = vary
        self.xtitle = xtitle
        self.ytitle = ytitle
        self.refhisto = refhisto
        self.freevars = freevars
        self.graphmap = {}

    def add_point(self, xval, yval, br_id = 0):
        if br_id not in self.graphmap: self.graphmap[br_id] = []
        self.graphmap[br_id].append(xval, yval)

    def do_plot(self):
        can = root.TCanvas()
        leg = root.TLegend(0.2,0.6,0.5,0.9)
        leg.SetLineWidth(0)
        tmpgraphs = []
        for i,(ids, graphpoints) in enumerate(self.graphmap.iteritems()):
            if not graphpoints: continue
            graphpoints = sorted(graphpoints, key=lambda x:x[0])
            print graphpoints
            graph = root.TGraph(len(graphpoints),array.array("d",[x for x,y in graphpoints]),array.array("d",[y for x,y in graphpoints]))
            tmpgraphs.append(graph)
            if i==0: 
                if self.refhisto:
                    self.refhisto.Draw()
                    if self.vary in mass_ranges.keys(): 
                        self.refhisto.SetMinimum(mass_ranges[self.vary][0])
                        self.refhisto.SetMaximum(mass_ranges[self.vary][1])
                    if "BR" in self.vary:
                        if not "udd" in self.varx: self.refhisto.SetMaximum(2.1)
                        else:                                            self.refhisto.SetMaximum(1.1)
                    self.refhisto.GetYaxis().SetTitle(self.ytitle)
                    xaxis = self.refhisto.GetXaxis()
                    yaxis = self.refhisto.GetYaxis()
                else:
                    graph.Draw("AP")
                    graph.GetYaxis().SetTitle(self.ytitle)
                    xaxis = graph.GetXaxis()
                    yaxis = graph.GetYaxis()
                xaxis.SetTitle(self.xtitle)
                xaxis.SetTitleOffset(1)
                if "udd" in self.varx: xaxis.SetRangeUser(-12,1)
                if "width" in self.vary: yaxis.SetRangeUser(1e-30,1)
                if "lifetime" in self.vary: yaxis.SetRangeUser(-8,8)
                if "ctau" in self.vary:  yaxis.SetRangeUser(-8,10)
                if "BR" in self.vary: yaxis.SetRangeUser(1e-5,2.1)
            graph.SetMarkerColor(i+1)
            graph.SetLineColor(i+1)
            graph.SetMarkerStyle(20)
            graph.Draw("same PL")
            if self.vary.endswith("BR"): parent = int(self.vary.split("_")[0])
            else: 
                parent = 0
                ids = [0]
            name = getname([parent]) +" #rightarrow "+getname(ids)
            leg.AddEntry(graph,name,"P")
            #x,y = root.Double(), root.Double()
            #for i in range( graph.GetN()):
            #   graph.GetPoint(i,x,y)
            #   print i,x,y
        if self.vary.endswith("BR"): leg.Draw("same")
        can.SetLogy(0)
        can.SaveAs(plotfolder+self.name+".pdf")
        can.SetLogy(1)
        can.SaveAs(plotfolder+self.name+"_log.pdf")
        can.SetLogy(0)
        for i,(ids, graphpoints) in enumerate(self.graphmap.iteritems()):
            if not graphpoints: continue
            graphpoints = sorted(graphpoints, key=lambda x:x[0])
            graph = root.TGraph(len(graphpoints),array.array("d",[x for x,y in graphpoints]),array.array("d",[y for x,y in graphpoints]))
            for fit in fit_list:
                fit.func.SetParameters(*[1 for i in range(fit.nparam)])
                if fit.name == self.name:
                    graph.Fit(fit.func)
                    graph.Draw("AP")
                    can.SetLogz(0)
                    can.SaveAs(plotfolder+self.name+"_fit.pdf")
                    can.SetLogz(1)
                    can.SaveAs(plotfolder+self.name+"_fit_log.pdf")

#Plot      = namedtuple("Plot"         ,"name, graphmap, varx, vary, xtitle, ytitle, refhisto, freevars")
#Plot2D    = namedtuple("Plot2D"       ,"name, graph, varx, vary, varz, xtitle, ytitle, ztitle, freevars")
#Fit       = namedtuple("Fit"          ,"name, func, nparam")

plotlist = [
        Plot("stop_mass_vs_mtR",{},     "mstop","1000002_mass","mtR","stop mass",0,["mstop"]),
        #Plot("masssplit_vs_udd",{},         "udd","1000024_1000022_mass","log10(lambda332)","DeltaM(C1,N1)",0,["udd"]),
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
        #Plot("neutralino1_width_vs_udd",{}, "udd","1000022_width","log10(lambda332)","N1 width [GeV]",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #
        #Plot("stop_mass_vs_m3",{},     "m3","1000002_mass","m3","stop mass",0,["m3"]),
        #Plot("stop_mass_vs_mstop",{},     "mstop","1000002_mass","mtR","stop mass",0,["mstop"]),
        #Plot("stop_mass_vs_udd",{},     "udd","1000002_mass","log10(lambda332)","stop mass",0,["udd"]),
        #Plot("stop_mass_vs_tanbeta",{},     "tanbeta","1000002_mass","tan beta","stop mass",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("stop_br_vs_udd"  ,{}, "udd","1000002_BR","log10(lambda332)","Stop BR"  ,root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("stop_br_vs_mstop"  ,{}, "mstop","1000002_BR","mtR","Stop BR"  ,0,["mstop"]),
        #Plot("stop_brbs_vs_mstop"  ,{}, "mstop","1000002_BR15","mtR","Stop BR to bs"  ,0,["mstop"]),
        #Plot("stop_br_vs_stop_mass"  ,{}, "1000002_mass","1000002_BR","stop mass","Stop BR"  ,0,["mstop"]),
        #Plot("stop_brbs_vs_stop_mass"  ,{}, "1000002_mass","1000002_BR15","stop mass","Stop BR to bs"  ,0,["mstop"]),
        #Plot("stop_br_vs_neutralino_lifetime"  ,{}, "1000022_lifetime","1000002_BR","log10(N1 lifetime [ns])","Stop BR"  ,root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["udd"]),
        #
        #Plot("gluino_br_vs_neutralino_lifetime",{}, "1000022_lifetime","1000021_BR","log10(N1 lifetime [ns])","Gluino BR",root.TH1F("h1","h1",len(lifetimeaxis)-1,lifetimeaxis),["udd"]),
        #Plot("gluino_br_vs_udd",{}, "udd","1000021_BR","log10(lambda332)","Gluino BR",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("gluino_brtbs_vs_udd",{}, "udd","1000021_BR156","log10(lambda332)","Gluino BR to tbs",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("gluino_brqqq_vs_udd",{}, "udd","1000021_BR111","log10(lambda332)","Gluino BR to qqq",root.TH1F("h1","h1",len(uddaxis)-1,uddaxis),["udd"]),
        #Plot("gluino_br_vs_gluino_mass",{}, "1000021_mass","1000021_BR","gluino mass","Gluino BR",root.TH1F("h1","h1",len(gluinomassaxis)-1,gluinomassaxis),["m3"]),
        #Plot("gluino_mass_vs_m3",{},     "m3","1000021_mass","m3","gluino mass",0,["m3"]),
        #Plot("gluino_mass_vs_tanbeta",{},     "tanbeta","1000021_mass","tan beta","gluino mass",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("gluino_mass_vs_udd",{},     "udd","1000021_mass","log10(lambda332)","gluino mass",0,["udd"]),
        #
        #Plot("Su6_mass_vs_m3",{},     "m3","2000006_mass","m3","Su6 mass",0,["m3"]),
        #Plot("Su6_mass_vs_tanbeta",{},     "tanbeta","2000006_mass","tan beta","Su6 mass",root.TH1F("h1","h1",len(tanbetaaxis)-1,tanbetaaxis),["tanbeta"]),
        #Plot("Su6_mass_vs_udd",{},     "udd","2000006_mass","log10(lambda332)","Su6 mass",0,["udd"]),

        #Plot2D("neutralino1_lifetime_vs_udd_vs_mstop",[],"udd","mstop","1000022_lifetime","log10(lambda332)","mtR","log10(N1 lifetime [cm])",["udd","mstop"]),
        #Plot2D("neutralino1_lifetime_vs_udd_vs_stopmass",[],"udd","1000002_mass","1000022_lifetime","log10(lambda332)","Stop mass","log10(N1 lifetime [cm])",["udd","mstop"]),
        #Plot2D("stop_mass_vs_udd_vs_mstop",[],"udd","mstop","1000002_mass","log10(lambda332)","mtR","Stop mass",["udd","mstop"]),
        #Plot2D("stop_mass_vs_udd_vs_m3",[],"udd","m3","1000002_mass","log10(lambda332)","m3","Stop mass",["udd","m3"]),
        #Plot2D("stop_mass_vs_mstop_vs_m3",[],"mstop","m3","1000002_mass","mtR","m3","Stop mass",["mstop","m3"]), Scan first
        #Plot2D("stop_brbs_vs_udd_vs_stop_mass"  ,[], "udd","1000002_mass","1000002_BR15","log10(lambda332)","Stop mass","Stop BR to bs",["udd","mstop"]),
        #Plot2D("masssplitN2C1_vs_m1_vs_m2",[],    "m1","m2","1000023_1000024_mass","M1","M2","DeltaM(N2,C1)",["m1","m2"]),
        #Plot2D("masssplitN2N1_vs_m1_vs_m2",[],    "m1","m2","1000023_1000022_mass","M1","M2","DeltaM(N2,N1)",["m1","m2"]),
        #
        #Fit("stop_brbs_vs_udd_vs_stop_mass",root.TF2("tf2_stop_brbs_vs_udd_vs_stop_mass", "[0]/(([1]+exp(-[2]*x))*([3]+exp(-[4]*y)))",-2.5,0,400,1600), 5),
        #Fit("gluino_brtbs_vs_udd",root.TF1("tf1_gluino_brtbs_vs_udd", "1./(1+exp(-[0]*(x-[1])))",-6,1), 3),
        #Fit("gluino_brqqq_vs_udd",root.TF1("tf1_gluino_brqqq_vs_udd", "1./(1+exp(-[0]*(x-[1])))",-6,1), 3),
        #Fit("neutralino1_lifetime_vs_udd",root.TF1("tf1_neutralino1_lifetime_vs_udd", "([0]+[1]*x)",-6,1), 2),
]

plots = {plot.name:plot for plot in plots}
