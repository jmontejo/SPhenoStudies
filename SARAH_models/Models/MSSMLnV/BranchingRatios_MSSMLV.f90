! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:06 on 24.8.2021   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_MSSMLV 
 
Use Control 
Use Settings 
Use Couplings_MSSMLV 
Use Model_Data_MSSMLV 
Use LoopCouplings_MSSMLV 
Use Glu3Decays_MSSMLV 
Use Sd3Decays_MSSMLV 
Use Su3Decays_MSSMLV 
Use Cha3Decays_MSSMLV 
Use Chi3Decays_MSSMLV 
Use TreeLevelDecays_MSSMLV 
Use OneLoopDecays_MSSMLV


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MCha,MCha2,MChi,           & 
& MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,              & 
& MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,             & 
& vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,              & 
& mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,gPSd,gTSd,BRSd,gPSu,gTSu,BRSu,gPhh,               & 
& gThh,BRhh,gPAh,gTAh,BRAh,gPHpm,gTHpm,BRHpm,gPGlu,gTGlu,BRGlu,gPFu,gTFu,BRFu,           & 
& gPCha,gTCha,BRCha,gPChi,gTChi,BRChi)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Real(dp),Intent(in) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp),Intent(in) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,vL(3)

Real(dp),Intent(inout) :: gPSd(6,1983),gTSd(6),BRSd(6,1983),gPSu(6,1983),gTSu(6),BRSu(6,1983),gPhh(5,272),      & 
& gThh(5),BRhh(5,272),gPAh(5,270),gTAh(5),BRAh(5,270),gPHpm(8,168),gTHpm(8),             & 
& BRHpm(8,168),gPGlu(1,226),gTGlu,BRGlu(1,226),gPFu(3,138),gTFu(3),BRFu(3,138),          & 
& gPCha(5,679),gTCha(5),BRCha(5,679),gPChi(7,861),gTChi(7),BRChi(7,861)

Complex(dp) :: cplHiggsPP(5),cplHiggsGG(5),cplPseudoHiggsPP(5),cplPseudoHiggsGG(5),cplHiggsZZvirt(5),& 
& cplHiggsWWvirt(5)

Real(dp) :: gGluFdcFdChi(1,3,3,7),gGluFdcFucCha(1,3,3,5),gGluFucFuChi(1,3,3,7),gSdAhChaFu(6,5,5,3),& 
& gSdAhChiFd(6,5,7,3),gSdAhFdGlu(6,5,3,1),gSdSuChaChi(6,6,5,7),gSdChaFdcHpm(6,5,3,8),    & 
& gSdhhChaFu(6,5,5,3),gSdChaGluSu(6,5,1,6),gSdSdChacCha(6,6,5,5),gSdSdChiChi(6,6,7,7),   & 
& gSdhhChiFd(6,5,7,3),gSdHpmChiFu(6,8,7,3),gSdChiGluSd(6,7,1,6),gSdFdFdcSd(6,3,3,6),     & 
& gSdFuFdcSu(6,3,3,6),gSdHpmFdcCha(6,8,3,5),gSdSdFdcFd(6,6,3,3),gSdSuFdcFu(6,6,3,3),     & 
& gSdSdFucFu(6,6,3,3),gSdhhFdGlu(6,5,3,1),gSdHpmFuGlu(6,8,3,1),gSdGluGluSd(6,1,1,6),     & 
& gSuAhChiFu(6,5,7,3),gSuAhFdcCha(6,5,3,5),gSuAhFuGlu(6,5,3,1),gSuSuChiChi(6,6,7,7),     & 
& gSucHpmChiFd(6,8,7,3),gSuhhChiFu(6,5,7,3),gSuChiGluSu(6,7,1,6),gSuSdChicCha(6,6,7,5),  & 
& gSuFdFucSd(6,3,3,6),gSuhhFdcCha(6,5,3,5),gSuSuFdcFd(6,6,3,3),gSucHpmChaFu(6,8,5,3),    & 
& gSuFuFucSu(6,3,3,6),gSucChaFuHpm(6,5,3,8),gSuSdFucFd(6,6,3,3),gSuSuFucFu(6,6,3,3),     & 
& gSucHpmFdGlu(6,8,3,1),gSuhhFuGlu(6,5,3,1),gSuGluGluSu(6,1,1,6),gSuGluSdcCha(6,1,6,5),  & 
& gSuSuChacCha(6,6,5,5),gChaChacChaCha(5,5,5,5),gChaChaChiChi(5,5,7,7),gChaChacFdFd(5,5,3,3),& 
& gChaChacFuFu(5,5,3,3),gChaChicFuFd(5,7,3,3),gChaFdcFuGlu(5,3,3,1),gChiChicChaCha(7,7,5,5),& 
& gChiChiChiChi(7,7,7,7),gChiChicFdFd(7,7,3,3),gChiChicFuFu(7,7,3,3),gChiChacFdFu(7,5,3,3),& 
& gChiFdcFdGlu(7,3,3,1),gChiFucFuGlu(7,3,3,1)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWm

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWm = gamW 
gTVZ = gamZ 
! One-Loop Decays 
If (OneLoopDecays) Then 
Call CalculateOneLoopDecays(gP1LSd,gP1LSu,gP1Lhh,gP1LAh,gP1LHpm,gP1LGlu,              & 
& gP1LFu,gP1LCha,gP1LChi,MSd,MSd2,MSu,MSu2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,            & 
& MChi2,MCha,MCha2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZ2,MVWm,MVWm2,ZD,ZU,               & 
& ZH,ZA,ZP,UV,ZEL,ZER,ZDL,ZDR,ZUL,ZUR,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,               & 
& REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,             & 
& epsI,deltaM,kont)

End if 


gPSd = 0._dp 
gTSd = 0._dp 
BRSd = 0._dp 
Call SdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,            & 
& MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,             & 
& pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,               & 
& L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,             & 
& M1,M2,M3,vd,vu,vL,gPSd(:,1:159),gTSd,BRSd(:,1:159))

Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
If (OneLoopDecays) Then 
gT1LSd(i1) =Sum(gP1LSd(i1,:)) 
If (gT1LSd(i1).Gt.0._dp) BR1LSd(i1,: ) =gP1LSd(i1,:)/gT1LSd(i1) 
End if
End Do 
 

gPSu = 0._dp 
gTSu = 0._dp 
BRSu = 0._dp 
Call SuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,            & 
& MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,             & 
& pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,               & 
& L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,             & 
& M1,M2,M3,vd,vu,vL,gPSu(:,1:159),gTSu,BRSu(:,1:159))

Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
If (OneLoopDecays) Then 
gT1LSu(i1) =Sum(gP1LSu(i1,:)) 
If (gT1LSu(i1).Gt.0._dp) BR1LSu(i1,: ) =gP1LSu(i1,:)/gT1LSu(i1) 
End if
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,            & 
& MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,             & 
& pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,               & 
& L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,             & 
& M1,M2,M3,vd,vu,vL,gPhh,gThh,BRhh)

Do i1=1,5
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
If (OneLoopDecays) Then 
gT1Lhh(i1) =Sum(gP1Lhh(i1,:)) 
If (gT1Lhh(i1).Gt.0._dp) BR1Lhh(i1,: ) =gP1Lhh(i1,:)/gT1Lhh(i1) 
End if
End Do 
 

gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,            & 
& MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,             & 
& pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,               & 
& L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,             & 
& M1,M2,M3,vd,vu,vL,gPAh,gTAh,BRAh)

Do i1=1,5
gTAh(i1) =Sum(gPAh(i1,:)) 
If (gTAh(i1).Gt.0._dp) BRAh(i1,: ) =gPAh(i1,:)/gTAh(i1) 
If (OneLoopDecays) Then 
gT1LAh(i1) =Sum(gP1LAh(i1,:)) 
If (gT1LAh(i1).Gt.0._dp) BR1LAh(i1,: ) =gP1LAh(i1,:)/gT1LAh(i1) 
End if
End Do 
 

! Set Goldstone Widhts 
gTAh(1)=gTVZ


gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFu,MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,              & 
& MVZ2,pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,             & 
& L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,          & 
& M1,M2,M3,vd,vu,vL,gPHpm,gTHpm,BRHpm)

Do i1=1,8
gTHpm(i1) =Sum(gPHpm(i1,:)) 
If (gTHpm(i1).Gt.0._dp) BRHpm(i1,: ) =gPHpm(i1,:)/gTHpm(i1) 
If (OneLoopDecays) Then 
gT1LHpm(i1) =Sum(gP1LHpm(i1,:)) 
If (gT1LHpm(i1).Gt.0._dp) BR1LHpm(i1,: ) =gP1LHpm(i1,:)/gT1LHpm(i1) 
End if
End Do 
 

! Set Goldstone Widhts 
gTHpm(1)=gTVWm


gPGlu = 0._dp 
gTGlu = 0._dp 
BRGlu = 0._dp 
Call GluTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFu,MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,              & 
& MVZ2,pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,             & 
& L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,          & 
& M1,M2,M3,vd,vu,vL,gPGlu(:,1:55),gTGlu,BRGlu(:,1:55))

Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
If (OneLoopDecays) Then 
gT1LGlu =Sum(gP1LGlu(i1,:)) 
If (gT1LGlu.Gt.0._dp) BR1LGlu(i1,: ) =gP1LGlu(i1,:)/gT1LGlu 
End if
End Do 
 

gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,            & 
& MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,             & 
& pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,               & 
& L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,             & 
& M1,M2,M3,vd,vu,vL,gPFu,gTFu,BRFu)

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
If (OneLoopDecays) Then 
gT1LFu(i1) =Sum(gP1LFu(i1,:)) 
If (gT1LFu(i1).Gt.0._dp) BR1LFu(i1,: ) =gP1LFu(i1,:)/gT1LFu(i1) 
End if
End Do 
 

gPCha = 0._dp 
gTCha = 0._dp 
BRCha = 0._dp 
Call ChaTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFu,MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,              & 
& MVZ2,pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,             & 
& L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,          & 
& M1,M2,M3,vd,vu,vL,gPCha(:,1:147),gTCha,BRCha(:,1:147))

Do i1=1,5
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
If (OneLoopDecays) Then 
gT1LCha(i1) =Sum(gP1LCha(i1,:)) 
If (gT1LCha(i1).Gt.0._dp) BR1LCha(i1,: ) =gP1LCha(i1,:)/gT1LCha(i1) 
End if
End Do 
 

gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
Call ChiTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFu,MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,              & 
& MVZ2,pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,             & 
& L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,          & 
& M1,M2,M3,vd,vu,vL,gPChi(:,1:154),gTChi,BRChi(:,1:154))

Do i1=1,7
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
If (OneLoopDecays) Then 
gT1LChi(i1) =Sum(gP1LChi(i1,:)) 
If (gT1LChi(i1).Gt.0._dp) BR1LChi(i1,: ) =gP1LChi(i1,:)/gT1LChi(i1) 
End if
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Sd)) Then 
If (MaxVal(gTSd).Lt.MaxVal(fac3*Abs(MSd))) Then 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,              & 
& gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,    & 
& gSdFdFdcSd,gSdFuFdcSu,gSdHpmFdcCha,gSdSdFdcFd,gSdSuFdcFu,gSdSdFucFu,gSdhhFdGlu,        & 
& gSdHpmFuGlu,gSdGluGluSd,epsI,deltaM,.False.,gTSd,gPSd(:,160:1983),BRSd(:,160:1983))

Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,              & 
& gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,    & 
& gSdFdFdcSd,gSdFuFdcSu,gSdHpmFdcCha,gSdSdFdcFd,gSdSuFdcFu,gSdSdFucFu,gSdhhFdGlu,        & 
& gSdHpmFuGlu,gSdGluGluSd,epsI,deltaM,.True.,gTSd,gPSd(:,160:1983),BRSd(:,160:1983))

End If 
 
End If 
Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,              & 
& gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,    & 
& gSdFdFdcSd,gSdFuFdcSu,gSdHpmFdcCha,gSdSdFdcFd,gSdSuFdcFu,gSdSdFucFu,gSdhhFdGlu,        & 
& gSdHpmFuGlu,gSdGluGluSd,epsI,deltaM,.False.,gTSd,gPSd(:,160:1983),BRSd(:,160:1983))

End If 
Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Su)) Then 
If (MaxVal(gTSu).Lt.MaxVal(fac3*Abs(MSu))) Then 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,             & 
& gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuhhFdcCha,gSuSuFdcFd,gSucHpmChaFu,    & 
& gSuFuFucSu,gSucChaFuHpm,gSuSdFucFd,gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,gSuGluGluSu,     & 
& gSuGluSdcCha,gSuSuChacCha,epsI,deltaM,.False.,gTSu,gPSu(:,160:1983),BRSu(:,160:1983))

Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,             & 
& gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuhhFdcCha,gSuSuFdcFd,gSucHpmChaFu,    & 
& gSuFuFucSu,gSucChaFuHpm,gSuSdFucFd,gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,gSuGluGluSu,     & 
& gSuGluSdcCha,gSuSuChacCha,epsI,deltaM,.True.,gTSu,gPSu(:,160:1983),BRSu(:,160:1983))

End If 
 
End If 
Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,             & 
& gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,gSuhhFdcCha,gSuSuFdcFd,gSucHpmChaFu,    & 
& gSuFuFucSu,gSucChaFuHpm,gSuSdFucFd,gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,gSuGluGluSu,     & 
& gSuGluSdcCha,gSuSuChacCha,epsI,deltaM,.False.,gTSu,gPSu(:,160:1983),BRSu(:,160:1983))

End If 
Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
End Do 
 

! No 3-body decays for hh  
! No 3-body decays for Ah  
! No 3-body decays for Hpm  
If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Glu)) Then 
If (gTGlu.Lt.fac3*Abs(MGlu)) Then 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,epsI,deltaM,          & 
& .False.,gTGlu,gPGlu(:,56:226),BRGlu(:,56:226))

Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,epsI,deltaM,          & 
& .True.,gTGlu,gPGlu(:,56:226),BRGlu(:,56:226))

End If 
 
End If 
Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,epsI,deltaM,          & 
& .False.,gTGlu,gPGlu(:,56:226),BRGlu(:,56:226))

End If 
Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
End Do 
 

! No 3-body decays for Fu  
If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Cha)) Then 
If (MaxVal(gTCha).Lt.MaxVal(fac3*Abs(MCha))) Then 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTAh,gThh,gTHpm,gTSd,gTSu,gTVWm,gTVZ,gChaChacChaCha,gChaChaChiChi,      & 
& gChaChacFdFd,gChaChacFuFu,gChaChicFuFd,gChaFdcFuGlu,epsI,deltaM,.False.,               & 
& gTCha,gPCha(:,148:679),BRCha(:,148:679))

Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTAh,gThh,gTHpm,gTSd,gTSu,gTVWm,gTVZ,gChaChacChaCha,gChaChaChiChi,      & 
& gChaChacFdFd,gChaChacFuFu,gChaChicFuFd,gChaFdcFuGlu,epsI,deltaM,.True.,gTCha,          & 
& gPCha(:,148:679),BRCha(:,148:679))

End If 
 
End If 
Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTAh,gThh,gTHpm,gTSd,gTSu,gTVWm,gTVZ,gChaChacChaCha,gChaChaChiChi,      & 
& gChaChacFdFd,gChaChacFuFu,gChaChicFuFd,gChaFdcFuGlu,epsI,deltaM,.False.,               & 
& gTCha,gPCha(:,148:679),BRCha(:,148:679))

End If 
Do i1=1,5
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Chi)) Then 
If (MaxVal(gTChi).Lt.MaxVal(fac3*Abs(MChi))) Then 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTAh,gThh,gTHpm,gTSd,gTSu,gTVWm,gTVZ,gChiChicChaCha,gChiChiChiChi,      & 
& gChiChicFdFd,gChiChicFuFu,gChiChacFdFu,gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,          & 
& .False.,gTChi,gPChi(:,155:861),BRChi(:,155:861))

Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTAh,gThh,gTHpm,gTSd,gTSu,gTVWm,gTVZ,gChiChicChaCha,gChiChiChiChi,      & 
& gChiChicFdFd,gChiChicFuFu,gChiChacFdFu,gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,          & 
& .True.,gTChi,gPChi(:,155:861),BRChi(:,155:861))

End If 
 
End If 
Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,L1,L2,               & 
& Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,             & 
& M2,M3,vd,vu,vL,gTAh,gThh,gTHpm,gTSd,gTSu,gTVWm,gTVZ,gChiChicChaCha,gChiChiChiChi,      & 
& gChiChicFdFd,gChiChicFuFu,gChiChacFdFu,gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,          & 
& .False.,gTChi,gPChi(:,155:861),BRChi(:,155:861))

End If 
Do i1=1,7
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_MSSMLV 
 