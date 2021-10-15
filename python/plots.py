from collections import namedtuple
import ROOT as root
import os, sys, glob, array, math

root.gROOT.LoadMacro("atlasrootstyle/AtlasStyle.C")
root.gROOT.LoadMacro("atlasrootstyle/AtlasUtils.C")
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

import logging
log = logging.getLogger(__name__)


class Plot:
    def __init__(self, name, xvar, yvar, xtitle, ytitle, freevars=None, rangex=None, rangey=None, options=""):
        self.name = name
        self.xvar = xvar
        self.yvar = yvar
        self.xtitle = xtitle
        self.ytitle = ytitle
        self.freevars = freevars if freevars else [xvar]
        self.rangex = rangex if rangex else getRange(xvar)
        self.rangey = rangey if rangey else getRange(yvar)
        self.options = options if options else getOptions(xvar, yvar)
        self.graphmap = {}

    def add_point(self, xval, yval, isBR=False):
        
        if not isBR:
            if 0 not in self.graphmap: self.graphmap[0] = []
            self.graphmap[0].append((float(xval), float(yval)))
        else:
            for br_ids, br in yval:
                log.debug("Adding point: {:<20} id={:<2} xval={:<10} yval={:<10}".format(self.name,str(br_ids), xval,br))
                if br_ids not in self.graphmap: self.graphmap[br_ids] = []
                self.graphmap[br_ids].append((float(xval), float(br)))

    def do_plot(self, plotfolder):
        can = root.TCanvas()
        leg = root.TLegend(0.2,0.6,0.5,0.9)
        leg.SetLineWidth(0)
        tmpgraphs = []
        for i,(ids, graphpoints) in enumerate(self.graphmap.items()):
            if not graphpoints: continue
            graphpoints = sorted(graphpoints, key=lambda x:x[0])
            log.debug("About to plot {} {} {}, id={}".format(self.name, self.xvar,self.yvar, ids))
            log.debug("With values {}".format(graphpoints))
            graph = root.TGraph(len(graphpoints),array.array("d",[x for x,y in graphpoints]),array.array("d",[y for x,y in graphpoints]))
            tmpgraphs.append(graph)
            if i==0: 
                if False:
                    pass
                #if self.refhisto:
                #    self.refhisto.Draw()
                #    if self.yvar in mass_ranges.keys(): 
                #        self.refhisto.SetMinimum(mass_ranges[self.yvar][0])
                #        self.refhisto.SetMaximum(mass_ranges[self.yvar][1])
                #    if "BR" in self.yvar:
                #        if not "udd" in self.xvar: self.refhisto.SetMaximum(2.1)
                #        else:                                            self.refhisto.SetMaximum(1.1)
                #    self.refhisto.GetYaxis().SetTitle(self.ytitle)
                #    xaxis = self.refhisto.GetXaxis()
                #    yaxis = self.refhisto.GetYaxis()
                else:
                    graph.Draw("AP")
                    graph.GetYaxis().SetTitle(self.ytitle)
                    xaxis = graph.GetXaxis()
                    yaxis = graph.GetYaxis()
                xaxis.SetTitle(self.xtitle)
                xaxis.SetTitleOffset(1)
                if self.rangey:
                    graph.SetMinimum(self.rangey[0])
                    graph.SetMaximum(self.rangey[1])
                if self.rangex:
                    graph.GetXaxis().SetLimits(*self.rangex)

            graph.SetMarkerColor(i+1)
            graph.SetLineColor(i+1)
            graph.SetMarkerStyle(20)
            opt = "same P"
            if not "noline" in self.options:
                opt += "L"
            graph.Draw(opt)
            if self.yvar.endswith("BR"): parent = int(self.yvar.split("_")[0])
            else: 
                parent = 0
                ids = [0]
            name = getname([parent]) +" #rightarrow "+getname(ids)
            leg.AddEntry(graph,name,"P")
        if self.yvar.endswith("BR"): leg.Draw("same")

        if "logx" in self.options:
            can.SetLogx(1)

        os.makedirs(plotfolder,exist_ok=True)
        can.SetLogy(0)
        can.SaveAs(os.path.join(plotfolder,self.name+".pdf"))
        can.SetLogy(1)
        can.SaveAs(os.path.join(plotfolder,self.name+"_log.pdf"))
        can.SetLogy(0)
        for i,(ids, graphpoints) in enumerate(self.graphmap.items()):
            if not graphpoints: continue
            graphpoints = sorted(graphpoints, key=lambda x:x[0])
            graph = root.TGraph(len(graphpoints),array.array("d",[x for x,y in graphpoints]),array.array("d",[y for x,y in graphpoints]))

class Plot2D:
    def __init__(self, name, xvar, yvar, zvar, xtitle, ytitle, ztitle, freevars=None, rangex=None, rangey=None, rangez=None, options=""):
        self.name = name
        self.xvar = xvar
        self.yvar = yvar
        self.zvar = zvar
        self.xtitle = xtitle
        self.ytitle = ytitle
        self.ztitle = ztitle
        self.freevars = freevars if freevars else [xvar, yvar]
        self.rangex = rangex if rangex else getRange(xvar)
        self.rangey = rangey if rangey else getRange(yvar)
        self.rangez = rangez if rangez else getRange(zvar)
        self.options = options if options else getOptions(xvar, yvar, zvar)
        self.graphpoints = []

    def add_point(self, xval, yval, zval):
        self.graphpoints.append((float(xval), float(yval), float(zval)))


    def do_plot(self, plotfolder):
        can = root.TCanvas()
        leg = root.TLegend(0.2,0.6,0.5,0.9)
        leg.SetLineWidth(0)
        if not self.graphpoints: return
        graph = root.TGraph2D(len(self.graphpoints),array.array("d",[x for x,y,z in self.graphpoints]),array.array("d",[y for x,y,z in self.graphpoints]),array.array("d",[z for x,y,z in self.graphpoints]))
        graph.Draw("colz1")
        histo = graph.GetHistogram()
        can.SetRightMargin(0.2)
        xaxis = histo.GetXaxis()
        xaxis.SetTitle(self.xtitle)
        xaxis.SetTitleOffset(1)
        yaxis = histo.GetYaxis()
        yaxis.SetTitle(self.ytitle)
        yaxis.SetTitleOffset(1.2)
        zaxis = histo.GetZaxis()
        zaxis.SetTitle(self.ztitle)
        zaxis.SetTitleOffset(1.2)
        if "ctau" in self.zvar:  histo.GetZaxis().SetRangeUser(-8,10)
        if "BR" in self.zvar:  histo.GetZaxis().SetRangeUser(0,1)
        if "1000002_mass" in self.yvar:  histo.GetYaxis().SetRangeUser(200,2000)
        can.cd()
        root.gPad.Update()

        if "logx" in self.options:
            can.SetLogx(1)
        if "logz" in self.options:
            can.SetLogz(1)
        os.makedirs(plotfolder,exist_ok=True)
        can.SetLogz(0)
        can.SaveAs(os.path.join(plotfolder,self.name+".pdf"))
        can.SetLogz(1)
        can.SaveAs(os.path.join(plotfolder,self.name+"_log.pdf"))
        if "udd" in self.xvar: 
            xaxis.SetRangeUser(-3,1)
            root.gPad.Update()
            can.SetLogz(0)
            can.SaveAs(os.path.join(plotfolder,self.name+"_short.pdf"))
            can.SetLogz(1)
            can.SaveAs(os.path.join(plotfolder,self.name+"_short_log.pdf"))

def getname(ids):
    name = ""
    for part in ids:
        if   abs(part) == 1000002: name += "#tilde{t} " 
        elif abs(part) == 1000021: name += "#tilde{g} " 
        elif abs(part) == 1000022: name += "#tilde{#chi_{1}^{0}} " 
        elif abs(part) == 1000023: name += "#tilde{#chi_{2}^{0}} " 
        elif abs(part) == 1000024: name += "#tilde{#chi_{1}^{#pm}} " 
        elif abs(part) ==       1: name += "q " 
        elif abs(part) ==       2: name += "q' " 
        elif abs(part) ==      11: name += "l " 
        elif abs(part) ==      12: name += "v " 
        elif abs(part) ==       5: name += "b " 
        elif abs(part) ==       6: name += "t " 
        elif abs(part) ==       3: name += "s " 
        elif abs(part) ==       4: name += "c " 
        elif abs(part) ==      25: name += "h " 
        elif abs(part) ==      24: name += "W " 
        elif abs(part) ==      23: name += "Z " 
        else:                      name += str(part)+" "
    return name

def getRange(var):
    if "BR" in var:
        return (1e-6,2.1)
    if "ctau" in var:
        return (1e-8,1e10)
    if "lifetime" in var:
        return (1e-8,1e8)
    if "udd" in var:
        return (1e-4,1.5)

def getOptions(xvar, yvar, zvar=None):
    if "udd" in xvar:
        return "logx"
    if "udd" in yvar:
        return "logy"
    if zvar:
        if "lifetime" in zvar:
            return "logz"
    return ""

plotlist = [
    Plot("stop_mass_vs_udd323",     "udd323","1000002_mass","lambda''323","stop mass"),
    Plot("stop_mass_vs_mtR",     "mtR","1000002_mass","mtR","stop mass"),
    Plot("stop_mass_vs_mtR_freeudd323",     "mtR","1000002_mass","mtR","stop mass",["1000002_mass","udd323"], options="noline"),
    Plot("masssplit_vs_udd323",         "udd323","1000024_1000022_mass","lambda''323","DeltaM(C1,N1)"),
    Plot("stop_br_vs_udd323"  , "udd323","1000002_BR","lambda''323","Stop BR"),
]

plotlist2D = [
    Plot2D("neutralino1_lifetime_vs_udd323_vs_stopmass","udd323","1000002_mass","1000022_lifetime","lambda323","Stop mass","log10(N1 lifetime [cm])"),
    Plot2D("stop_mass_vs_mtR_vs_udd323","udd323","mtR","1000002_mass","lambda323","mtR","Stop mass"),
]

plots   = {plot.name:plot for plot in plotlist}
plots2D = {plot.name:plot for plot in plotlist2D}
