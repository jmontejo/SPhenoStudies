import math
import logging
log = logging.getLogger(__name__)

class particle:
    #Using a made-up code for offshell W and Z, inspired by excited quarks
    offshellZ = 4000023
    offshellW = 4000024
    offshellH = 4000025

    def __init__(self,pdgid, symbol, mass, width, decays):
        self.pdgid = pdgid
        self.name = getname(pdgid)
        self.symbol = symbol
        self.mass = mass
        self.width = width
        self.decays = decays
    
    def setWidth(self,width):
        self.width = width
        self.ctau  = math.log10(3e10 * 6.582119514e-25 / width)
        self.lifetime  = math.log10(1e9 * 6.582119514e-25 / width)

    def mapids(self,ids):
        ''' Transform ids of the decay products so that they can be merged if
            identical after transformation '''
        tmpabsids = sorted(list(abs(i) for i in ids))
        if isRPCtoWdecay(self.pdgid, ids):
            tmpabsids = [self.offshellW, tmpabsids[-1]] #order is relevant
        elif isRPCtoZdecay(self.pdgid, ids):
            tmpabsids = [self.offshellZ, tmpabsids[-1]] #order is relevant
        return tuple(tmpabsids)

        #if len(tmpids)==2 or tmpids[-1]>4:
        #    if tmpids[0] == tmpids[1]:
        #        if tmpids[0] == 2 or tmpids[0] == 3 or tmpids[0] == 4: 
        #            tmpids[0] = 1
        #            tmpids[1] = 1
        #        if tmpids[0] == 13 or tmpids[0] == 15: 
        #            tmpids[0] = 11
        #            tmpids[1] = 11
        #        if tmpids[0] == 14 or tmpids[0] == 16: 
        #            tmpids[0] = 12
        #            tmpids[1] = 12
        #    if tmpids[0] == tmpids[1]-1:
        #        if tmpids[0] == 1 or tmpids[0] == 3: 
        #            tmpids[0] = 1
        #            tmpids[1] = 2
        #        if tmpids[0] == 13 or tmpids[0] == 15: 
        #            tmpids[0] = 11
        #            tmpids[1] = 12
        #elif len(tmpids)==3: #only if 3 light quarks
        #    tmpids[0] = 1
        #    tmpids[1] = 1
        #    tmpids[2] = 1
        #return tuple(tmpids)
        
    def mergeDecays(self):
        mergedecay = {}
        possibleHcount = 0
        possibleHtobb = 0
        possibleHtoother = 0
        for decay in self.decays:
            theids = self.mapids(decay[0])
            if self.offshellZ in theids:
                if sum([abs(x)==5 for x in theids])==2:
                    possibleHtobb = decay[1]
                else:
                    possibleHtoother += decay[1]
                    possibleHcount   += 1
            if not theids in mergedecay.keys():
                mergedecay[theids] = decay[1]
            else:
                mergedecay[theids] += decay[1]

        if possibleHcount:
            possibleHtoother /= possibleHcount
            if possibleHtobb > 2*possibleHtoother:
                log.warning("Branching ratio of neutral boson to bb is double the average of others, will assume it's a Higgs")
                log.warning("Please confirm by running without merged decays")
                keystodel = []
                keystoadd = []
                for decay in mergedecay:
                    if decay[0] is self.offshellZ:
                        keystoadd.append(((self.offshellH, decay[1]) , mergedecay[decay]))
                        keystodel.append(decay)
                for key in keystodel:
                    del mergedecay[key]
                for key, val in keystoadd:
                    mergedecay[key] = val

        self.checkProblematicMerge(mergedecay)

        self.decays = [(ids,br) for ids, br in mergedecay.items()]
        self.decays.sort(key=lambda x: x[1],reverse=True)

    def checkProblematicMerge(self,mergedecay):
        for decay in mergedecay:
            if decay[0] is self.offshellZ and (23, decay[1]) in mergedecay:
                log.error("Both on-shell and off-shell Z's in decay of %s",self.name)
                log.error("This is an indication of decays via offshell squarks being flagged as offshell Z's")
                log.error("Please run without merge decays or be conscious that some plots might be misleading")
            elif decay[0] is self.offshellW and (24, decay[1]) in mergedecay:
                log.error("Both on-shell and off-shell W's in decay of %s",self.name)
                log.error("This is an indication of decays via offshell squarks being flagged as offshell W's")
                log.error("Please run without merge decays or be conscious that some plots might be misleading")
            elif decay[0] is self.offshellH and (25, decay[1]) in mergedecay:
                log.error("Both on-shell and off-shell H's in decay of %s",self.name)
                log.error("This is an indication of decays via offshell squarks being flagged as offshell H's")
                log.error("Please run without merge decays or be conscious that some plots might be misleading")

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

def getname(part,mergedecays=False):
    if   abs(part) == 1000002: name ="#tilde{t}" 
    elif abs(part) == 1000021: name ="#tilde{g}" 
    elif abs(part) == 1000022: name ="#tilde{#chi_{1}^{0}}" 
    elif abs(part) == 1000023: name ="#tilde{#chi_{2}^{0}}" 
    elif abs(part) == 1000024: name ="#tilde{#chi_{1}^{#pm}}" 
    elif abs(part) == particle.offshellZ: name ="Z^{*}" 
    elif abs(part) == particle.offshellW: name ="W^{*}" 
    elif abs(part) == particle.offshellH: name ="H^{*}" 
    elif abs(part) ==       1: name ="q" if mergedecays else"d"
    elif abs(part) ==       2: name ="q" if mergedecays else"u"
    elif abs(part) ==       3: name ="q" if mergedecays else"s" 
    elif abs(part) ==       4: name ="q" if mergedecays else"c" 
    elif abs(part) ==      11: name ="l" if mergedecays else"e" 
    elif abs(part) ==      13: name ="l" if mergedecays else"#mu" 
    elif abs(part) ==      15: name ="l" if mergedecays else"#tau" 
    elif abs(part) ==      12: name ="v" 
    elif abs(part) ==      14: name ="v" 
    elif abs(part) ==      16: name ="v" 
    elif abs(part) ==       5: name ="b" 
    elif abs(part) ==       6: name ="t" 
    elif abs(part) ==      25: name ="h" 
    elif abs(part) ==      24: name ="W" 
    elif abs(part) ==      23: name ="Z" 
    else:                      name = str(part)
    return name


def isSUSY(particleid):
    return abs(particleid)//1000000==1

def isEwkino(particleid):
    absid = abs(particleid)%1000000
    return absid in (22,23,25,35,24,37)

def getRPC3bodyDecay(parentid, ids):
    ''' Return False if it's not a SUSY -> SUSY SM1 SM2 decay
        else returns a tuple with the two SM pdgids
    '''
    if len(ids)!=3: return False
    if not isSUSY(parentid): return False
    if not isEwkino(parentid): return False #avoid flagging gluino -> bb N1
    notSUSY = [x for x in ids if not isSUSY(x)]
    if len(notSUSY) !=2: return False
    if any([abs(x) > 16 for x in notSUSY]): return False
    return notSUSY

def isRPCtoWdecay(parentid, ids):
    notSUSY = getRPC3bodyDecay(parentid, ids)
    if not notSUSY: return False
    sumcharge = charge3(notSUSY[0]) + charge3(notSUSY[1])
    return abs(sumcharge)==3

def isRPCtoZdecay(parentid, ids):
    notSUSY = getRPC3bodyDecay(parentid, ids)
    if not notSUSY: return False
    sumcharge = charge3(notSUSY[0]) + charge3(notSUSY[1])
    return abs(sumcharge)==0

def charge3(particleid, testNegative=True):
    
    if particleid==1:  return -1
    if particleid==2:  return  2
    if particleid==3:  return -1
    if particleid==4:  return  2
    if particleid==5:  return -1
    if particleid==6:  return  2
    if particleid==11: return  3
    if particleid==12: return  0
    if particleid==13: return  3 
    if particleid==14: return  0
    if particleid==15: return  3
    if particleid==16: return  0

    if testNegative:
        return -charge3(-particleid, testNegative=False)
    log.warning("Particle id not known, can not compute charge: %d",particleid)
    return 0
