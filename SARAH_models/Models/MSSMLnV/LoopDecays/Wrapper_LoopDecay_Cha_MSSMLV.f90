! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:06 on 24.8.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Cha_MSSMLV
Use Model_Data_MSSMLV 
Use Kinematics 
Use OneLoopDecay_Cha_MSSMLV 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Cha(MSdOS,MSd2OS,MSuOS,MSu2OS,MhhOS,Mhh2OS,MAhOS,             & 
& MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,MChaOS,MCha2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,         & 
& MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZDOS,ZUOS,ZHOS,ZAOS,ZPOS,UVOS,              & 
& ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,           & 
& MFu,MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,              & 
& MVZ2,pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,g1,g2,g3,Yd,Ye,             & 
& L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,          & 
& M1,M2,M3,vd,vu,vL,dg1,dg2,dg3,dMu,dBmu,dREps,dBeps,dYd,dTd,dYe,dTe,dL1,dT1,            & 
& dL2,dT2,dYu,dTu,dmq2,dml2,dmlHd2,dmHd2,dmHu2,dmd2,dmu2,dme2,dM1,dM2,dM3,               & 
& dvd,dvu,dvL,dpG,dZD,dZU,dZH,dZA,dZP,dUV,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,          & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSu,Zfhh,ZfAh,ZfHpm,ZfL0,ZfLm,           & 
& ZfLp,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,cplAhAhhh,cplAhcHpmVWm,cplAhhhVZ,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,            & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcHpmVPVWm,cplcHpmVWmVZ,         & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,         & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,              & 
& cplhhSucSu,cplhhVZVZ,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,              & 
& cplHpmSucSd,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSucVWm,cplSucSdVWm,    & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,ctcplcChacFuSdL,ctcplcChacFuSdR,ctcplcChaChaAhL,      & 
& ctcplcChaChaAhR,ctcplcChaChahhL,ctcplcChaChahhR,ctcplcChaChaVPL,ctcplcChaChaVPR,       & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChiHpmL,ctcplcChaChiHpmR,ctcplcChaChiVWmL,    & 
& ctcplcChaChiVWmR,ctcplcChaFdcSuL,ctcplcChaFdcSuR,GcplcChaChiHpmL,GcplcChaChiHpmR,      & 
& GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplcChaChiHpmL,GosZcplcChaChiHpmR,GosZcplcHpmVPVWm,    & 
& GosZcplHpmcVWmVP,GZcplcChaChiHpmL,GZcplcChaChiHpmR,GZcplcHpmVPVWm,GZcplHpmcVWmVP,      & 
& ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplcChaChahhL,            & 
& ZcplcChaChahhR,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,            & 
& ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcChaFdcSuL,        & 
& ZcplcChaFdcSuR,ZcplcFdChaSuL,ZcplcFdChaSuR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFuFuVPL,     & 
& ZcplcFuFuVPR,ZcplChaFucSdL,ZcplChaFucSdR,ZcplChiChacHpmL,ZcplChiChacHpmR,              & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplcHpmVPVWm,ZcplcVWmVPVWm,ZcplHpmcHpmVP,             & 
& ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplSucSuVP,ZRUZD,ZRUZU,ZRUZH,ZRUZA,ZRUZP,ZRUZN,             & 
& ZRUUM,ZRUUP,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LCha)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vL(3)

Real(dp),Intent(in) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp),Intent(in) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dmlHd2(3),dmHd2,dmHu2,dvd,dvu,dvL(3),dZH(5,5),dZA(5,5),dZP(8,8),          & 
& dSinTW,dCosTW,dTanTW

Complex(dp),Intent(in) :: dMu,dBmu,dREps(3),dBeps(3),dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dL1(3,3,3),            & 
& dT1(3,3,3),dL2(3,3,3),dT2(3,3,3),dYu(3,3),dTu(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),      & 
& dmu2(3,3),dme2(3,3),dM1,dM2,dM3,dpG,dZD(6,6),dZU(6,6),dUV(7,7),dZEL(5,5),              & 
& dZER(5,5),dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp),Intent(in) :: cplAhAhhh(5,5,5),cplAhcHpmVWm(5,8),cplAhhhVZ(5,5),cplAhHpmcHpm(5,8,8),cplAhHpmcVWm(5,8),& 
& cplAhSdcSd(5,6,6),cplAhSucSu(5,6,6),cplcChacFuSdL(5,3,6),cplcChacFuSdR(5,3,6),         & 
& cplcChaChaAhL(5,5,5),cplcChaChaAhR(5,5,5),cplcChaChahhL(5,5,5),cplcChaChahhR(5,5,5),   & 
& cplcChaChaVPL(5,5),cplcChaChaVPR(5,5),cplcChaChaVZL(5,5),cplcChaChaVZR(5,5),           & 
& cplcChaChiHpmL(5,7,8),cplcChaChiHpmR(5,7,8),cplcChaChiVWmL(5,7),cplcChaChiVWmR(5,7),   & 
& cplcChaFdcSuL(5,3,6),cplcChaFdcSuR(5,3,6),cplcFdChaSuL(3,5,6),cplcFdChaSuR(3,5,6),     & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFdFdAhL(3,3,5),cplcFdFdAhR(3,3,5),         & 
& cplcFdFdhhL(3,3,5),cplcFdFdhhR(3,3,5),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),               & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,8),& 
& cplcFdFuHpmR(3,3,8),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFuFdcHpmL(3,3,8),        & 
& cplcFuFdcHpmR(3,3,8),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,5),         & 
& cplcFuFuAhR(3,3,5),cplcFuFuhhL(3,3,5),cplcFuFuhhR(3,3,5),cplcFuFuVGL(3,3),             & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(5,3,6),cplChaFucSdR(5,3,6),           & 
& cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),cplChiChacVWmL(7,5),cplChiChacVWmR(7,5),   & 
& cplChiChiAhL(7,7,5),cplChiChiAhR(7,7,5),cplChiChihhL(7,7,5),cplChiChihhR(7,7,5),       & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),           & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcHpmVPVWm(8),cplcHpmVWmVZ(8),               & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),       & 
& cplGluFucSuR(3,6),cplhhcHpmVWm(5,8),cplhhcVWmVWm(5),cplhhhhhh(5,5,5),cplhhHpmcHpm(5,8,8),& 
& cplhhHpmcVWm(5,8),cplhhSdcSd(5,6,6),cplhhSucSu(5,6,6),cplhhVZVZ(5),cplHpmcHpmVP(8,8),  & 
& cplHpmcHpmVZ(8,8),cplHpmcVWmVP(8),cplHpmcVWmVZ(8),cplHpmSucSd(8,6,6),cplSdcHpmcSu(6,8,6),& 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),    & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),ctcplcChacFuSdL(5,3,6),ctcplcChacFuSdR(5,3,6),& 
& ctcplcChaChaAhL(5,5,5),ctcplcChaChaAhR(5,5,5),ctcplcChaChahhL(5,5,5),ctcplcChaChahhR(5,5,5),& 
& ctcplcChaChaVPL(5,5),ctcplcChaChaVPR(5,5),ctcplcChaChaVZL(5,5),ctcplcChaChaVZR(5,5),   & 
& ctcplcChaChiHpmL(5,7,8),ctcplcChaChiHpmR(5,7,8),ctcplcChaChiVWmL(5,7),ctcplcChaChiVWmR(5,7),& 
& ctcplcChaFdcSuL(5,3,6),ctcplcChaFdcSuR(5,3,6),GcplcChaChiHpmL(5,7,8),GcplcChaChiHpmR(5,7,8),& 
& GcplcHpmVPVWm(8),GcplHpmcVWmVP(8),GosZcplcChaChiHpmL(5,7,8),GosZcplcChaChiHpmR(5,7,8), & 
& GosZcplcHpmVPVWm(8),GosZcplHpmcVWmVP(8),GZcplcChaChiHpmL(5,7,8),GZcplcChaChiHpmR(5,7,8),& 
& GZcplcHpmVPVWm(8),GZcplHpmcVWmVP(8),ZcplcChacFuSdL(5,3,6),ZcplcChacFuSdR(5,3,6),       & 
& ZcplcChaChaAhL(5,5,5),ZcplcChaChaAhR(5,5,5),ZcplcChaChahhL(5,5,5),ZcplcChaChahhR(5,5,5),& 
& ZcplcChaChaVPL(5,5),ZcplcChaChaVPR(5,5),ZcplcChaChaVZL(5,5),ZcplcChaChaVZR(5,5),       & 
& ZcplcChaChiHpmL(5,7,8),ZcplcChaChiHpmR(5,7,8),ZcplcChaChiVWmL(5,7),ZcplcChaChiVWmR(5,7),& 
& ZcplcChaFdcSuL(5,3,6),ZcplcChaFdcSuR(5,3,6),ZcplcFdChaSuL(3,5,6),ZcplcFdChaSuR(3,5,6), & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3)

Complex(dp),Intent(in) :: ZcplChaFucSdL(5,3,6),ZcplChaFucSdR(5,3,6),ZcplChiChacHpmL(7,5,8),ZcplChiChacHpmR(7,5,8),& 
& ZcplChiChacVWmL(7,5),ZcplChiChacVWmR(7,5),ZcplcHpmVPVWm(8),ZcplcVWmVPVWm,              & 
& ZcplHpmcHpmVP(8,8),ZcplHpmcVWmVP(8),ZcplSdcSdVP(6,6),ZcplSucSuVP(6,6)

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVWm,ZfSd(6,6),ZfSu(6,6),Zfhh(5,5),ZfAh(5,5),ZfHpm(8,8),         & 
& ZfL0(7,7),ZfLm(5,5),ZfLp(5,5),ZfFDL(3,3),ZfFDR(3,3),ZfFUL(3,3),ZfFUR(3,3),             & 
& ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MSdOS(6),MSd2OS(6),MSuOS(6),MSu2OS(6),MhhOS(5),Mhh2OS(5),MAhOS(5),MAh2OS(5),          & 
& MHpmOS(8),MHpm2OS(8),MChiOS(7),MChi2OS(7),MChaOS(5),MCha2OS(5),MFdOS(3),               & 
& MFd2OS(3),MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,               & 
& ZHOS(5,5),ZAOS(5,5),ZPOS(8,8)

Complex(dp),Intent(in) :: ZDOS(6,6),ZUOS(6,6),UVOS(7,7),ZELOS(5,5),ZEROS(5,5),ZDLOS(3,3),ZDROS(3,3),            & 
& ZULOS(3,3),ZUROS(3,3)

Complex(dp),Intent(in) :: ZRUZD(6,6),ZRUZU(6,6),ZRUZH(5,5),ZRUZA(5,5),ZRUZP(8,8),ZRUZN(7,7),ZRUUM(5,5),         & 
& ZRUUP(5,5),ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LCha(5,147) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUZDc(6, 6) 
Complex(dp) :: ZRUZUc(6, 6) 
Complex(dp) :: ZRUZHc(5, 5) 
Complex(dp) :: ZRUZAc(5, 5) 
Complex(dp) :: ZRUZPc(8, 8) 
Complex(dp) :: ZRUZNc(7, 7) 
Complex(dp) :: ZRUUMc(5, 5) 
Complex(dp) :: ZRUUPc(5, 5) 
Complex(dp) :: ZRUZDLc(3, 3) 
Complex(dp) :: ZRUZDRc(3, 3) 
Complex(dp) :: ZRUZULc(3, 3) 
Complex(dp) :: ZRUZURc(3, 3) 
Real(dp) :: MRPChaToChaAh(5,5,5),MRGChaToChaAh(5,5,5), MRPZChaToChaAh(5,5,5),MRGZChaToChaAh(5,5,5) 
Real(dp) :: MVPChaToChaAh(5,5,5) 
Real(dp) :: RMsqTreeChaToChaAh(5,5,5),RMsqWaveChaToChaAh(5,5,5),RMsqVertexChaToChaAh(5,5,5) 
Complex(dp) :: AmpTreeChaToChaAh(2,5,5,5),AmpWaveChaToChaAh(2,5,5,5)=(0._dp,0._dp),AmpVertexChaToChaAh(2,5,5,5)& 
 & ,AmpVertexIRosChaToChaAh(2,5,5,5),AmpVertexIRdrChaToChaAh(2,5,5,5), AmpSumChaToChaAh(2,5,5,5), AmpSum2ChaToChaAh(2,5,5,5) 
Complex(dp) :: AmpTreeZChaToChaAh(2,5,5,5),AmpWaveZChaToChaAh(2,5,5,5),AmpVertexZChaToChaAh(2,5,5,5) 
Real(dp) :: AmpSqChaToChaAh(5,5,5),  AmpSqTreeChaToChaAh(5,5,5) 
Real(dp) :: MRPChaToChahh(5,5,5),MRGChaToChahh(5,5,5), MRPZChaToChahh(5,5,5),MRGZChaToChahh(5,5,5) 
Real(dp) :: MVPChaToChahh(5,5,5) 
Real(dp) :: RMsqTreeChaToChahh(5,5,5),RMsqWaveChaToChahh(5,5,5),RMsqVertexChaToChahh(5,5,5) 
Complex(dp) :: AmpTreeChaToChahh(2,5,5,5),AmpWaveChaToChahh(2,5,5,5)=(0._dp,0._dp),AmpVertexChaToChahh(2,5,5,5)& 
 & ,AmpVertexIRosChaToChahh(2,5,5,5),AmpVertexIRdrChaToChahh(2,5,5,5), AmpSumChaToChahh(2,5,5,5), AmpSum2ChaToChahh(2,5,5,5) 
Complex(dp) :: AmpTreeZChaToChahh(2,5,5,5),AmpWaveZChaToChahh(2,5,5,5),AmpVertexZChaToChahh(2,5,5,5) 
Real(dp) :: AmpSqChaToChahh(5,5,5),  AmpSqTreeChaToChahh(5,5,5) 
Real(dp) :: MRPChaToChaVZ(5,5),MRGChaToChaVZ(5,5), MRPZChaToChaVZ(5,5),MRGZChaToChaVZ(5,5) 
Real(dp) :: MVPChaToChaVZ(5,5) 
Real(dp) :: RMsqTreeChaToChaVZ(5,5),RMsqWaveChaToChaVZ(5,5),RMsqVertexChaToChaVZ(5,5) 
Complex(dp) :: AmpTreeChaToChaVZ(4,5,5),AmpWaveChaToChaVZ(4,5,5)=(0._dp,0._dp),AmpVertexChaToChaVZ(4,5,5)& 
 & ,AmpVertexIRosChaToChaVZ(4,5,5),AmpVertexIRdrChaToChaVZ(4,5,5), AmpSumChaToChaVZ(4,5,5), AmpSum2ChaToChaVZ(4,5,5) 
Complex(dp) :: AmpTreeZChaToChaVZ(4,5,5),AmpWaveZChaToChaVZ(4,5,5),AmpVertexZChaToChaVZ(4,5,5) 
Real(dp) :: AmpSqChaToChaVZ(5,5),  AmpSqTreeChaToChaVZ(5,5) 
Real(dp) :: MRPChaToChiHpm(5,7,8),MRGChaToChiHpm(5,7,8), MRPZChaToChiHpm(5,7,8),MRGZChaToChiHpm(5,7,8) 
Real(dp) :: MVPChaToChiHpm(5,7,8) 
Real(dp) :: RMsqTreeChaToChiHpm(5,7,8),RMsqWaveChaToChiHpm(5,7,8),RMsqVertexChaToChiHpm(5,7,8) 
Complex(dp) :: AmpTreeChaToChiHpm(2,5,7,8),AmpWaveChaToChiHpm(2,5,7,8)=(0._dp,0._dp),AmpVertexChaToChiHpm(2,5,7,8)& 
 & ,AmpVertexIRosChaToChiHpm(2,5,7,8),AmpVertexIRdrChaToChiHpm(2,5,7,8), AmpSumChaToChiHpm(2,5,7,8), AmpSum2ChaToChiHpm(2,5,7,8) 
Complex(dp) :: AmpTreeZChaToChiHpm(2,5,7,8),AmpWaveZChaToChiHpm(2,5,7,8),AmpVertexZChaToChiHpm(2,5,7,8) 
Real(dp) :: AmpSqChaToChiHpm(5,7,8),  AmpSqTreeChaToChiHpm(5,7,8) 
Real(dp) :: MRPChaToChiVWm(5,7),MRGChaToChiVWm(5,7), MRPZChaToChiVWm(5,7),MRGZChaToChiVWm(5,7) 
Real(dp) :: MVPChaToChiVWm(5,7) 
Real(dp) :: RMsqTreeChaToChiVWm(5,7),RMsqWaveChaToChiVWm(5,7),RMsqVertexChaToChiVWm(5,7) 
Complex(dp) :: AmpTreeChaToChiVWm(4,5,7),AmpWaveChaToChiVWm(4,5,7)=(0._dp,0._dp),AmpVertexChaToChiVWm(4,5,7)& 
 & ,AmpVertexIRosChaToChiVWm(4,5,7),AmpVertexIRdrChaToChiVWm(4,5,7), AmpSumChaToChiVWm(4,5,7), AmpSum2ChaToChiVWm(4,5,7) 
Complex(dp) :: AmpTreeZChaToChiVWm(4,5,7),AmpWaveZChaToChiVWm(4,5,7),AmpVertexZChaToChiVWm(4,5,7) 
Real(dp) :: AmpSqChaToChiVWm(5,7),  AmpSqTreeChaToChiVWm(5,7) 
Real(dp) :: MRPChaToFdcSu(5,3,6),MRGChaToFdcSu(5,3,6), MRPZChaToFdcSu(5,3,6),MRGZChaToFdcSu(5,3,6) 
Real(dp) :: MVPChaToFdcSu(5,3,6) 
Real(dp) :: RMsqTreeChaToFdcSu(5,3,6),RMsqWaveChaToFdcSu(5,3,6),RMsqVertexChaToFdcSu(5,3,6) 
Complex(dp) :: AmpTreeChaToFdcSu(2,5,3,6),AmpWaveChaToFdcSu(2,5,3,6)=(0._dp,0._dp),AmpVertexChaToFdcSu(2,5,3,6)& 
 & ,AmpVertexIRosChaToFdcSu(2,5,3,6),AmpVertexIRdrChaToFdcSu(2,5,3,6), AmpSumChaToFdcSu(2,5,3,6), AmpSum2ChaToFdcSu(2,5,3,6) 
Complex(dp) :: AmpTreeZChaToFdcSu(2,5,3,6),AmpWaveZChaToFdcSu(2,5,3,6),AmpVertexZChaToFdcSu(2,5,3,6) 
Real(dp) :: AmpSqChaToFdcSu(5,3,6),  AmpSqTreeChaToFdcSu(5,3,6) 
Real(dp) :: MRPChaTocFuSd(5,3,6),MRGChaTocFuSd(5,3,6), MRPZChaTocFuSd(5,3,6),MRGZChaTocFuSd(5,3,6) 
Real(dp) :: MVPChaTocFuSd(5,3,6) 
Real(dp) :: RMsqTreeChaTocFuSd(5,3,6),RMsqWaveChaTocFuSd(5,3,6),RMsqVertexChaTocFuSd(5,3,6) 
Complex(dp) :: AmpTreeChaTocFuSd(2,5,3,6),AmpWaveChaTocFuSd(2,5,3,6)=(0._dp,0._dp),AmpVertexChaTocFuSd(2,5,3,6)& 
 & ,AmpVertexIRosChaTocFuSd(2,5,3,6),AmpVertexIRdrChaTocFuSd(2,5,3,6), AmpSumChaTocFuSd(2,5,3,6), AmpSum2ChaTocFuSd(2,5,3,6) 
Complex(dp) :: AmpTreeZChaTocFuSd(2,5,3,6),AmpWaveZChaTocFuSd(2,5,3,6),AmpVertexZChaTocFuSd(2,5,3,6) 
Real(dp) :: AmpSqChaTocFuSd(5,3,6),  AmpSqTreeChaTocFuSd(5,3,6) 
Real(dp) :: MRPChaToChaVP(5,5),MRGChaToChaVP(5,5), MRPZChaToChaVP(5,5),MRGZChaToChaVP(5,5) 
Real(dp) :: MVPChaToChaVP(5,5) 
Real(dp) :: RMsqTreeChaToChaVP(5,5),RMsqWaveChaToChaVP(5,5),RMsqVertexChaToChaVP(5,5) 
Complex(dp) :: AmpTreeChaToChaVP(4,5,5),AmpWaveChaToChaVP(4,5,5)=(0._dp,0._dp),AmpVertexChaToChaVP(4,5,5)& 
 & ,AmpVertexIRosChaToChaVP(4,5,5),AmpVertexIRdrChaToChaVP(4,5,5), AmpSumChaToChaVP(4,5,5), AmpSum2ChaToChaVP(4,5,5) 
Complex(dp) :: AmpTreeZChaToChaVP(4,5,5),AmpWaveZChaToChaVP(4,5,5),AmpVertexZChaToChaVP(4,5,5) 
Real(dp) :: AmpSqChaToChaVP(5,5),  AmpSqTreeChaToChaVP(5,5) 
Write(*,*) "Calculating one-loop decays of Cha " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUZDc = Conjg(ZRUZD)
ZRUZUc = Conjg(ZRUZU)
ZRUZHc = Conjg(ZRUZH)
ZRUZAc = Conjg(ZRUZA)
ZRUZPc = Conjg(ZRUZP)
ZRUZNc = Conjg(ZRUZN)
ZRUUMc = Conjg(ZRUUM)
ZRUUPc = Conjg(ZRUUP)
ZRUZDLc = Conjg(ZRUZDL)
ZRUZDRc = Conjg(ZRUZDR)
ZRUZULc = Conjg(ZRUZUL)
ZRUZURc = Conjg(ZRUZUR)

 ! Counter 
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,MAh,MCha,           & 
& MAh2,MCha2,AmpTreeChaToChaAh)

  Else 
Call Amplitude_Tree_MSSMLV_ChaToChaAh(ZcplcChaChaAhL,ZcplcChaChaAhR,MAh,              & 
& MCha,MAh2,MCha2,AmpTreeChaToChaAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,          & 
& MAhOS,MChaOS,MRPChaToChaAh,MRGChaToChaAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChaAh(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,        & 
& MAhOS,MChaOS,MRPChaToChaAh,MRGChaToChaAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,          & 
& MAh,MCha,MRPChaToChaAh,MRGChaToChaAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChaAh(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,        & 
& MAh,MCha,MRPChaToChaAh,MRGChaToChaAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,ctcplcChaChaAhL,    & 
& ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,AmpWaveChaToChaAh)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_ChaToChaAh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,               & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,   & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexChaToChaAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaAh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,   & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrChaToChaAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaAh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,ZcplcChaChaAhL,      & 
& ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,    & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChacFuSdL,               & 
& cplcChacFuSdR,AmpVertexIRosChaToChaAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaAh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,ZcplcChaChaAhL,ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,   & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChaAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaAh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,    & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChacFuSdL,               & 
& cplcChacFuSdR,AmpVertexIRosChaToChaAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaAh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,   & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChaAh)

 End if 
 End if 
AmpVertexChaToChaAh = AmpVertexChaToChaAh -  AmpVertexIRdrChaToChaAh! +  AmpVertexIRosChaToChaAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChaAh(1,gt2,:,:) = AmpWaveZChaToChaAh(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaAh(1,gt1,:,:) 
AmpVertexZChaToChaAh(1,gt2,:,:)= AmpVertexZChaToChaAh(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaAh(1,gt1,:,:) 
AmpWaveZChaToChaAh(2,gt2,:,:) = AmpWaveZChaToChaAh(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaAh(2,gt1,:,:) 
AmpVertexZChaToChaAh(2,gt2,:,:)= AmpVertexZChaToChaAh(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaAh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
! Final State 1 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChaAh(1,:,gt2,:) = AmpWaveZChaToChaAh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChaToChaAh(1,:,gt1,:) 
AmpVertexZChaToChaAh(1,:,gt2,:)= AmpVertexZChaToChaAh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChaToChaAh(1,:,gt1,:) 
AmpWaveZChaToChaAh(2,:,gt2,:) = AmpWaveZChaToChaAh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaAh(2,:,gt1,:) 
AmpVertexZChaToChaAh(2,:,gt2,:)= AmpVertexZChaToChaAh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaAh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
! Final State 2 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChaAh(:,:,:,gt2) = AmpWaveZChaToChaAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveChaToChaAh(:,:,:,gt1) 
AmpVertexZChaToChaAh(:,:,:,gt2)= AmpVertexZChaToChaAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexChaToChaAh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaAh = AmpVertexChaToChaAh  +  AmpVertexIRosChaToChaAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaAh = AmpTreeChaToChaAh 
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh  
Else 
 AmpSumChaToChaAh = AmpTreeChaToChaAh + AmpWaveChaToChaAh + AmpVertexChaToChaAh
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh + AmpWaveChaToChaAh + AmpVertexChaToChaAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaAh = AmpTreeChaToChaAh
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
    Do gt3=2,5
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChaOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MCha(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = 2._dp*AmpWaveChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = 2._dp*AmpVertexChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3)  
  AmpSum2ChaToChaAh = + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3) + AmpSqTreeChaToChaAh(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3)  
  AmpSum2ChaToChaAh = + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3) + AmpSqTreeChaToChaAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChaAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),helfactor*AmpSqChaToChaAh(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MAh(gt3),helfactor*AmpSqChaToChaAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaAh(gt1, gt2, gt3) + MRGChaToChaAh(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaAh(gt1, gt2, gt3) + MRGChaToChaAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_ChaToChahh(cplcChaChahhL,cplcChaChahhR,MCha,               & 
& Mhh,MCha2,Mhh2,AmpTreeChaToChahh)

  Else 
Call Amplitude_Tree_MSSMLV_ChaToChahh(ZcplcChaChahhL,ZcplcChaChahhR,MCha,             & 
& Mhh,MCha2,Mhh2,AmpTreeChaToChahh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,          & 
& MChaOS,MhhOS,MRPChaToChahh,MRGChaToChahh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChahh(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,        & 
& MChaOS,MhhOS,MRPChaToChahh,MRGChaToChahh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,          & 
& MCha,Mhh,MRPChaToChahh,MRGChaToChahh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChahh(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,        & 
& MCha,Mhh,MRPChaToChahh,MRGChaToChahh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_ChaToChahh(cplcChaChahhL,cplcChaChahhR,ctcplcChaChahhL,    & 
& ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,AmpWaveChaToChahh)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_ChaToChahh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,               & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,  & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,     & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexChaToChahh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChahh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,  & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,     & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrChaToChahh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChahh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,ZcplcChaChahhL,ZcplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuhhL,cplcFuFuhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChahh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChahh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,ZcplcChaChahhL, & 
& ZcplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChahh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChahh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuhhL,cplcFuFuhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChahh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChahh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,  & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,     & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChahh)

 End if 
 End if 
AmpVertexChaToChahh = AmpVertexChaToChahh -  AmpVertexIRdrChaToChahh! +  AmpVertexIRosChaToChahh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChahh(1,gt2,:,:) = AmpWaveZChaToChahh(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChahh(1,gt1,:,:) 
AmpVertexZChaToChahh(1,gt2,:,:)= AmpVertexZChaToChahh(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChahh(1,gt1,:,:) 
AmpWaveZChaToChahh(2,gt2,:,:) = AmpWaveZChaToChahh(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChahh(2,gt1,:,:) 
AmpVertexZChaToChahh(2,gt2,:,:)= AmpVertexZChaToChahh(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChahh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
! Final State 1 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChahh(1,:,gt2,:) = AmpWaveZChaToChahh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChaToChahh(1,:,gt1,:) 
AmpVertexZChaToChahh(1,:,gt2,:)= AmpVertexZChaToChahh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChaToChahh(1,:,gt1,:) 
AmpWaveZChaToChahh(2,:,gt2,:) = AmpWaveZChaToChahh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChaToChahh(2,:,gt1,:) 
AmpVertexZChaToChahh(2,:,gt2,:)= AmpVertexZChaToChahh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChaToChahh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
! Final State 2 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChahh(:,:,:,gt2) = AmpWaveZChaToChahh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveChaToChahh(:,:,:,gt1) 
AmpVertexZChaToChahh(:,:,:,gt2)= AmpVertexZChaToChahh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexChaToChahh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChahh = AmpVertexChaToChahh  +  AmpVertexIRosChaToChahh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChahh = AmpTreeChaToChahh 
 AmpSum2ChaToChahh = AmpTreeChaToChahh + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh  
Else 
 AmpSumChaToChahh = AmpTreeChaToChahh + AmpWaveChaToChahh + AmpVertexChaToChahh
 AmpSum2ChaToChahh = AmpTreeChaToChahh + AmpWaveChaToChahh + AmpVertexChaToChahh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChahh = AmpTreeChaToChahh
 AmpSum2ChaToChahh = AmpTreeChaToChahh 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
    Do gt3=1,5
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChaOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MCha(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChahh = AmpTreeChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = 2._dp*AmpWaveChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = 2._dp*AmpVertexChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = AmpTreeChaToChahh + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChahh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChahh = AmpTreeChaToChahh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3)  
  AmpSum2ChaToChahh = + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3) + AmpSqTreeChaToChahh(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChahh = AmpTreeChaToChahh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3)  
  AmpSum2ChaToChahh = + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3) + AmpSqTreeChaToChahh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChahh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChahh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),helfactor*AmpSqChaToChahh(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),Mhh(gt3),helfactor*AmpSqChaToChahh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChahh(gt1, gt2, gt3) + MRGChaToChahh(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChahh(gt1, gt2, gt3) + MRGChaToChahh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_ChaToChaVZ(cplcChaChaVZL,cplcChaChaVZR,MCha,               & 
& MVZ,MCha2,MVZ2,AmpTreeChaToChaVZ)

  Else 
Call Amplitude_Tree_MSSMLV_ChaToChaVZ(ZcplcChaChaVZL,ZcplcChaChaVZR,MCha,             & 
& MVZ,MCha2,MVZ2,AmpTreeChaToChaVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,          & 
& MChaOS,MVZOS,MRPChaToChaVZ,MRGChaToChaVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChaVZ(MLambda,em,gs,ZcplcChaChaVZL,ZcplcChaChaVZR,        & 
& MChaOS,MVZOS,MRPChaToChaVZ,MRGChaToChaVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,          & 
& MCha,MVZ,MRPChaToChaVZ,MRGChaToChaVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChaVZ(MLambda,em,gs,ZcplcChaChaVZL,ZcplcChaChaVZR,        & 
& MCha,MVZ,MRPChaToChaVZ,MRGChaToChaVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_ChaToChaVZ(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,         & 
& MCha,MCha2,MVP,MVP2,MVZ,MVZ2,ZfLm,ZfLp,ZfVPVZ,ZfVZ,AmpWaveChaToChaVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_ChaToChaVZ(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,               & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,            & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexChaToChaVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaVZ(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,            & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRdrChaToChaVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,    & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,      & 
& cplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFuFuVZL,cplcFuFuVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,             & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,           & 
& AmpVertexIRosChaToChaVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaVZ(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,   & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,            & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,    & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,    & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFuFuVZL,cplcFuFuVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,             & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,           & 
& AmpVertexIRosChaToChaVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChaVZ(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,            & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

 End if 
 End if 
AmpVertexChaToChaVZ = AmpVertexChaToChaVZ -  AmpVertexIRdrChaToChaVZ! +  AmpVertexIRosChaToChaVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaVZ=0._dp 
AmpVertexZChaToChaVZ=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChaVZ(1,gt2,:) = AmpWaveZChaToChaVZ(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZ(1,gt1,:) 
AmpVertexZChaToChaVZ(1,gt2,:)= AmpVertexZChaToChaVZ(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZ(1,gt1,:) 
AmpWaveZChaToChaVZ(2,gt2,:) = AmpWaveZChaToChaVZ(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZ(2,gt1,:) 
AmpVertexZChaToChaVZ(2,gt2,:)= AmpVertexZChaToChaVZ(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZ(2,gt1,:) 
AmpWaveZChaToChaVZ(3,gt2,:) = AmpWaveZChaToChaVZ(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZ(3,gt1,:) 
AmpVertexZChaToChaVZ(3,gt2,:)= AmpVertexZChaToChaVZ(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZ(3,gt1,:) 
AmpWaveZChaToChaVZ(4,gt2,:) = AmpWaveZChaToChaVZ(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZ(4,gt1,:) 
AmpVertexZChaToChaVZ(4,gt2,:)= AmpVertexZChaToChaVZ(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaVZ=AmpWaveZChaToChaVZ 
AmpVertexChaToChaVZ= AmpVertexZChaToChaVZ
! Final State 1 
AmpWaveZChaToChaVZ=0._dp 
AmpVertexZChaToChaVZ=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChaVZ(1,:,gt2) = AmpWaveZChaToChaVZ(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZ(1,:,gt1) 
AmpVertexZChaToChaVZ(1,:,gt2)= AmpVertexZChaToChaVZ(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZ(1,:,gt1) 
AmpWaveZChaToChaVZ(2,:,gt2) = AmpWaveZChaToChaVZ(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZ(2,:,gt1) 
AmpVertexZChaToChaVZ(2,:,gt2)= AmpVertexZChaToChaVZ(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZ(2,:,gt1) 
AmpWaveZChaToChaVZ(3,:,gt2) = AmpWaveZChaToChaVZ(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZ(3,:,gt1) 
AmpVertexZChaToChaVZ(3,:,gt2)= AmpVertexZChaToChaVZ(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZ(3,:,gt1) 
AmpWaveZChaToChaVZ(4,:,gt2) = AmpWaveZChaToChaVZ(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZ(4,:,gt1) 
AmpVertexZChaToChaVZ(4,:,gt2)= AmpVertexZChaToChaVZ(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaVZ=AmpWaveZChaToChaVZ 
AmpVertexChaToChaVZ= AmpVertexZChaToChaVZ
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaVZ = AmpVertexChaToChaVZ  +  AmpVertexIRosChaToChaVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ 
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ  
Else 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ + AmpWaveChaToChaVZ + AmpVertexChaToChaVZ
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + AmpWaveChaToChaVZ + AmpVertexChaToChaVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChaOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MCha(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = 2._dp*AmpWaveChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = 2._dp*AmpVertexChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqTreeChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2)  
  AmpSum2ChaToChaVZ = + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2) + AmpSqTreeChaToChaVZ(gt1, gt2)  
Else  
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqTreeChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2)  
  AmpSum2ChaToChaVZ = + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2) + AmpSqTreeChaToChaVZ(gt1, gt2)  
End if  
Else  
  AmpSqChaToChaVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVZ(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MVZOS,helfactor*AmpSqChaToChaVZ(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVZ,helfactor*AmpSqChaToChaVZ(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZ(gt1, gt2) + MRGChaToChaVZ(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZ(gt1, gt2) + MRGChaToChaVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,MCha,            & 
& MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChaToChiHpm)

  Else 
Call Amplitude_Tree_MSSMLV_ChaToChiHpm(ZcplcChaChiHpmL,ZcplcChaChiHpmR,               & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChaToChiHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR,       & 
& MChaOS,MChiOS,MHpmOS,MRPChaToChiHpm,MRGChaToChiHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChiHpm(MLambda,em,gs,ZcplcChaChiHpmL,ZcplcChaChiHpmR,     & 
& MChaOS,MChiOS,MHpmOS,MRPChaToChiHpm,MRGChaToChiHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR,       & 
& MCha,MChi,MHpm,MRPChaToChiHpm,MRGChaToChiHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChiHpm(MLambda,em,gs,ZcplcChaChiHpmL,ZcplcChaChiHpmR,     & 
& MCha,MChi,MHpm,MRPChaToChiHpm,MRGChaToChiHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,ctcplcChaChiHpmL,& 
& ctcplcChaChiHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,ZfL0,ZfLm,ZfLp,AmpWaveChaToChiHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_ChaToChiHpm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,         & 
& cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmcHpmVP,          & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexChaToChiHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiHpm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,         & 
& cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmcHpmVP,          & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrChaToChiHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,ZcplcChaChiHpmL,      & 
& ZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,    & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdFuHpmL,cplcFdFuHpmR,cplhhHpmcHpm,     & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,          & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiHpm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,         & 
& cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFucSuL,cplChiFucSuR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmcHpmVP,          & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdFuHpmL,cplcFdFuHpmR,cplhhHpmcHpm,     & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,          & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiHpm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,         & 
& cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,   & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmcHpmVP,          & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosChaToChiHpm)

 End if 
 End if 
AmpVertexChaToChiHpm = AmpVertexChaToChiHpm -  AmpVertexIRdrChaToChiHpm! +  AmpVertexIRosChaToChiHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChiHpm(1,gt2,:,:) = AmpWaveZChaToChiHpm(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiHpm(1,gt1,:,:) 
AmpVertexZChaToChiHpm(1,gt2,:,:)= AmpVertexZChaToChiHpm(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiHpm(1,gt1,:,:) 
AmpWaveZChaToChiHpm(2,gt2,:,:) = AmpWaveZChaToChiHpm(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiHpm(2,gt1,:,:) 
AmpVertexZChaToChiHpm(2,gt2,:,:)= AmpVertexZChaToChiHpm(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiHpm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
! Final State 1 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZChaToChiHpm(1,:,gt2,:) = AmpWaveZChaToChiHpm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChaToChiHpm(1,:,gt1,:) 
AmpVertexZChaToChiHpm(1,:,gt2,:)= AmpVertexZChaToChiHpm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChaToChiHpm(1,:,gt1,:) 
AmpWaveZChaToChiHpm(2,:,gt2,:) = AmpWaveZChaToChiHpm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiHpm(2,:,gt1,:) 
AmpVertexZChaToChiHpm(2,:,gt2,:)= AmpVertexZChaToChiHpm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiHpm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
! Final State 2 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,8
  Do gt2=1,8
AmpWaveZChaToChiHpm(:,:,:,gt2) = AmpWaveZChaToChiHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveChaToChiHpm(:,:,:,gt1) 
AmpVertexZChaToChiHpm(:,:,:,gt2)= AmpVertexZChaToChiHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexChaToChiHpm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChiHpm = AmpVertexChaToChiHpm  +  AmpVertexIRosChaToChiHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Chi Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm 
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm  
Else 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm + AmpWaveChaToChiHpm + AmpVertexChaToChiHpm
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + AmpWaveChaToChiHpm + AmpVertexChaToChiHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,7
    Do gt3=2,8
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChiOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MChi(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = 2._dp*AmpWaveChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = 2._dp*AmpVertexChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqTreeChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3)  
  AmpSum2ChaToChiHpm = + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3) + AmpSqTreeChaToChiHpm(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqTreeChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3)  
  AmpSum2ChaToChiHpm = + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3) + AmpSqTreeChaToChiHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChiHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChiHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),helfactor*AmpSqChaToChiHpm(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MChi(gt2),MHpm(gt3),helfactor*AmpSqChaToChiHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChiHpm(gt1, gt2, gt3) + MRGChaToChiHpm(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChiHpm(gt1, gt2, gt3) + MRGChaToChiHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,MCha,            & 
& MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChaToChiVWm)

  Else 
Call Amplitude_Tree_MSSMLV_ChaToChiVWm(ZcplcChaChiVWmL,ZcplcChaChiVWmR,               & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChaToChiVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR,       & 
& MChaOS,MChiOS,MVWmOS,MRPChaToChiVWm,MRGChaToChiVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChiVWm(MLambda,em,gs,ZcplcChaChiVWmL,ZcplcChaChiVWmR,     & 
& MChaOS,MChiOS,MVWmOS,MRPChaToChiVWm,MRGChaToChiVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR,       & 
& MCha,MChi,MVWm,MRPChaToChiVWm,MRGChaToChiVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_ChaToChiVWm(MLambda,em,gs,ZcplcChaChiVWmL,ZcplcChaChiVWmR,     & 
& MCha,MChi,MVWm,MRPChaToChiVWm,MRGChaToChiVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,ctcplcChaChiVWmL,& 
& ctcplcChaChiVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,ZfLm,ZfLp,ZfVWm,AmpWaveChaToChiVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_ChaToChiVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,    & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdFuVWmL,   & 
& cplcFdFuVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,        & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexChaToChiVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,    & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdFuVWmL,   & 
& cplcFdFuVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,        & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRdrChaToChiVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,GosZcplcChaChiHpmL,GosZcplcChaChiHpmR,          & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,   & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFdFuVWmL,cplcFdFuVWmR,cplhhcHpmVWm,cplhhcVWmVWm,       & 
& cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,AmpVertexIRosChaToChiVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,    & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,         & 
& cplChiFucSuR,GZcplcChaChiHpmL,GZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,              & 
& cplcFuChiSuL,cplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,cplcChaFdcSuL,               & 
& cplcChaFdcSuR,cplcFdFuVWmL,cplcFdFuVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,       & 
& cplcChacFuSdR,cplSucSdVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,       & 
& AmpVertexIRosChaToChiVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,GcplcChaChiHpmL,GcplcChaChiHpmR,cplcFdChiSdL,   & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFdFuVWmL,cplcFdFuVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,       & 
& cplcChacFuSdR,cplSucSdVWm,GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,        & 
& AmpVertexIRosChaToChiVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToChiVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,    & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdFuVWmL,   & 
& cplcFdFuVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,        & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChiVWm)

 End if 
 End if 
AmpVertexChaToChiVWm = AmpVertexChaToChiVWm -  AmpVertexIRdrChaToChiVWm! +  AmpVertexIRosChaToChiVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChiVWm=0._dp 
AmpVertexZChaToChiVWm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToChiVWm(1,gt2,:) = AmpWaveZChaToChiVWm(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiVWm(1,gt1,:) 
AmpVertexZChaToChiVWm(1,gt2,:)= AmpVertexZChaToChiVWm(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiVWm(1,gt1,:) 
AmpWaveZChaToChiVWm(2,gt2,:) = AmpWaveZChaToChiVWm(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiVWm(2,gt1,:) 
AmpVertexZChaToChiVWm(2,gt2,:)= AmpVertexZChaToChiVWm(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiVWm(2,gt1,:) 
AmpWaveZChaToChiVWm(3,gt2,:) = AmpWaveZChaToChiVWm(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiVWm(3,gt1,:) 
AmpVertexZChaToChiVWm(3,gt2,:)= AmpVertexZChaToChiVWm(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiVWm(3,gt1,:) 
AmpWaveZChaToChiVWm(4,gt2,:) = AmpWaveZChaToChiVWm(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiVWm(4,gt1,:) 
AmpVertexZChaToChiVWm(4,gt2,:)= AmpVertexZChaToChiVWm(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiVWm(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChiVWm=AmpWaveZChaToChiVWm 
AmpVertexChaToChiVWm= AmpVertexZChaToChiVWm
! Final State 1 
AmpWaveZChaToChiVWm=0._dp 
AmpVertexZChaToChiVWm=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZChaToChiVWm(1,:,gt2) = AmpWaveZChaToChiVWm(1,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChaToChiVWm(1,:,gt1) 
AmpVertexZChaToChiVWm(1,:,gt2)= AmpVertexZChaToChiVWm(1,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChaToChiVWm(1,:,gt1) 
AmpWaveZChaToChiVWm(2,:,gt2) = AmpWaveZChaToChiVWm(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiVWm(2,:,gt1) 
AmpVertexZChaToChiVWm(2,:,gt2)= AmpVertexZChaToChiVWm(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiVWm(2,:,gt1) 
AmpWaveZChaToChiVWm(3,:,gt2) = AmpWaveZChaToChiVWm(3,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChaToChiVWm(3,:,gt1) 
AmpVertexZChaToChiVWm(3,:,gt2)= AmpVertexZChaToChiVWm(3,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChaToChiVWm(3,:,gt1) 
AmpWaveZChaToChiVWm(4,:,gt2) = AmpWaveZChaToChiVWm(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiVWm(4,:,gt1) 
AmpVertexZChaToChiVWm(4,:,gt2)= AmpVertexZChaToChiVWm(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiVWm(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChiVWm=AmpWaveZChaToChiVWm 
AmpVertexChaToChiVWm= AmpVertexZChaToChiVWm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChiVWm = AmpVertexChaToChiVWm  +  AmpVertexIRosChaToChiVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Chi VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm 
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm  
Else 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm + AmpWaveChaToChiVWm + AmpVertexChaToChiVWm
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + AmpWaveChaToChiVWm + AmpVertexChaToChiVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,7
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChiOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MChi(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = 2._dp*AmpWaveChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = 2._dp*AmpVertexChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChiVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqTreeChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2)  
  AmpSum2ChaToChiVWm = + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2) + AmpSqTreeChaToChiVWm(gt1, gt2)  
Else  
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqTreeChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2)  
  AmpSum2ChaToChiVWm = + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2) + AmpSqTreeChaToChiVWm(gt1, gt2)  
End if  
Else  
  AmpSqChaToChiVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChiVWm(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChiOS(gt2),MVWmOS,helfactor*AmpSqChaToChiVWm(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MChi(gt2),MVWm,helfactor*AmpSqChaToChiVWm(gt1, gt2))
End if 
If ((Abs(MRPChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChiVWm(gt1, gt2) + MRGChaToChiVWm(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChiVWm(gt1, gt2) + MRGChaToChiVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fd Conjg(Su)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,MCha,               & 
& MFd,MSu,MCha2,MFd2,MSu2,AmpTreeChaToFdcSu)

  Else 
Call Amplitude_Tree_MSSMLV_ChaToFdcSu(ZcplcChaFdcSuL,ZcplcChaFdcSuR,MCha,             & 
& MFd,MSu,MCha2,MFd2,MSu2,AmpTreeChaToFdcSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,          & 
& MChaOS,MFdOS,MSuOS,MRPChaToFdcSu,MRGChaToFdcSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_ChaToFdcSu(MLambda,em,gs,ZcplcChaFdcSuL,ZcplcChaFdcSuR,        & 
& MChaOS,MFdOS,MSuOS,MRPChaToFdcSu,MRGChaToFdcSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,          & 
& MCha,MFd,MSu,MRPChaToFdcSu,MRGChaToFdcSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_ChaToFdcSu(MLambda,em,gs,ZcplcChaFdcSuL,ZcplcChaFdcSuR,        & 
& MCha,MFd,MSu,MRPChaToFdcSu,MRGChaToFdcSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,ctcplcChaFdcSuL,    & 
& ctcplcChaFdcSuR,MCha,MCha2,MFd,MFd2,MSu,MSu2,ZfFDL,ZfFDR,ZfLm,ZfLp,ZfSu,               & 
& AmpWaveChaToFdcSu)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,        & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexChaToFdcSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,        & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRdrChaToFdcSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToFdcSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,          & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFdcSdL,    & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,ZcplcChaFdcSuL,            & 
& ZcplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,   & 
& cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,         & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRosChaToFdcSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,   & 
& cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,        & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRosChaToFdcSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToFdcSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,          & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiFdcSdL,    & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,    & 
& cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,         & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRosChaToFdcSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,        & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,AmpVertexIRosChaToFdcSu)

 End if 
 End if 
AmpVertexChaToFdcSu = AmpVertexChaToFdcSu -  AmpVertexIRdrChaToFdcSu! +  AmpVertexIRosChaToFdcSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaToFdcSu(1,gt2,:,:) = AmpWaveZChaToFdcSu(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFdcSu(1,gt1,:,:) 
AmpVertexZChaToFdcSu(1,gt2,:,:)= AmpVertexZChaToFdcSu(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFdcSu(1,gt1,:,:) 
AmpWaveZChaToFdcSu(2,gt2,:,:) = AmpWaveZChaToFdcSu(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFdcSu(2,gt1,:,:) 
AmpVertexZChaToFdcSu(2,gt2,:,:)= AmpVertexZChaToFdcSu(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFdcSu(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
! Final State 1 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFdcSu(1,:,gt2,:) = AmpWaveZChaToFdcSu(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpWaveChaToFdcSu(1,:,gt1,:) 
AmpVertexZChaToFdcSu(1,:,gt2,:)= AmpVertexZChaToFdcSu(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpVertexChaToFdcSu(1,:,gt1,:) 
AmpWaveZChaToFdcSu(2,:,gt2,:) = AmpWaveZChaToFdcSu(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpWaveChaToFdcSu(2,:,gt1,:) 
AmpVertexZChaToFdcSu(2,:,gt2,:)= AmpVertexZChaToFdcSu(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpVertexChaToFdcSu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
! Final State 2 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFdcSu(:,:,:,gt2) = AmpWaveZChaToFdcSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpWaveChaToFdcSu(:,:,:,gt1) 
AmpVertexZChaToFdcSu(:,:,:,gt2)= AmpVertexZChaToFdcSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpVertexChaToFdcSu(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFdcSu = AmpVertexChaToFdcSu  +  AmpVertexIRosChaToFdcSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fd conj[Su] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu 
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu  
Else 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu + AmpWaveChaToFdcSu + AmpVertexChaToFdcSu
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + AmpWaveChaToFdcSu + AmpVertexChaToFdcSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChaOS(gt1).gt.(MFdOS(gt2)+MSuOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MFd(gt2)+MSu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = 2._dp*AmpWaveChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = 2._dp*AmpVertexChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqTreeChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3)  
  AmpSum2ChaToFdcSu = + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3) + AmpSqTreeChaToFdcSu(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqTreeChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3)  
  AmpSum2ChaToFdcSu = + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3) + AmpSqTreeChaToFdcSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFdcSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFdcSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),helfactor*AmpSqChaToFdcSu(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MCha(gt1),MFd(gt2),MSu(gt3),helfactor*AmpSqChaToFdcSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFdcSu(gt1, gt2, gt3) + MRGChaToFdcSu(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFdcSu(gt1, gt2, gt3) + MRGChaToFdcSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,MCha,               & 
& MFu,MSd,MCha2,MFu2,MSd2,AmpTreeChaTocFuSd)

  Else 
Call Amplitude_Tree_MSSMLV_ChaTocFuSd(ZcplcChacFuSdL,ZcplcChacFuSdR,MCha,             & 
& MFu,MSd,MCha2,MFu2,MSd2,AmpTreeChaTocFuSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,          & 
& MChaOS,MFuOS,MSdOS,MRPChaTocFuSd,MRGChaTocFuSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_ChaTocFuSd(MLambda,em,gs,ZcplcChacFuSdL,ZcplcChacFuSdR,        & 
& MChaOS,MFuOS,MSdOS,MRPChaTocFuSd,MRGChaTocFuSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,          & 
& MCha,MFu,MSd,MRPChaTocFuSd,MRGChaTocFuSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_ChaTocFuSd(MLambda,em,gs,ZcplcChacFuSdL,ZcplcChacFuSdR,        & 
& MCha,MFu,MSd,MRPChaTocFuSd,MRGChaTocFuSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,ctcplcChacFuSdL,    & 
& ctcplcChacFuSdR,MCha,MCha2,MFu,MFu2,MSd,MSd2,ZfFUL,ZfFUR,ZfLm,ZfLp,ZfSd,               & 
& AmpWaveChaTocFuSd)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,               & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,    & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,  & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,              & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexChaTocFuSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,    & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,  & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,              & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRdrChaTocFuSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaTocFuSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,          & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,ZcplcChacFuSdL,               & 
& ZcplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,    & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,  & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,              & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,ZcplcChacFuSdL,ZcplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaTocFuSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,          & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,    & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,  & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,              & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

 End if 
 End if 
AmpVertexChaTocFuSd = AmpVertexChaTocFuSd -  AmpVertexIRdrChaTocFuSd! +  AmpVertexIRosChaTocFuSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZChaTocFuSd(1,gt2,:,:) = AmpWaveZChaTocFuSd(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaTocFuSd(1,gt1,:,:) 
AmpVertexZChaTocFuSd(1,gt2,:,:)= AmpVertexZChaTocFuSd(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaTocFuSd(1,gt1,:,:) 
AmpWaveZChaTocFuSd(2,gt2,:,:) = AmpWaveZChaTocFuSd(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaTocFuSd(2,gt1,:,:) 
AmpVertexZChaTocFuSd(2,gt2,:,:)= AmpVertexZChaTocFuSd(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaTocFuSd(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
! Final State 1 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaTocFuSd(1,:,gt2,:) = AmpWaveZChaTocFuSd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWaveChaTocFuSd(1,:,gt1,:) 
AmpVertexZChaTocFuSd(1,:,gt2,:)= AmpVertexZChaTocFuSd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexChaTocFuSd(1,:,gt1,:) 
AmpWaveZChaTocFuSd(2,:,gt2,:) = AmpWaveZChaTocFuSd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWaveChaTocFuSd(2,:,gt1,:) 
AmpVertexZChaTocFuSd(2,:,gt2,:)= AmpVertexZChaTocFuSd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexChaTocFuSd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
! Final State 2 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaTocFuSd(:,:,:,gt2) = AmpWaveZChaTocFuSd(:,:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveChaTocFuSd(:,:,:,gt1) 
AmpVertexZChaTocFuSd(:,:,:,gt2)= AmpVertexZChaTocFuSd(:,:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexChaTocFuSd(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
End if
If (ShiftIRdiv) Then 
AmpVertexChaTocFuSd = AmpVertexChaTocFuSd  +  AmpVertexIRosChaTocFuSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->bar[Fu] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd 
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd  
Else 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd + AmpWaveChaTocFuSd + AmpVertexChaTocFuSd
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + AmpWaveChaTocFuSd + AmpVertexChaTocFuSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChaOS(gt1).gt.(MFuOS(gt2)+MSdOS(gt3)))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MFu(gt2)+MSd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = 2._dp*AmpWaveChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = 2._dp*AmpVertexChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3)  
  AmpSum2ChaTocFuSd = + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3) + AmpSqTreeChaTocFuSd(gt1, gt2, gt3)  
Else  
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3)  
  AmpSum2ChaTocFuSd = + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3) + AmpSqTreeChaTocFuSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaTocFuSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaTocFuSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),helfactor*AmpSqChaTocFuSd(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MCha(gt1),MFu(gt2),MSd(gt3),helfactor*AmpSqChaTocFuSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaTocFuSd(gt1, gt2, gt3) + MRGChaTocFuSd(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaTocFuSd(gt1, gt2, gt3) + MRGChaTocFuSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
End If 
!---------------- 
! Cha VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_MSSMLV_ChaToChaVP(ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,   & 
& ZcplcChaChaVZR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,        & 
& MChaOS,MCha2OS,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZVP,AmpWaveChaToChaVP)

 Else 
Call Amplitude_WAVE_MSSMLV_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,         & 
& MChaOS,MCha2OS,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZVP,AmpWaveChaToChaVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_ChaToChaVP(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,              & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,ZcplcChaChaAhL,ZcplcChaChaAhR, & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplChaFucSdL,         & 
& ZcplChaFucSdR,ZcplcChaChahhL,ZcplcChaChahhR,ZcplcFdChaSuL,ZcplcFdChaSuR,               & 
& ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplcChaChiHpmL,           & 
& ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVPL,ZcplcFdFdVPR,             & 
& ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplHpmcHpmVP,ZcplHpmcVWmVP,   & 
& ZcplSdcSdVP,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplSucSuVP,ZcplcHpmVPVWm,ZcplcVWmVPVWm,     & 
& AmpVertexChaToChaVP)

 Else 
Call Amplitude_VERTEX_MSSMLV_ChaToChaVP(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,              & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& cplcFuFuVPL,cplcFuFuVPR,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,            & 
& cplcChacFuSdR,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChaToChaVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,         & 
& MCha,MCha2,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZVP,AmpWaveChaToChaVP)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_ChaToChaVP(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,               & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFuFuVPL,cplcFuFuVPR,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,            & 
& cplcChacFuSdL,cplcChacFuSdR,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChaToChaVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVP = 0._dp 
 AmpSum2ChaToChaVP = 0._dp  
Else 
 AmpSumChaToChaVP = AmpVertexChaToChaVP + AmpWaveChaToChaVP
 AmpSum2ChaToChaVP = AmpVertexChaToChaVP + AmpWaveChaToChaVP 
End If 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
If (((OSkinematics).and.(MChaOS(gt1).gt.(MChaOS(gt2)+0.))).or.((.not.OSkinematics).and.(MCha(gt1).gt.(MCha(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),0._dp,AmpSumChaToChaVP(:,gt1, gt2),AmpSum2ChaToChaVP(:,gt1, gt2),AmpSqChaToChaVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVP,AmpSumChaToChaVP(:,gt1, gt2),AmpSum2ChaToChaVP(:,gt1, gt2),AmpSqChaToChaVP(gt1, gt2)) 
End if  
Else  
  AmpSqChaToChaVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVP(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),0._dp,helfactor*AmpSqChaToChaVP(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVP,helfactor*AmpSqChaToChaVP(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
End Subroutine OneLoopDecay_Cha

End Module Wrapper_OneLoopDecay_Cha_MSSMLV
