import math
import logging
log = logging.getLogger(__name__)

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
        if len(tmp): return tmp[0]
        else: return 0


    def __str__(self):
        thestr = 'particle(pdgid={}, name={}, symbol={}, mass={}, width={})'.format(self.pdgid, self.name, self.symbol, self.mass, self.width)
        for decay in self.decays:
            if decay[1]<1e-3: break
            thestr += '\n\t'+str(decay)
        return thestr


