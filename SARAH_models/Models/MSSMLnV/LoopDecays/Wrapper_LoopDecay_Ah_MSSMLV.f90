! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:06 on 24.8.2021   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Ah_MSSMLV
Use Model_Data_MSSMLV 
Use Kinematics 
Use OneLoopDecay_Ah_MSSMLV 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Ah(MSdOS,MSd2OS,MSuOS,MSu2OS,MhhOS,Mhh2OS,MAhOS,              & 
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
& ZfLp,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,cplAhAhAhAh1,cplAhAhcVWmVWm1,               & 
& cplAhAhhh,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSucSuaa,cplAhAhVZVZ1,     & 
& cplAhcHpmVPVWm1,cplAhcHpmVWm,cplAhcHpmVWmVZ1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmSucSdaa,   & 
& cplAhSdcHpmcSuaa,cplAhSdcSd,cplAhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcgAgWmcVWm,cplcgAgWpCVWm,         & 
& cplcgWmgAHpm,cplcgWmgAVWm,cplcgWmgWmAh,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,         & 
& cplcgWmgZHpm,cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh,cplcgWpCgWpChh,cplcgWpCgWpCVP, & 
& cplcgWpCgWpCVZ,cplcgWpCgZcHpm,cplcgWpCgZcVWm,cplcgZgWmcHpm,cplcgZgWmcVWm,              & 
& cplcgZgWpCHpm,cplcgZgWpCVWm,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,   & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,         & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcVWmVPVWm,cplcVWmVWmVZ,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplhhcHpmVPVWm1,cplhhcHpmVWm,cplhhcHpmVWmVZ1,cplhhcVWmVWm,   & 
& cplhhhhhh,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSucSuaa,cplhhhhVZVZ1,cplhhHpmcHpm,     & 
& cplhhHpmcVWm,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhSdcSd,cplhhSucSu,cplhhVZVZ,          & 
& cplHpmcHpmcVWmVWm1,cplHpmcHpmVP,cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmVZ,          & 
& cplHpmcHpmVZVZ1,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,        & 
& cplHpmSucHpmcSuaa,cplHpmSucSd,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,cplSdcSdVG,               & 
& cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& cplSdcSdVP,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVZ,cplSdcSdVZVZaa,cplSdcSucVWm,       & 
& cplSdSdcSdcSdabab,cplSdSdcSdcSdabba,cplSdSucSdcSuabab,cplSdSucSdcSuabba,               & 
& cplSucSdVWm,cplSucSucVWmVWmaa,cplSucSuVG,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,    & 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSucSuVP,cplSucSuVPVPaa,cplSucSuVPVZaa,    & 
& cplSucSuVZ,cplSucSuVZVZaa,cplSuSucSucSuabab,cplSuSucSucSuabba,ctcplAhAhhh,             & 
& ctcplAhhhVZ,ctcplAhHpmcHpm,ctcplAhHpmcVWm,ctcplAhSdcSd,ctcplAhSucSu,ctcplcChaChaAhL,   & 
& ctcplcChaChaAhR,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,               & 
& ctcplChiChiAhL,ctcplChiChiAhR,GcplAhHpmcHpm,GcplcHpmVPVWm,GcplHpmcVWmVP,               & 
& GosZcplAhHpmcHpm,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplAhHpmcHpm,GZcplcHpmVPVWm,      & 
& GZcplHpmcVWmVP,ZcplAhAhhh,ZcplAhhhVZ,ZcplAhHpmcHpm,ZcplAhHpmcVWm,ZcplAhSdcSd,          & 
& ZcplAhSucSu,ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFuFuAhL,      & 
& ZcplcFuFuAhR,ZcplChiChiAhL,ZcplChiChiAhR,ZRUZD,ZRUZU,ZRUZH,ZRUZA,ZRUZP,ZRUZN,          & 
& ZRUUM,ZRUUP,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LAh)

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

Complex(dp),Intent(in) :: cplAhAhAhAh1(5,5,5,5),cplAhAhcVWmVWm1(5,5),cplAhAhhh(5,5,5),cplAhAhhhhh1(5,5,5,5),    & 
& cplAhAhHpmcHpm1(5,5,8,8),cplAhAhSdcSdaa(5,5,6,6),cplAhAhSucSuaa(5,5,6,6),              & 
& cplAhAhVZVZ1(5,5),cplAhcHpmVPVWm1(5,8),cplAhcHpmVWm(5,8),cplAhcHpmVWmVZ1(5,8),         & 
& cplAhhhHpmcHpm1(5,5,8,8),cplAhhhSdcSdaa(5,5,6,6),cplAhhhVZ(5,5),cplAhHpmcHpm(5,8,8),   & 
& cplAhHpmcVWm(5,8),cplAhHpmcVWmVP1(5,8),cplAhHpmcVWmVZ1(5,8),cplAhHpmSucSdaa(5,8,6,6),  & 
& cplAhSdcHpmcSuaa(5,6,8,6),cplAhSdcSd(5,6,6),cplAhSucSu(5,6,6),cplcChacFuSdL(5,3,6),    & 
& cplcChacFuSdR(5,3,6),cplcChaChaAhL(5,5,5),cplcChaChaAhR(5,5,5),cplcChaChahhL(5,5,5),   & 
& cplcChaChahhR(5,5,5),cplcChaChaVPL(5,5),cplcChaChaVPR(5,5),cplcChaChaVZL(5,5),         & 
& cplcChaChaVZR(5,5),cplcChaChiHpmL(5,7,8),cplcChaChiHpmR(5,7,8),cplcChaChiVWmL(5,7),    & 
& cplcChaChiVWmR(5,7),cplcChaFdcSuL(5,3,6),cplcChaFdcSuR(5,3,6),cplcFdChaSuL(3,5,6),     & 
& cplcFdChaSuR(3,5,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFdFdAhL(3,3,5),        & 
& cplcFdFdAhR(3,3,5),cplcFdFdhhL(3,3,5),cplcFdFdhhR(3,3,5),cplcFdFdVGL(3,3),             & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFuHpmL(3,3,8),cplcFdFuHpmR(3,3,8),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),           & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),           & 
& cplcFuFdcHpmL(3,3,8),cplcFuFdcHpmR(3,3,8),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuAhL(3,3,5),cplcFuFuAhR(3,3,5),cplcFuFuhhL(3,3,5),cplcFuFuhhR(3,3,5),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplcgAgWmcVWm,cplcgAgWpCVWm,      & 
& cplcgWmgAHpm(8),cplcgWmgAVWm,cplcgWmgWmAh(5),cplcgWmgWmhh(5),cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWmgZHpm(8),cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh(5),            & 
& cplcgWpCgWpChh(5),cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgZcHpm(8),cplcgWpCgZcVWm,      & 
& cplcgZgWmcHpm(8),cplcgZgWmcVWm,cplcgZgWpCHpm(8),cplcgZgWpCVWm,cplChaFucSdL(5,3,6),     & 
& cplChaFucSdR(5,3,6),cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),cplChiChacVWmL(7,5),   & 
& cplChiChacVWmR(7,5),cplChiChiAhL(7,7,5),cplChiChiAhR(7,7,5),cplChiChihhL(7,7,5),       & 
& cplChiChihhR(7,7,5),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcHpmVPVWm(8),           & 
& cplcHpmVWmVZ(8),cplcVWmVPVWm,cplcVWmVWmVZ,cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),         & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVPVWm1(5,8),cplhhcHpmVWm(5,8),            & 
& cplhhcHpmVWmVZ1(5,8),cplhhcVWmVWm(5),cplhhhhhh(5,5,5),cplhhhhHpmcHpm1(5,5,8,8),        & 
& cplhhhhSdcSdaa(5,5,6,6),cplhhhhSucSuaa(5,5,6,6),cplhhhhVZVZ1(5,5),cplhhHpmcHpm(5,8,8), & 
& cplhhHpmcVWm(5,8),cplhhHpmcVWmVP1(5,8),cplhhHpmcVWmVZ1(5,8),cplhhSdcSd(5,6,6),         & 
& cplhhSucSu(5,6,6),cplhhVZVZ(5),cplHpmcHpmcVWmVWm1(8,8),cplHpmcHpmVP(8,8),              & 
& cplHpmcHpmVPVP1(8,8),cplHpmcHpmVPVZ1(8,8),cplHpmcHpmVZ(8,8),cplHpmcHpmVZVZ1(8,8),      & 
& cplHpmcVWmVP(8),cplHpmcVWmVZ(8),cplHpmHpmcHpmcHpm1(8,8,8,8),cplHpmSdcHpmcSdaa(8,6,8,6),& 
& cplHpmSucHpmcSuaa(8,6,8,6),cplHpmSucSd(8,6,6),cplSdcHpmcSu(6,8,6),cplSdcSdcVWmVWmaa(6,6),& 
& cplSdcSdVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6)

Complex(dp),Intent(in) :: cplSdcSdVP(6,6),cplSdcSdVPVPaa(6,6),cplSdcSdVPVZaa(6,6),cplSdcSdVZ(6,6),               & 
& cplSdcSdVZVZaa(6,6),cplSdcSucVWm(6,6),cplSdSdcSdcSdabab(6,6,6,6),cplSdSdcSdcSdabba(6,6,6,6),& 
& cplSdSucSdcSuabab(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),cplSucSdVWm(6,6),cplSucSucVWmVWmaa(6,6),& 
& cplSucSuVG(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),& 
& cplSucSuVP(6,6),cplSucSuVPVPaa(6,6),cplSucSuVPVZaa(6,6),cplSucSuVZ(6,6),               & 
& cplSucSuVZVZaa(6,6),cplSuSucSucSuabab(6,6,6,6),cplSuSucSucSuabba(6,6,6,6),             & 
& ctcplAhAhhh(5,5,5),ctcplAhhhVZ(5,5),ctcplAhHpmcHpm(5,8,8),ctcplAhHpmcVWm(5,8),         & 
& ctcplAhSdcSd(5,6,6),ctcplAhSucSu(5,6,6),ctcplcChaChaAhL(5,5,5),ctcplcChaChaAhR(5,5,5), & 
& ctcplcFdFdAhL(3,3,5),ctcplcFdFdAhR(3,3,5),ctcplcFuFuAhL(3,3,5),ctcplcFuFuAhR(3,3,5),   & 
& ctcplChiChiAhL(7,7,5),ctcplChiChiAhR(7,7,5),GcplAhHpmcHpm(5,8,8),GcplcHpmVPVWm(8),     & 
& GcplHpmcVWmVP(8),GosZcplAhHpmcHpm(5,8,8),GosZcplcHpmVPVWm(8),GosZcplHpmcVWmVP(8),      & 
& GZcplAhHpmcHpm(5,8,8),GZcplcHpmVPVWm(8),GZcplHpmcVWmVP(8),ZcplAhAhhh(5,5,5),           & 
& ZcplAhhhVZ(5,5),ZcplAhHpmcHpm(5,8,8),ZcplAhHpmcVWm(5,8),ZcplAhSdcSd(5,6,6),            & 
& ZcplAhSucSu(5,6,6),ZcplcChaChaAhL(5,5,5),ZcplcChaChaAhR(5,5,5),ZcplcFdFdAhL(3,3,5),    & 
& ZcplcFdFdAhR(3,3,5),ZcplcFuFuAhL(3,3,5),ZcplcFuFuAhR(3,3,5),ZcplChiChiAhL(7,7,5),      & 
& ZcplChiChiAhR(7,7,5)

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
Real(dp), Intent(out) :: gP1LAh(5,270) 
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
Real(dp) :: MRPAhTohhAh(5,5,5),MRGAhTohhAh(5,5,5), MRPZAhTohhAh(5,5,5),MRGZAhTohhAh(5,5,5) 
Real(dp) :: MVPAhTohhAh(5,5,5) 
Real(dp) :: RMsqTreeAhTohhAh(5,5,5),RMsqWaveAhTohhAh(5,5,5),RMsqVertexAhTohhAh(5,5,5) 
Complex(dp) :: AmpTreeAhTohhAh(5,5,5),AmpWaveAhTohhAh(5,5,5)=(0._dp,0._dp),AmpVertexAhTohhAh(5,5,5)& 
 & ,AmpVertexIRosAhTohhAh(5,5,5),AmpVertexIRdrAhTohhAh(5,5,5), AmpSumAhTohhAh(5,5,5), AmpSum2AhTohhAh(5,5,5) 
Complex(dp) :: AmpTreeZAhTohhAh(5,5,5),AmpWaveZAhTohhAh(5,5,5),AmpVertexZAhTohhAh(5,5,5) 
Real(dp) :: AmpSqAhTohhAh(5,5,5),  AmpSqTreeAhTohhAh(5,5,5) 
Real(dp) :: MRPAhTocChaCha(5,5,5),MRGAhTocChaCha(5,5,5), MRPZAhTocChaCha(5,5,5),MRGZAhTocChaCha(5,5,5) 
Real(dp) :: MVPAhTocChaCha(5,5,5) 
Real(dp) :: RMsqTreeAhTocChaCha(5,5,5),RMsqWaveAhTocChaCha(5,5,5),RMsqVertexAhTocChaCha(5,5,5) 
Complex(dp) :: AmpTreeAhTocChaCha(2,5,5,5),AmpWaveAhTocChaCha(2,5,5,5)=(0._dp,0._dp),AmpVertexAhTocChaCha(2,5,5,5)& 
 & ,AmpVertexIRosAhTocChaCha(2,5,5,5),AmpVertexIRdrAhTocChaCha(2,5,5,5), AmpSumAhTocChaCha(2,5,5,5), AmpSum2AhTocChaCha(2,5,5,5) 
Complex(dp) :: AmpTreeZAhTocChaCha(2,5,5,5),AmpWaveZAhTocChaCha(2,5,5,5),AmpVertexZAhTocChaCha(2,5,5,5) 
Real(dp) :: AmpSqAhTocChaCha(5,5,5),  AmpSqTreeAhTocChaCha(5,5,5) 
Real(dp) :: MRPAhToChiChi(5,7,7),MRGAhToChiChi(5,7,7), MRPZAhToChiChi(5,7,7),MRGZAhToChiChi(5,7,7) 
Real(dp) :: MVPAhToChiChi(5,7,7) 
Real(dp) :: RMsqTreeAhToChiChi(5,7,7),RMsqWaveAhToChiChi(5,7,7),RMsqVertexAhToChiChi(5,7,7) 
Complex(dp) :: AmpTreeAhToChiChi(2,5,7,7),AmpWaveAhToChiChi(2,5,7,7)=(0._dp,0._dp),AmpVertexAhToChiChi(2,5,7,7)& 
 & ,AmpVertexIRosAhToChiChi(2,5,7,7),AmpVertexIRdrAhToChiChi(2,5,7,7), AmpSumAhToChiChi(2,5,7,7), AmpSum2AhToChiChi(2,5,7,7) 
Complex(dp) :: AmpTreeZAhToChiChi(2,5,7,7),AmpWaveZAhToChiChi(2,5,7,7),AmpVertexZAhToChiChi(2,5,7,7) 
Real(dp) :: AmpSqAhToChiChi(5,7,7),  AmpSqTreeAhToChiChi(5,7,7) 
Real(dp) :: MRPAhTocFdFd(5,3,3),MRGAhTocFdFd(5,3,3), MRPZAhTocFdFd(5,3,3),MRGZAhTocFdFd(5,3,3) 
Real(dp) :: MVPAhTocFdFd(5,3,3) 
Real(dp) :: RMsqTreeAhTocFdFd(5,3,3),RMsqWaveAhTocFdFd(5,3,3),RMsqVertexAhTocFdFd(5,3,3) 
Complex(dp) :: AmpTreeAhTocFdFd(2,5,3,3),AmpWaveAhTocFdFd(2,5,3,3)=(0._dp,0._dp),AmpVertexAhTocFdFd(2,5,3,3)& 
 & ,AmpVertexIRosAhTocFdFd(2,5,3,3),AmpVertexIRdrAhTocFdFd(2,5,3,3), AmpSumAhTocFdFd(2,5,3,3), AmpSum2AhTocFdFd(2,5,3,3) 
Complex(dp) :: AmpTreeZAhTocFdFd(2,5,3,3),AmpWaveZAhTocFdFd(2,5,3,3),AmpVertexZAhTocFdFd(2,5,3,3) 
Real(dp) :: AmpSqAhTocFdFd(5,3,3),  AmpSqTreeAhTocFdFd(5,3,3) 
Real(dp) :: MRPAhTocFuFu(5,3,3),MRGAhTocFuFu(5,3,3), MRPZAhTocFuFu(5,3,3),MRGZAhTocFuFu(5,3,3) 
Real(dp) :: MVPAhTocFuFu(5,3,3) 
Real(dp) :: RMsqTreeAhTocFuFu(5,3,3),RMsqWaveAhTocFuFu(5,3,3),RMsqVertexAhTocFuFu(5,3,3) 
Complex(dp) :: AmpTreeAhTocFuFu(2,5,3,3),AmpWaveAhTocFuFu(2,5,3,3)=(0._dp,0._dp),AmpVertexAhTocFuFu(2,5,3,3)& 
 & ,AmpVertexIRosAhTocFuFu(2,5,3,3),AmpVertexIRdrAhTocFuFu(2,5,3,3), AmpSumAhTocFuFu(2,5,3,3), AmpSum2AhTocFuFu(2,5,3,3) 
Complex(dp) :: AmpTreeZAhTocFuFu(2,5,3,3),AmpWaveZAhTocFuFu(2,5,3,3),AmpVertexZAhTocFuFu(2,5,3,3) 
Real(dp) :: AmpSqAhTocFuFu(5,3,3),  AmpSqTreeAhTocFuFu(5,3,3) 
Real(dp) :: MRPAhTohhVZ(5,5),MRGAhTohhVZ(5,5), MRPZAhTohhVZ(5,5),MRGZAhTohhVZ(5,5) 
Real(dp) :: MVPAhTohhVZ(5,5) 
Real(dp) :: RMsqTreeAhTohhVZ(5,5),RMsqWaveAhTohhVZ(5,5),RMsqVertexAhTohhVZ(5,5) 
Complex(dp) :: AmpTreeAhTohhVZ(2,5,5),AmpWaveAhTohhVZ(2,5,5)=(0._dp,0._dp),AmpVertexAhTohhVZ(2,5,5)& 
 & ,AmpVertexIRosAhTohhVZ(2,5,5),AmpVertexIRdrAhTohhVZ(2,5,5), AmpSumAhTohhVZ(2,5,5), AmpSum2AhTohhVZ(2,5,5) 
Complex(dp) :: AmpTreeZAhTohhVZ(2,5,5),AmpWaveZAhTohhVZ(2,5,5),AmpVertexZAhTohhVZ(2,5,5) 
Real(dp) :: AmpSqAhTohhVZ(5,5),  AmpSqTreeAhTohhVZ(5,5) 
Real(dp) :: MRPAhTocHpmHpm(5,8,8),MRGAhTocHpmHpm(5,8,8), MRPZAhTocHpmHpm(5,8,8),MRGZAhTocHpmHpm(5,8,8) 
Real(dp) :: MVPAhTocHpmHpm(5,8,8) 
Real(dp) :: RMsqTreeAhTocHpmHpm(5,8,8),RMsqWaveAhTocHpmHpm(5,8,8),RMsqVertexAhTocHpmHpm(5,8,8) 
Complex(dp) :: AmpTreeAhTocHpmHpm(5,8,8),AmpWaveAhTocHpmHpm(5,8,8)=(0._dp,0._dp),AmpVertexAhTocHpmHpm(5,8,8)& 
 & ,AmpVertexIRosAhTocHpmHpm(5,8,8),AmpVertexIRdrAhTocHpmHpm(5,8,8), AmpSumAhTocHpmHpm(5,8,8), AmpSum2AhTocHpmHpm(5,8,8) 
Complex(dp) :: AmpTreeZAhTocHpmHpm(5,8,8),AmpWaveZAhTocHpmHpm(5,8,8),AmpVertexZAhTocHpmHpm(5,8,8) 
Real(dp) :: AmpSqAhTocHpmHpm(5,8,8),  AmpSqTreeAhTocHpmHpm(5,8,8) 
Real(dp) :: MRPAhToHpmcVWm(5,8),MRGAhToHpmcVWm(5,8), MRPZAhToHpmcVWm(5,8),MRGZAhToHpmcVWm(5,8) 
Real(dp) :: MVPAhToHpmcVWm(5,8) 
Real(dp) :: RMsqTreeAhToHpmcVWm(5,8),RMsqWaveAhToHpmcVWm(5,8),RMsqVertexAhToHpmcVWm(5,8) 
Complex(dp) :: AmpTreeAhToHpmcVWm(2,5,8),AmpWaveAhToHpmcVWm(2,5,8)=(0._dp,0._dp),AmpVertexAhToHpmcVWm(2,5,8)& 
 & ,AmpVertexIRosAhToHpmcVWm(2,5,8),AmpVertexIRdrAhToHpmcVWm(2,5,8), AmpSumAhToHpmcVWm(2,5,8), AmpSum2AhToHpmcVWm(2,5,8) 
Complex(dp) :: AmpTreeZAhToHpmcVWm(2,5,8),AmpWaveZAhToHpmcVWm(2,5,8),AmpVertexZAhToHpmcVWm(2,5,8) 
Real(dp) :: AmpSqAhToHpmcVWm(5,8),  AmpSqTreeAhToHpmcVWm(5,8) 
Real(dp) :: MRPAhTocSdSd(5,6,6),MRGAhTocSdSd(5,6,6), MRPZAhTocSdSd(5,6,6),MRGZAhTocSdSd(5,6,6) 
Real(dp) :: MVPAhTocSdSd(5,6,6) 
Real(dp) :: RMsqTreeAhTocSdSd(5,6,6),RMsqWaveAhTocSdSd(5,6,6),RMsqVertexAhTocSdSd(5,6,6) 
Complex(dp) :: AmpTreeAhTocSdSd(5,6,6),AmpWaveAhTocSdSd(5,6,6)=(0._dp,0._dp),AmpVertexAhTocSdSd(5,6,6)& 
 & ,AmpVertexIRosAhTocSdSd(5,6,6),AmpVertexIRdrAhTocSdSd(5,6,6), AmpSumAhTocSdSd(5,6,6), AmpSum2AhTocSdSd(5,6,6) 
Complex(dp) :: AmpTreeZAhTocSdSd(5,6,6),AmpWaveZAhTocSdSd(5,6,6),AmpVertexZAhTocSdSd(5,6,6) 
Real(dp) :: AmpSqAhTocSdSd(5,6,6),  AmpSqTreeAhTocSdSd(5,6,6) 
Real(dp) :: MRPAhTocSuSu(5,6,6),MRGAhTocSuSu(5,6,6), MRPZAhTocSuSu(5,6,6),MRGZAhTocSuSu(5,6,6) 
Real(dp) :: MVPAhTocSuSu(5,6,6) 
Real(dp) :: RMsqTreeAhTocSuSu(5,6,6),RMsqWaveAhTocSuSu(5,6,6),RMsqVertexAhTocSuSu(5,6,6) 
Complex(dp) :: AmpTreeAhTocSuSu(5,6,6),AmpWaveAhTocSuSu(5,6,6)=(0._dp,0._dp),AmpVertexAhTocSuSu(5,6,6)& 
 & ,AmpVertexIRosAhTocSuSu(5,6,6),AmpVertexIRdrAhTocSuSu(5,6,6), AmpSumAhTocSuSu(5,6,6), AmpSum2AhTocSuSu(5,6,6) 
Complex(dp) :: AmpTreeZAhTocSuSu(5,6,6),AmpWaveZAhTocSuSu(5,6,6),AmpVertexZAhTocSuSu(5,6,6) 
Real(dp) :: AmpSqAhTocSuSu(5,6,6),  AmpSqTreeAhTocSuSu(5,6,6) 
Real(dp) :: MRPAhToAhAh(5,5,5),MRGAhToAhAh(5,5,5), MRPZAhToAhAh(5,5,5),MRGZAhToAhAh(5,5,5) 
Real(dp) :: MVPAhToAhAh(5,5,5) 
Real(dp) :: RMsqTreeAhToAhAh(5,5,5),RMsqWaveAhToAhAh(5,5,5),RMsqVertexAhToAhAh(5,5,5) 
Complex(dp) :: AmpTreeAhToAhAh(5,5,5),AmpWaveAhToAhAh(5,5,5)=(0._dp,0._dp),AmpVertexAhToAhAh(5,5,5)& 
 & ,AmpVertexIRosAhToAhAh(5,5,5),AmpVertexIRdrAhToAhAh(5,5,5), AmpSumAhToAhAh(5,5,5), AmpSum2AhToAhAh(5,5,5) 
Complex(dp) :: AmpTreeZAhToAhAh(5,5,5),AmpWaveZAhToAhAh(5,5,5),AmpVertexZAhToAhAh(5,5,5) 
Real(dp) :: AmpSqAhToAhAh(5,5,5),  AmpSqTreeAhToAhAh(5,5,5) 
Real(dp) :: MRPAhToAhVP(5,5),MRGAhToAhVP(5,5), MRPZAhToAhVP(5,5),MRGZAhToAhVP(5,5) 
Real(dp) :: MVPAhToAhVP(5,5) 
Real(dp) :: RMsqTreeAhToAhVP(5,5),RMsqWaveAhToAhVP(5,5),RMsqVertexAhToAhVP(5,5) 
Complex(dp) :: AmpTreeAhToAhVP(2,5,5),AmpWaveAhToAhVP(2,5,5)=(0._dp,0._dp),AmpVertexAhToAhVP(2,5,5)& 
 & ,AmpVertexIRosAhToAhVP(2,5,5),AmpVertexIRdrAhToAhVP(2,5,5), AmpSumAhToAhVP(2,5,5), AmpSum2AhToAhVP(2,5,5) 
Complex(dp) :: AmpTreeZAhToAhVP(2,5,5),AmpWaveZAhToAhVP(2,5,5),AmpVertexZAhToAhVP(2,5,5) 
Real(dp) :: AmpSqAhToAhVP(5,5),  AmpSqTreeAhToAhVP(5,5) 
Real(dp) :: MRPAhToAhVZ(5,5),MRGAhToAhVZ(5,5), MRPZAhToAhVZ(5,5),MRGZAhToAhVZ(5,5) 
Real(dp) :: MVPAhToAhVZ(5,5) 
Real(dp) :: RMsqTreeAhToAhVZ(5,5),RMsqWaveAhToAhVZ(5,5),RMsqVertexAhToAhVZ(5,5) 
Complex(dp) :: AmpTreeAhToAhVZ(2,5,5),AmpWaveAhToAhVZ(2,5,5)=(0._dp,0._dp),AmpVertexAhToAhVZ(2,5,5)& 
 & ,AmpVertexIRosAhToAhVZ(2,5,5),AmpVertexIRdrAhToAhVZ(2,5,5), AmpSumAhToAhVZ(2,5,5), AmpSum2AhToAhVZ(2,5,5) 
Complex(dp) :: AmpTreeZAhToAhVZ(2,5,5),AmpWaveZAhToAhVZ(2,5,5),AmpVertexZAhToAhVZ(2,5,5) 
Real(dp) :: AmpSqAhToAhVZ(5,5),  AmpSqTreeAhToAhVZ(5,5) 
Real(dp) :: MRPAhToGluGlu(5),MRGAhToGluGlu(5), MRPZAhToGluGlu(5),MRGZAhToGluGlu(5) 
Real(dp) :: MVPAhToGluGlu(5) 
Real(dp) :: RMsqTreeAhToGluGlu(5),RMsqWaveAhToGluGlu(5),RMsqVertexAhToGluGlu(5) 
Complex(dp) :: AmpTreeAhToGluGlu(2,5),AmpWaveAhToGluGlu(2,5)=(0._dp,0._dp),AmpVertexAhToGluGlu(2,5)& 
 & ,AmpVertexIRosAhToGluGlu(2,5),AmpVertexIRdrAhToGluGlu(2,5), AmpSumAhToGluGlu(2,5), AmpSum2AhToGluGlu(2,5) 
Complex(dp) :: AmpTreeZAhToGluGlu(2,5),AmpWaveZAhToGluGlu(2,5),AmpVertexZAhToGluGlu(2,5) 
Real(dp) :: AmpSqAhToGluGlu(5),  AmpSqTreeAhToGluGlu(5) 
Real(dp) :: MRPAhTohhhh(5,5,5),MRGAhTohhhh(5,5,5), MRPZAhTohhhh(5,5,5),MRGZAhTohhhh(5,5,5) 
Real(dp) :: MVPAhTohhhh(5,5,5) 
Real(dp) :: RMsqTreeAhTohhhh(5,5,5),RMsqWaveAhTohhhh(5,5,5),RMsqVertexAhTohhhh(5,5,5) 
Complex(dp) :: AmpTreeAhTohhhh(5,5,5),AmpWaveAhTohhhh(5,5,5)=(0._dp,0._dp),AmpVertexAhTohhhh(5,5,5)& 
 & ,AmpVertexIRosAhTohhhh(5,5,5),AmpVertexIRdrAhTohhhh(5,5,5), AmpSumAhTohhhh(5,5,5), AmpSum2AhTohhhh(5,5,5) 
Complex(dp) :: AmpTreeZAhTohhhh(5,5,5),AmpWaveZAhTohhhh(5,5,5),AmpVertexZAhTohhhh(5,5,5) 
Real(dp) :: AmpSqAhTohhhh(5,5,5),  AmpSqTreeAhTohhhh(5,5,5) 
Real(dp) :: MRPAhTohhVP(5,5),MRGAhTohhVP(5,5), MRPZAhTohhVP(5,5),MRGZAhTohhVP(5,5) 
Real(dp) :: MVPAhTohhVP(5,5) 
Real(dp) :: RMsqTreeAhTohhVP(5,5),RMsqWaveAhTohhVP(5,5),RMsqVertexAhTohhVP(5,5) 
Complex(dp) :: AmpTreeAhTohhVP(2,5,5),AmpWaveAhTohhVP(2,5,5)=(0._dp,0._dp),AmpVertexAhTohhVP(2,5,5)& 
 & ,AmpVertexIRosAhTohhVP(2,5,5),AmpVertexIRdrAhTohhVP(2,5,5), AmpSumAhTohhVP(2,5,5), AmpSum2AhTohhVP(2,5,5) 
Complex(dp) :: AmpTreeZAhTohhVP(2,5,5),AmpWaveZAhTohhVP(2,5,5),AmpVertexZAhTohhVP(2,5,5) 
Real(dp) :: AmpSqAhTohhVP(5,5),  AmpSqTreeAhTohhVP(5,5) 
Real(dp) :: MRPAhToVGVG(5),MRGAhToVGVG(5), MRPZAhToVGVG(5),MRGZAhToVGVG(5) 
Real(dp) :: MVPAhToVGVG(5) 
Real(dp) :: RMsqTreeAhToVGVG(5),RMsqWaveAhToVGVG(5),RMsqVertexAhToVGVG(5) 
Complex(dp) :: AmpTreeAhToVGVG(2,5),AmpWaveAhToVGVG(2,5)=(0._dp,0._dp),AmpVertexAhToVGVG(2,5)& 
 & ,AmpVertexIRosAhToVGVG(2,5),AmpVertexIRdrAhToVGVG(2,5), AmpSumAhToVGVG(2,5), AmpSum2AhToVGVG(2,5) 
Complex(dp) :: AmpTreeZAhToVGVG(2,5),AmpWaveZAhToVGVG(2,5),AmpVertexZAhToVGVG(2,5) 
Real(dp) :: AmpSqAhToVGVG(5),  AmpSqTreeAhToVGVG(5) 
Real(dp) :: MRPAhToVPVP(5),MRGAhToVPVP(5), MRPZAhToVPVP(5),MRGZAhToVPVP(5) 
Real(dp) :: MVPAhToVPVP(5) 
Real(dp) :: RMsqTreeAhToVPVP(5),RMsqWaveAhToVPVP(5),RMsqVertexAhToVPVP(5) 
Complex(dp) :: AmpTreeAhToVPVP(2,5),AmpWaveAhToVPVP(2,5)=(0._dp,0._dp),AmpVertexAhToVPVP(2,5)& 
 & ,AmpVertexIRosAhToVPVP(2,5),AmpVertexIRdrAhToVPVP(2,5), AmpSumAhToVPVP(2,5), AmpSum2AhToVPVP(2,5) 
Complex(dp) :: AmpTreeZAhToVPVP(2,5),AmpWaveZAhToVPVP(2,5),AmpVertexZAhToVPVP(2,5) 
Real(dp) :: AmpSqAhToVPVP(5),  AmpSqTreeAhToVPVP(5) 
Real(dp) :: MRPAhToVPVZ(5),MRGAhToVPVZ(5), MRPZAhToVPVZ(5),MRGZAhToVPVZ(5) 
Real(dp) :: MVPAhToVPVZ(5) 
Real(dp) :: RMsqTreeAhToVPVZ(5),RMsqWaveAhToVPVZ(5),RMsqVertexAhToVPVZ(5) 
Complex(dp) :: AmpTreeAhToVPVZ(2,5),AmpWaveAhToVPVZ(2,5)=(0._dp,0._dp),AmpVertexAhToVPVZ(2,5)& 
 & ,AmpVertexIRosAhToVPVZ(2,5),AmpVertexIRdrAhToVPVZ(2,5), AmpSumAhToVPVZ(2,5), AmpSum2AhToVPVZ(2,5) 
Complex(dp) :: AmpTreeZAhToVPVZ(2,5),AmpWaveZAhToVPVZ(2,5),AmpVertexZAhToVPVZ(2,5) 
Real(dp) :: AmpSqAhToVPVZ(5),  AmpSqTreeAhToVPVZ(5) 
Real(dp) :: MRPAhToVWmcVWm(5),MRGAhToVWmcVWm(5), MRPZAhToVWmcVWm(5),MRGZAhToVWmcVWm(5) 
Real(dp) :: MVPAhToVWmcVWm(5) 
Real(dp) :: RMsqTreeAhToVWmcVWm(5),RMsqWaveAhToVWmcVWm(5),RMsqVertexAhToVWmcVWm(5) 
Complex(dp) :: AmpTreeAhToVWmcVWm(2,5),AmpWaveAhToVWmcVWm(2,5)=(0._dp,0._dp),AmpVertexAhToVWmcVWm(2,5)& 
 & ,AmpVertexIRosAhToVWmcVWm(2,5),AmpVertexIRdrAhToVWmcVWm(2,5), AmpSumAhToVWmcVWm(2,5), AmpSum2AhToVWmcVWm(2,5) 
Complex(dp) :: AmpTreeZAhToVWmcVWm(2,5),AmpWaveZAhToVWmcVWm(2,5),AmpVertexZAhToVWmcVWm(2,5) 
Real(dp) :: AmpSqAhToVWmcVWm(5),  AmpSqTreeAhToVWmcVWm(5) 
Real(dp) :: MRPAhToVZVZ(5),MRGAhToVZVZ(5), MRPZAhToVZVZ(5),MRGZAhToVZVZ(5) 
Real(dp) :: MVPAhToVZVZ(5) 
Real(dp) :: RMsqTreeAhToVZVZ(5),RMsqWaveAhToVZVZ(5),RMsqVertexAhToVZVZ(5) 
Complex(dp) :: AmpTreeAhToVZVZ(2,5),AmpWaveAhToVZVZ(2,5)=(0._dp,0._dp),AmpVertexAhToVZVZ(2,5)& 
 & ,AmpVertexIRosAhToVZVZ(2,5),AmpVertexIRdrAhToVZVZ(2,5), AmpSumAhToVZVZ(2,5), AmpSum2AhToVZVZ(2,5) 
Complex(dp) :: AmpTreeZAhToVZVZ(2,5),AmpWaveZAhToVZVZ(2,5),AmpVertexZAhToVZVZ(2,5) 
Real(dp) :: AmpSqAhToVZVZ(5),  AmpSqTreeAhToVZVZ(5) 
Write(*,*) "Calculating one-loop decays of Ah " 
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
isave = 3

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhTohhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhAh)

  Else 
Call Amplitude_Tree_MSSMLV_AhTohhAh(ZcplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAhOS,MhhOS,MRPAhTohhAh,      & 
& MRGAhTohhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhTohhAh(MLambda,em,gs,ZcplAhAhhh,MAhOS,MhhOS,MRPAhTohhAh,     & 
& MRGAhTohhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,MRPAhTohhAh,          & 
& MRGAhTohhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhTohhAh(MLambda,em,gs,ZcplAhAhhh,MAh,Mhh,MRPAhTohhAh,         & 
& MRGAhTohhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTohhAh(cplAhAhhh,ctcplAhAhhh,MAh,MAh2,Mhh,               & 
& Mhh2,ZfAh,Zfhh,AmpWaveAhTohhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTohhAh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,MSd,             & 
& MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,           & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhhhhh1,   & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSucSuaa,cplAhAhcVWmVWm1,cplAhAhVZVZ1,            & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,AmpVertexAhTohhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhAh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,           & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhhhhh1,   & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSucSuaa,cplAhAhcVWmVWm1,cplAhAhVZVZ1,            & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,AmpVertexIRdrAhTohhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,            & 
& Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVWm2OS,MVZ2OS,ZcplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,            & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSucSuaa,     & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,AmpVertexIRosAhTohhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhAh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& ZcplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,           & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhhhhh1,   & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSucSuaa,cplAhAhcVWmVWm1,cplAhAhVZVZ1,            & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,AmpVertexIRosAhTohhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,            & 
& Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,            & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSucSuaa,     & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,AmpVertexIRosAhTohhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhAh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,           & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplAhAhAhAh1,cplAhAhhhhh1,   & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSucSuaa,cplAhAhcVWmVWm1,cplAhAhVZVZ1,            & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,AmpVertexIRosAhTohhAh)

 End if 
 End if 
AmpVertexAhTohhAh = AmpVertexAhTohhAh -  AmpVertexIRdrAhTohhAh! +  AmpVertexIRosAhTohhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTohhAh(gt2,:,:) = AmpWaveZAhTohhAh(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhAh(gt1,:,:) 
AmpVertexZAhTohhAh(gt2,:,:)= AmpVertexZAhTohhAh(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
! Final State 1 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTohhAh(:,gt2,:) = AmpWaveZAhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWaveAhTohhAh(:,gt1,:) 
AmpVertexZAhTohhAh(:,gt2,:)= AmpVertexZAhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexAhTohhAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
! Final State 2 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTohhAh(:,:,gt2) = AmpWaveZAhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveAhTohhAh(:,:,gt1) 
AmpVertexZAhTohhAh(:,:,gt2)= AmpVertexZAhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexAhTohhAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhAh = AmpVertexAhTohhAh  +  AmpVertexIRosAhTohhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhAh = AmpTreeAhTohhAh 
 AmpSum2AhTohhAh = AmpTreeAhTohhAh + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh  
Else 
 AmpSumAhTohhAh = AmpTreeAhTohhAh + AmpWaveAhTohhAh + AmpVertexAhTohhAh
 AmpSum2AhTohhAh = AmpTreeAhTohhAh + AmpWaveAhTohhAh + AmpVertexAhTohhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhAh = AmpTreeAhTohhAh
 AmpSum2AhTohhAh = AmpTreeAhTohhAh 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
    Do gt3=2,5
If (((OSkinematics).and.(MAhOS(gt1).gt.(MhhOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(Mhh(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = 2._dp*AmpWaveAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = 2._dp*AmpVertexAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreeAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3)  
  AmpSum2AhTohhAh = + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3) + AmpSqTreeAhTohhAh(gt1, gt2, gt3)  
Else  
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreeAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3)  
  AmpSum2AhTohhAh = + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3) + AmpSqTreeAhTohhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTohhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),helfactor*AmpSqAhTohhAh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),Mhh(gt2),MAh(gt3),helfactor*AmpSqAhTohhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhTohhAh(gt1, gt2, gt3) + MRGAhTohhAh(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhTohhAh(gt1, gt2, gt3) + MRGAhTohhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! bar(Cha) Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhTocChaCha(cplcChaChaAhL,cplcChaChaAhR,MAh,               & 
& MCha,MAh2,MCha2,AmpTreeAhTocChaCha)

  Else 
Call Amplitude_Tree_MSSMLV_AhTocChaCha(ZcplcChaChaAhL,ZcplcChaChaAhR,MAh,             & 
& MCha,MAh2,MCha2,AmpTreeAhTocChaCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhTocChaCha(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,         & 
& MAhOS,MChaOS,MRPAhTocChaCha,MRGAhTocChaCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhTocChaCha(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,       & 
& MAhOS,MChaOS,MRPAhTocChaCha,MRGAhTocChaCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhTocChaCha(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,         & 
& MAh,MCha,MRPAhTocChaCha,MRGAhTocChaCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhTocChaCha(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,       & 
& MAh,MCha,MRPAhTocChaCha,MRGAhTocChaCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTocChaCha(cplcChaChaAhL,cplcChaChaAhR,ctcplcChaChaAhL,   & 
& ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,AmpWaveAhTocChaCha)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTocChaCha(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,   & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexAhTocChaCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocChaCha(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,   & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrAhTocChaCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,ZcplcChaChaAhL,      & 
& ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,    & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChacFuSdL,               & 
& cplcChacFuSdR,AmpVertexIRosAhTocChaCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocChaCha(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,ZcplcChaChaAhL,ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,   & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocChaCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,    & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChacFuSdL,               & 
& cplcChacFuSdR,AmpVertexIRosAhTocChaCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocChaCha(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,   & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocChaCha)

 End if 
 End if 
AmpVertexAhTocChaCha = AmpVertexAhTocChaCha -  AmpVertexIRdrAhTocChaCha! +  AmpVertexIRosAhTocChaCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTocChaCha(:,gt2,:,:) = AmpWaveZAhTocChaCha(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocChaCha(:,gt1,:,:) 
AmpVertexZAhTocChaCha(:,gt2,:,:)= AmpVertexZAhTocChaCha(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocChaCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
! Final State 1 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTocChaCha(1,:,gt2,:) = AmpWaveZAhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveAhTocChaCha(1,:,gt1,:) 
AmpVertexZAhTocChaCha(1,:,gt2,:)= AmpVertexZAhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpVertexAhTocChaCha(1,:,gt1,:) 
AmpWaveZAhTocChaCha(2,:,gt2,:) = AmpWaveZAhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveAhTocChaCha(2,:,gt1,:) 
AmpVertexZAhTocChaCha(2,:,gt2,:)= AmpVertexZAhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpVertexAhTocChaCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
! Final State 2 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTocChaCha(1,:,:,gt2) = AmpWaveZAhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveAhTocChaCha(1,:,:,gt1) 
AmpVertexZAhTocChaCha(1,:,:,gt2)= AmpVertexZAhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexAhTocChaCha(1,:,:,gt1) 
AmpWaveZAhTocChaCha(2,:,:,gt2) = AmpWaveZAhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveAhTocChaCha(2,:,:,gt1) 
AmpVertexZAhTocChaCha(2,:,:,gt2)= AmpVertexZAhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexAhTocChaCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocChaCha = AmpVertexAhTocChaCha  +  AmpVertexIRosAhTocChaCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Cha] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha 
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha  
Else 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha + AmpWaveAhTocChaCha + AmpVertexAhTocChaCha
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + AmpWaveAhTocChaCha + AmpVertexAhTocChaCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
    Do gt3=1,5
If (((OSkinematics).and.(MAhOS(gt1).gt.(MChaOS(gt2)+MChaOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MCha(gt2)+MCha(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = 2._dp*AmpWaveAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = 2._dp*AmpVertexAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreeAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3)  
  AmpSum2AhTocChaCha = + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3) + AmpSqTreeAhTocChaCha(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreeAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3)  
  AmpSum2AhTocChaCha = + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3) + AmpSqTreeAhTocChaCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocChaCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocChaCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),helfactor*AmpSqAhTocChaCha(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MCha(gt2),MCha(gt3),helfactor*AmpSqAhTocChaCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocChaCha(gt1, gt2, gt3) + MRGAhTocChaCha(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocChaCha(gt1, gt2, gt3) + MRGAhTocChaCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! Chi Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhToChiChi(cplChiChiAhL,cplChiChiAhR,MAh,MChi,             & 
& MAh2,MChi2,AmpTreeAhToChiChi)

  Else 
Call Amplitude_Tree_MSSMLV_AhToChiChi(ZcplChiChiAhL,ZcplChiChiAhR,MAh,MChi,           & 
& MAh2,MChi2,AmpTreeAhToChiChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhToChiChi(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,            & 
& MAhOS,MChiOS,MRPAhToChiChi,MRGAhToChiChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhToChiChi(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,          & 
& MAhOS,MChiOS,MRPAhToChiChi,MRGAhToChiChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhToChiChi(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,            & 
& MAh,MChi,MRPAhToChiChi,MRGAhToChiChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhToChiChi(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,          & 
& MAh,MChi,MRPAhToChiChi,MRGAhToChiChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhToChiChi(cplChiChiAhL,cplChiChiAhR,ctcplChiChiAhL,       & 
& ctcplChiChiAhR,MAh,MAh2,MChi,MChi2,ZfAh,ZfL0,AmpWaveAhToChiChi)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToChiChi(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,               & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexAhToChiChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhToChiChi(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRdrAhToChiChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,            & 
& Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL, & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhToChiChi(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,           & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,            & 
& Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL, & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhToChiChi(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,            & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

 End if 
 End if 
AmpVertexAhToChiChi = AmpVertexAhToChiChi -  AmpVertexIRdrAhToChiChi! +  AmpVertexIRosAhToChiChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhToChiChi(:,gt2,:,:) = AmpWaveZAhToChiChi(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhToChiChi(:,gt1,:,:) 
AmpVertexZAhToChiChi(:,gt2,:,:)= AmpVertexZAhToChiChi(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhToChiChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
! Final State 1 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZAhToChiChi(1,:,gt2,:) = AmpWaveZAhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(1,:,gt1,:) 
AmpVertexZAhToChiChi(1,:,gt2,:)= AmpVertexZAhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(1,:,gt1,:) 
AmpWaveZAhToChiChi(2,:,gt2,:) = AmpWaveZAhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveAhToChiChi(2,:,gt1,:) 
AmpVertexZAhToChiChi(2,:,gt2,:)= AmpVertexZAhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexAhToChiChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
! Final State 2 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,7
  Do gt2=1,7
AmpWaveZAhToChiChi(1,:,:,gt2) = AmpWaveZAhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(1,:,:,gt1) 
AmpVertexZAhToChiChi(1,:,:,gt2)= AmpVertexZAhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(1,:,:,gt1) 
AmpWaveZAhToChiChi(2,:,:,gt2) = AmpWaveZAhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(2,:,:,gt1) 
AmpVertexZAhToChiChi(2,:,:,gt2)= AmpVertexZAhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
End if
If (ShiftIRdiv) Then 
AmpVertexAhToChiChi = AmpVertexAhToChiChi  +  AmpVertexIRosAhToChiChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Chi Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToChiChi = AmpTreeAhToChiChi 
 AmpSum2AhToChiChi = AmpTreeAhToChiChi + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi  
Else 
 AmpSumAhToChiChi = AmpTreeAhToChiChi + AmpWaveAhToChiChi + AmpVertexAhToChiChi
 AmpSum2AhToChiChi = AmpTreeAhToChiChi + AmpWaveAhToChiChi + AmpVertexAhToChiChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToChiChi = AmpTreeAhToChiChi
 AmpSum2AhToChiChi = AmpTreeAhToChiChi 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,7
    Do gt3=gt2,7
If (((OSkinematics).and.(MAhOS(gt1).gt.(MChiOS(gt2)+MChiOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MChi(gt2)+MChi(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = 2._dp*AmpWaveAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = 2._dp*AmpVertexAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToChiChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreeAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3)  
  AmpSum2AhToChiChi = + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3) + AmpSqTreeAhToChiChi(gt1, gt2, gt3)  
Else  
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreeAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3)  
  AmpSum2AhToChiChi = + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3) + AmpSqTreeAhToChiChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhToChiChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToChiChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),helfactor*AmpSqAhToChiChi(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MChi(gt2),MChi(gt3),helfactor*AmpSqAhToChiChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToChiChi(gt1, gt2, gt3) + MRGAhToChiChi(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToChiChi(gt1, gt2, gt3) + MRGAhToChiChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,MAh,MFd,MAh2,            & 
& MFd2,AmpTreeAhTocFdFd)

  Else 
Call Amplitude_Tree_MSSMLV_AhTocFdFd(ZcplcFdFdAhL,ZcplcFdFdAhR,MAh,MFd,               & 
& MAh2,MFd2,AmpTreeAhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,               & 
& MAhOS,MFdOS,MRPAhTocFdFd,MRGAhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhTocFdFd(MLambda,em,gs,ZcplcFdFdAhL,ZcplcFdFdAhR,             & 
& MAhOS,MFdOS,MRPAhTocFdFd,MRGAhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,               & 
& MAh,MFd,MRPAhTocFdFd,MRGAhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhTocFdFd(MLambda,em,gs,ZcplcFdFdAhL,ZcplcFdFdAhR,             & 
& MAh,MFd,MRPAhTocFdFd,MRGAhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,ctcplcFdFdAhL,           & 
& ctcplcFdFdAhR,MAh,MAh2,MFd,MFd2,ZfAh,ZfFDL,ZfFDR,AmpWaveAhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,           & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,             & 
& MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,          & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,             & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFdGluSdL,cplcFdGluSdR,AmpVertexAhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,             & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFdGluSdL,cplcFdGluSdR,AmpVertexIRdrAhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,ZcplcFdFdAhL,          & 
& ZcplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,             & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,        & 
& cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,              & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,             & 
& cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,      & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,             & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,        & 
& cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,             & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFdGluSdL,cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

 End if 
 End if 
AmpVertexAhTocFdFd = AmpVertexAhTocFdFd -  AmpVertexIRdrAhTocFdFd! +  AmpVertexIRosAhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTocFdFd(:,gt2,:,:) = AmpWaveZAhTocFdFd(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFdFd(:,gt1,:,:) 
AmpVertexZAhTocFdFd(:,gt2,:,:)= AmpVertexZAhTocFdFd(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFdFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
! Final State 1 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFdFd(1,:,gt2,:) = AmpWaveZAhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpWaveAhTocFdFd(1,:,gt1,:) 
AmpVertexZAhTocFdFd(1,:,gt2,:)= AmpVertexZAhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpVertexAhTocFdFd(1,:,gt1,:) 
AmpWaveZAhTocFdFd(2,:,gt2,:) = AmpWaveZAhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpWaveAhTocFdFd(2,:,gt1,:) 
AmpVertexZAhTocFdFd(2,:,gt2,:)= AmpVertexZAhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpVertexAhTocFdFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
! Final State 2 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFdFd(1,:,:,gt2) = AmpWaveZAhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpWaveAhTocFdFd(1,:,:,gt1) 
AmpVertexZAhTocFdFd(1,:,:,gt2)= AmpVertexZAhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpVertexAhTocFdFd(1,:,:,gt1) 
AmpWaveZAhTocFdFd(2,:,:,gt2) = AmpWaveZAhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpWaveAhTocFdFd(2,:,:,gt1) 
AmpVertexZAhTocFdFd(2,:,:,gt2)= AmpVertexZAhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpVertexAhTocFdFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFdFd = AmpVertexAhTocFdFd  +  AmpVertexIRosAhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd 
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd  
Else 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd + AmpWaveAhTocFdFd + AmpVertexAhTocFdFd
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + AmpWaveAhTocFdFd + AmpVertexAhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MAhOS(gt1).gt.(MFdOS(gt2)+MFdOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MFd(gt2)+MFd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = 2._dp*AmpWaveAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = 2._dp*AmpVertexAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3)  
  AmpSum2AhTocFdFd = + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3) + AmpSqTreeAhTocFdFd(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3)  
  AmpSum2AhTocFdFd = + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3) + AmpSqTreeAhTocFdFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFdFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFdFd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqAhTocFdFd(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MFd(gt2),MFd(gt3),helfactor*AmpSqAhTocFdFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFdFd(gt1, gt2, gt3) + MRGAhTocFdFd(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFdFd(gt1, gt2, gt3) + MRGAhTocFdFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! bar(Fu) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,MAh,MFu,MAh2,            & 
& MFu2,AmpTreeAhTocFuFu)

  Else 
Call Amplitude_Tree_MSSMLV_AhTocFuFu(ZcplcFuFuAhL,ZcplcFuFuAhR,MAh,MFu,               & 
& MAh2,MFu2,AmpTreeAhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,               & 
& MAhOS,MFuOS,MRPAhTocFuFu,MRGAhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhTocFuFu(MLambda,em,gs,ZcplcFuFuAhL,ZcplcFuFuAhR,             & 
& MAhOS,MFuOS,MRPAhTocFuFu,MRGAhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,               & 
& MAh,MFu,MRPAhTocFuFu,MRGAhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhTocFuFu(MLambda,em,gs,ZcplcFuFuAhL,ZcplcFuFuAhR,             & 
& MAh,MFu,MRPAhTocFuFu,MRGAhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,ctcplcFuFuAhL,           & 
& ctcplcFuFuAhR,MAh,MAh2,MFu,MFu2,ZfAh,ZfFUL,ZfFUR,AmpWaveAhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,           & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,             & 
& MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,          & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,             & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexAhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,             & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrAhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,             & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,          & 
& cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,cplAhhhVZ,              & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,             & 
& cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,             & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,      & 
& cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,          & 
& cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,             & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

 End if 
 End if 
AmpVertexAhTocFuFu = AmpVertexAhTocFuFu -  AmpVertexIRdrAhTocFuFu! +  AmpVertexIRosAhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTocFuFu(:,gt2,:,:) = AmpWaveZAhTocFuFu(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFuFu(:,gt1,:,:) 
AmpVertexZAhTocFuFu(:,gt2,:,:)= AmpVertexZAhTocFuFu(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFuFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
! Final State 1 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFuFu(1,:,gt2,:) = AmpWaveZAhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWaveAhTocFuFu(1,:,gt1,:) 
AmpVertexZAhTocFuFu(1,:,gt2,:)= AmpVertexZAhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexAhTocFuFu(1,:,gt1,:) 
AmpWaveZAhTocFuFu(2,:,gt2,:) = AmpWaveZAhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWaveAhTocFuFu(2,:,gt1,:) 
AmpVertexZAhTocFuFu(2,:,gt2,:)= AmpVertexZAhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexAhTocFuFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
! Final State 2 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFuFu(1,:,:,gt2) = AmpWaveZAhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpWaveAhTocFuFu(1,:,:,gt1) 
AmpVertexZAhTocFuFu(1,:,:,gt2)= AmpVertexZAhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpVertexAhTocFuFu(1,:,:,gt1) 
AmpWaveZAhTocFuFu(2,:,:,gt2) = AmpWaveZAhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpWaveAhTocFuFu(2,:,:,gt1) 
AmpVertexZAhTocFuFu(2,:,:,gt2)= AmpVertexZAhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpVertexAhTocFuFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFuFu = AmpVertexAhTocFuFu  +  AmpVertexIRosAhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu 
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu  
Else 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu + AmpWaveAhTocFuFu + AmpVertexAhTocFuFu
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + AmpWaveAhTocFuFu + AmpVertexAhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MAhOS(gt1).gt.(MFuOS(gt2)+MFuOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MFu(gt2)+MFu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = 2._dp*AmpWaveAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = 2._dp*AmpVertexAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3)  
  AmpSum2AhTocFuFu = + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3) + AmpSqTreeAhTocFuFu(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3)  
  AmpSum2AhTocFuFu = + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3) + AmpSqTreeAhTocFuFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFuFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFuFu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqAhTocFuFu(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MFu(gt2),MFu(gt3),helfactor*AmpSqAhTocFuFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFuFu(gt1, gt2, gt3) + MRGAhTocFuFu(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFuFu(gt1, gt2, gt3) + MRGAhTocFuFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! hh VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhTohhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,MVZ2,             & 
& AmpTreeAhTohhVZ)

  Else 
Call Amplitude_Tree_MSSMLV_AhTohhVZ(ZcplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,MVZ2,            & 
& AmpTreeAhTohhVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAhOS,MhhOS,MVZOS,            & 
& MRPAhTohhVZ,MRGAhTohhVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhTohhVZ(MLambda,em,gs,ZcplAhhhVZ,MAhOS,MhhOS,MVZOS,           & 
& MRPAhTohhVZ,MRGAhTohhVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,MVZ,MRPAhTohhVZ,      & 
& MRGAhTohhVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhTohhVZ(MLambda,em,gs,ZcplAhhhVZ,MAh,Mhh,MVZ,MRPAhTohhVZ,     & 
& MRGAhTohhVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTohhVZ(cplAhhhVZ,ctcplAhhhVZ,MAh,MAh2,Mhh,               & 
& Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,AmpWaveAhTohhVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTohhVZ(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,MSd,             & 
& MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,              & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,     & 
& cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexAhTohhVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhVZ(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,              & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,     & 
& cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRdrAhTohhVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,            & 
& Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,ZcplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,   & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,             & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,          & 
& AmpVertexIRosAhTohhVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhVZ(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,ZcplAhhhVZ,            & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,              & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,     & 
& cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,            & 
& Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,            & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,       & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,   & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,             & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,          & 
& AmpVertexIRosAhTohhVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTohhVZ(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,             & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,              & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,              & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,     & 
& cplhhhhVZVZ1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

 End if 
 End if 
AmpVertexAhTohhVZ = AmpVertexAhTohhVZ -  AmpVertexIRdrAhTohhVZ! +  AmpVertexIRosAhTohhVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhVZ=0._dp 
AmpVertexZAhTohhVZ=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTohhVZ(:,gt2,:) = AmpWaveZAhTohhVZ(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhVZ(:,gt1,:) 
AmpVertexZAhTohhVZ(:,gt2,:)= AmpVertexZAhTohhVZ(:,gt2,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhVZ=AmpWaveZAhTohhVZ 
AmpVertexAhTohhVZ= AmpVertexZAhTohhVZ
! Final State 1 
AmpWaveZAhTohhVZ=0._dp 
AmpVertexZAhTohhVZ=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTohhVZ(:,:,gt2) = AmpWaveZAhTohhVZ(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhVZ(:,:,gt1) 
AmpVertexZAhTohhVZ(:,:,gt2)= AmpVertexZAhTohhVZ(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhVZ=AmpWaveZAhTohhVZ 
AmpVertexAhTohhVZ= AmpVertexZAhTohhVZ
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhVZ = AmpVertexAhTohhVZ  +  AmpVertexIRosAhTohhVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ 
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ  
Else 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ + AmpWaveAhTohhVZ + AmpVertexAhTohhVZ
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + AmpWaveAhTohhVZ + AmpVertexAhTohhVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
If (((OSkinematics).and.(MAhOS(gt1).gt.(MhhOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(Mhh(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = 2._dp*AmpWaveAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = 2._dp*AmpVertexAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqTreeAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2)  
  AmpSum2AhTohhVZ = + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2) + AmpSqTreeAhTohhVZ(gt1, gt2)  
Else  
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqTreeAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2)  
  AmpSum2AhTohhVZ = + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2) + AmpSqTreeAhTohhVZ(gt1, gt2)  
End if  
Else  
  AmpSqAhTohhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVZ(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MVZOS,helfactor*AmpSqAhTohhVZ(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),Mhh(gt2),MVZ,helfactor*AmpSqAhTohhVZ(gt1, gt2))
End if 
If ((Abs(MRPAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/2._dp*helfactor*(MRPAhTohhVZ(gt1, gt2) + MRGAhTohhVZ(gt1, gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/2._dp*helfactor*(MRPAhTohhVZ(gt1, gt2) + MRGAhTohhVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! Conjg(Hpm) Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhTocHpmHpm(cplAhHpmcHpm,MAh,MHpm,MAh2,MHpm2,              & 
& AmpTreeAhTocHpmHpm)

  Else 
Call Amplitude_Tree_MSSMLV_AhTocHpmHpm(ZcplAhHpmcHpm,MAh,MHpm,MAh2,MHpm2,             & 
& AmpTreeAhTocHpmHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhTocHpmHpm(MLambda,em,gs,cplAhHpmcHpm,MAhOS,MHpmOS,           & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhTocHpmHpm(MLambda,em,gs,ZcplAhHpmcHpm,MAhOS,MHpmOS,          & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhTocHpmHpm(MLambda,em,gs,cplAhHpmcHpm,MAh,MHpm,               & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhTocHpmHpm(MLambda,em,gs,ZcplAhHpmcHpm,MAh,MHpm,              & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTocHpmHpm(cplAhHpmcHpm,ctcplAhHpmcHpm,MAh,               & 
& MAh2,MHpm,MHpm2,ZfAh,ZfHpm,AmpWaveAhTocHpmHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL, & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,      & 
& cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhSdcHpmcSuaa,      & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,& 
& AmpVertexAhTocHpmHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL, & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,      & 
& cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhSdcHpmcSuaa,      & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,& 
& AmpVertexIRdrAhTocHpmHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,ZcplAhHpmcHpm,cplAhHpmcVWm,          & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcgZgWmcHpm,    & 
& cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,      & 
& cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,          & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,             & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhSdcHpmcSuaa,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,      & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,AmpVertexIRosAhTocHpmHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,ZcplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,               & 
& cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,             & 
& cplcFuFdcHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,      & 
& cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmcHpmVP,        & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplcHpmVPVWm,cplcHpmVWmVZ,         & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,       & 
& cplAhSdcHpmcSuaa,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa, & 
& cplHpmSucHpmcSuaa,AmpVertexIRosAhTocHpmHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcgZgWmcHpm,    & 
& cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,      & 
& cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,          & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,             & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhSdcHpmcSuaa,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,      & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,AmpVertexIRosAhTocHpmHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL, & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcgZgWmcHpm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcHpmcSu,cplcHpmVPVWm,cplcHpmVWmVZ,cplAhAhHpmcHpm1,      & 
& cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhSdcHpmcSuaa,      & 
& cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,& 
& AmpVertexIRosAhTocHpmHpm)

 End if 
 End if 
AmpVertexAhTocHpmHpm = AmpVertexAhTocHpmHpm -  AmpVertexIRdrAhTocHpmHpm! +  AmpVertexIRosAhTocHpmHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTocHpmHpm(gt2,:,:) = AmpWaveZAhTocHpmHpm(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocHpmHpm(gt1,:,:) 
AmpVertexZAhTocHpmHpm(gt2,:,:)= AmpVertexZAhTocHpmHpm(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocHpmHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
! Final State 1 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,8
  Do gt2=1,8
AmpWaveZAhTocHpmHpm(:,gt2,:) = AmpWaveZAhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveAhTocHpmHpm(:,gt1,:) 
AmpVertexZAhTocHpmHpm(:,gt2,:)= AmpVertexZAhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexAhTocHpmHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
! Final State 2 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,8
  Do gt2=1,8
AmpWaveZAhTocHpmHpm(:,:,gt2) = AmpWaveZAhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveAhTocHpmHpm(:,:,gt1) 
AmpVertexZAhTocHpmHpm(:,:,gt2)= AmpVertexZAhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexAhTocHpmHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocHpmHpm = AmpVertexAhTocHpmHpm  +  AmpVertexIRosAhTocHpmHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Hpm] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm 
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm  
Else 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm + AmpWaveAhTocHpmHpm + AmpVertexAhTocHpmHpm
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + AmpWaveAhTocHpmHpm + AmpVertexAhTocHpmHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=2,8
    Do gt3=2,8
If (((OSkinematics).and.(MAhOS(gt1).gt.(MHpmOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MHpm(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = 2._dp*AmpWaveAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = 2._dp*AmpVertexAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2AhTocHpmHpm = + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2AhTocHpmHpm = + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocHpmHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),helfactor*AmpSqAhTocHpmHpm(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MHpm(gt2),MHpm(gt3),helfactor*AmpSqAhTocHpmHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocHpmHpm(gt1, gt2, gt3) + MRGAhTocHpmHpm(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocHpmHpm(gt1, gt2, gt3) + MRGAhTocHpmHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! Hpm Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhToHpmcVWm(cplAhHpmcVWm,MAh,MHpm,MVWm,MAh2,               & 
& MHpm2,MVWm2,AmpTreeAhToHpmcVWm)

  Else 
Call Amplitude_Tree_MSSMLV_AhToHpmcVWm(ZcplAhHpmcVWm,MAh,MHpm,MVWm,MAh2,              & 
& MHpm2,MVWm2,AmpTreeAhToHpmcVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhToHpmcVWm(MLambda,em,gs,cplAhHpmcVWm,MAhOS,MHpmOS,           & 
& MVWmOS,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhToHpmcVWm(MLambda,em,gs,ZcplAhHpmcVWm,MAhOS,MHpmOS,          & 
& MVWmOS,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhToHpmcVWm(MLambda,em,gs,cplAhHpmcVWm,MAh,MHpm,               & 
& MVWm,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhToHpmcVWm(MLambda,em,gs,ZcplAhHpmcVWm,MAh,MHpm,              & 
& MVWm,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhToHpmcVWm(cplAhHpmcVWm,ctcplAhHpmcVWm,MAh,               & 
& MAh2,MHpm,MHpm2,MVWm,MVWm2,ZfAh,ZfHpm,ZfVWm,AmpWaveAhToHpmcVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacVWmL, & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHpm,      & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,cplcVWmVPVWm,         & 
& cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplhhHpmcVWmVZ1,          & 
& cplHpmcHpmcVWmVWm1,AmpVertexAhToHpmcVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacVWmL, & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHpm,      & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,cplcVWmVPVWm,         & 
& cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplhhHpmcVWmVZ1,          & 
& cplHpmcHpmcVWmVWm1,AmpVertexIRdrAhToHpmcVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,GosZcplAhHpmcHpm,ZcplAhHpmcVWm,      & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcgWmgAHpm,     & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,cplHpmcHpmVP,GosZcplHpmcVWmVP,cplHpmcHpmVZ,      & 
& cplHpmcVWmVZ,cplSdcSucVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,   & 
& cplAhHpmcVWmVZ1,cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,GZcplAhHpmcHpm,ZcplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,             & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,      & 
& cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,      & 
& cplHpmSucSd,cplHpmcHpmVP,GZcplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,        & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,             & 
& cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,GcplAhHpmcHpm,cplAhHpmcVWm,          & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcgWmgAHpm,     & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,cplHpmcHpmVP,GcplHpmcVWmVP,cplHpmcHpmVZ,         & 
& cplHpmcVWmVZ,cplSdcSucVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,   & 
& cplAhHpmcVWmVZ1,cplhhHpmcVWmVZ1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,           & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacVWmL, & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZgWpCHpm,      & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmSucSd,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSucVWm,cplcVWmVPVWm,         & 
& cplcVWmVWmVZ,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplhhHpmcVWmVZ1,          & 
& cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

 End if 
 End if 
AmpVertexAhToHpmcVWm = AmpVertexAhToHpmcVWm -  AmpVertexIRdrAhToHpmcVWm! +  AmpVertexIRosAhToHpmcVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToHpmcVWm=0._dp 
AmpVertexZAhToHpmcVWm=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhToHpmcVWm(:,gt2,:) = AmpWaveZAhToHpmcVWm(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhToHpmcVWm(:,gt1,:) 
AmpVertexZAhToHpmcVWm(:,gt2,:)= AmpVertexZAhToHpmcVWm(:,gt2,:) + ZRUZA(gt2,gt1)*AmpVertexAhToHpmcVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToHpmcVWm=AmpWaveZAhToHpmcVWm 
AmpVertexAhToHpmcVWm= AmpVertexZAhToHpmcVWm
! Final State 1 
AmpWaveZAhToHpmcVWm=0._dp 
AmpVertexZAhToHpmcVWm=0._dp 
Do gt1=1,8
  Do gt2=1,8
AmpWaveZAhToHpmcVWm(:,:,gt2) = AmpWaveZAhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveAhToHpmcVWm(:,:,gt1) 
AmpVertexZAhToHpmcVWm(:,:,gt2)= AmpVertexZAhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexAhToHpmcVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToHpmcVWm=AmpWaveZAhToHpmcVWm 
AmpVertexAhToHpmcVWm= AmpVertexZAhToHpmcVWm
End if
If (ShiftIRdiv) Then 
AmpVertexAhToHpmcVWm = AmpVertexAhToHpmcVWm  +  AmpVertexIRosAhToHpmcVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Hpm conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm 
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm  
Else 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm + AmpWaveAhToHpmcVWm + AmpVertexAhToHpmcVWm
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + AmpWaveAhToHpmcVWm + AmpVertexAhToHpmcVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=2,8
If (((OSkinematics).and.(MAhOS(gt1).gt.(MHpmOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MHpm(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = 2._dp*AmpWaveAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = 2._dp*AmpVertexAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToHpmcVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqTreeAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2)  
  AmpSum2AhToHpmcVWm = + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2) + AmpSqTreeAhToHpmcVWm(gt1, gt2)  
Else  
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqTreeAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2)  
  AmpSum2AhToHpmcVWm = + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2) + AmpSqTreeAhToHpmcVWm(gt1, gt2)  
End if  
Else  
  AmpSqAhToHpmcVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToHpmcVWm(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),MHpmOS(gt2),MVWmOS,helfactor*AmpSqAhToHpmcVWm(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MHpm(gt2),MVWm,helfactor*AmpSqAhToHpmcVWm(gt1, gt2))
End if 
If ((Abs(MRPAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPAhToHpmcVWm(gt1, gt2) + MRGAhToHpmcVWm(gt1, gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPAhToHpmcVWm(gt1, gt2) + MRGAhToHpmcVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! Conjg(Sd) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhTocSdSd(cplAhSdcSd,MAh,MSd,MAh2,MSd2,AmpTreeAhTocSdSd)

  Else 
Call Amplitude_Tree_MSSMLV_AhTocSdSd(ZcplAhSdcSd,MAh,MSd,MAh2,MSd2,AmpTreeAhTocSdSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhTocSdSd(MLambda,em,gs,cplAhSdcSd,MAhOS,MSdOS,MRPAhTocSdSd,   & 
& MRGAhTocSdSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhTocSdSd(MLambda,em,gs,ZcplAhSdcSd,MAhOS,MSdOS,               & 
& MRPAhTocSdSd,MRGAhTocSdSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhTocSdSd(MLambda,em,gs,cplAhSdcSd,MAh,MSd,MRPAhTocSdSd,       & 
& MRGAhTocSdSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhTocSdSd(MLambda,em,gs,ZcplAhSdcSd,MAh,MSd,MRPAhTocSdSd,      & 
& MRGAhTocSdSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTocSdSd(cplAhSdcSd,ctcplAhSdcSd,MAh,MAh2,MSd,            & 
& MSd2,ZfAh,ZfSd,AmpWaveAhTocSdSd)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,           & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,             & 
& MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,          & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,             & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSucSdcSuabba,cplSdSucSdcSuabab,AmpVertexAhTocSdSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,             & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSucSdcSuabba,cplSdSucSdcSuabab,AmpVertexIRdrAhTocSdSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& ZcplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,            & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,    & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,     & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,AmpVertexIRosAhTocSdSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,ZcplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,            & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSucSdcSuabba,cplSdSucSdcSuabab,AmpVertexIRosAhTocSdSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,             & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,         & 
& cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplcChacFuSdL,    & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,     & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,AmpVertexIRosAhTocSdSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,             & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSucSdcSuabba,cplSdSucSdcSuabab,AmpVertexIRosAhTocSdSd)

 End if 
 End if 
AmpVertexAhTocSdSd = AmpVertexAhTocSdSd -  AmpVertexIRdrAhTocSdSd! +  AmpVertexIRosAhTocSdSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTocSdSd(gt2,:,:) = AmpWaveZAhTocSdSd(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSdSd(gt1,:,:) 
AmpVertexZAhTocSdSd(gt2,:,:)= AmpVertexZAhTocSdSd(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSdSd(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
! Final State 1 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSdSd(:,gt2,:) = AmpWaveZAhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWaveAhTocSdSd(:,gt1,:) 
AmpVertexZAhTocSdSd(:,gt2,:)= AmpVertexZAhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpVertexAhTocSdSd(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
! Final State 2 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSdSd(:,:,gt2) = AmpWaveZAhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveAhTocSdSd(:,:,gt1) 
AmpVertexZAhTocSdSd(:,:,gt2)= AmpVertexZAhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexAhTocSdSd(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSdSd = AmpVertexAhTocSdSd  +  AmpVertexIRosAhTocSdSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Sd] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd 
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd  
Else 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd + AmpWaveAhTocSdSd + AmpVertexAhTocSdSd
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + AmpWaveAhTocSdSd + AmpVertexAhTocSdSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MAhOS(gt1).gt.(MSdOS(gt2)+MSdOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MSd(gt2)+MSd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = 2._dp*AmpWaveAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = 2._dp*AmpVertexAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3)  
  AmpSum2AhTocSdSd = + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3) + AmpSqTreeAhTocSdSd(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3)  
  AmpSum2AhTocSdSd = + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3) + AmpSqTreeAhTocSdSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSdSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSdSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),helfactor*AmpSqAhTocSdSd(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MSd(gt2),MSd(gt3),helfactor*AmpSqAhTocSdSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSdSd(gt1, gt2, gt3) + MRGAhTocSdSd(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSdSd(gt1, gt2, gt3) + MRGAhTocSdSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! Conjg(Su) Su
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMLV_AhTocSuSu(cplAhSucSu,MAh,MSu,MAh2,MSu2,AmpTreeAhTocSuSu)

  Else 
Call Amplitude_Tree_MSSMLV_AhTocSuSu(ZcplAhSucSu,MAh,MSu,MAh2,MSu2,AmpTreeAhTocSuSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMLV_AhTocSuSu(MLambda,em,gs,cplAhSucSu,MAhOS,MSuOS,MRPAhTocSuSu,   & 
& MRGAhTocSuSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMLV_AhTocSuSu(MLambda,em,gs,ZcplAhSucSu,MAhOS,MSuOS,               & 
& MRPAhTocSuSu,MRGAhTocSuSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMLV_AhTocSuSu(MLambda,em,gs,cplAhSucSu,MAh,MSu,MRPAhTocSuSu,       & 
& MRGAhTocSuSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMLV_AhTocSuSu(MLambda,em,gs,ZcplAhSucSu,MAh,MSu,MRPAhTocSuSu,      & 
& MRGAhTocSuSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTocSuSu(cplAhSucSu,ctcplAhSucSu,MAh,MAh2,MSu,            & 
& MSu2,ZfAh,ZfSu,AmpWaveAhTocSuSu)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,MHpm,           & 
& MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,             & 
& MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,          & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,             & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,            & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSuSucSucSuabba,cplSuSucSucSuabab,AmpVertexAhTocSuSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,             & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,            & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSuSucSucSuabba,cplSuSucSucSuabab,AmpVertexIRdrAhTocSuSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,ZcplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,            & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,       & 
& cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa,              & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSuSucSucSuabba,cplSuSucSucSuabab,AmpVertexIRosAhTocSuSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,ZcplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,            & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,            & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSuSucSucSuabba,cplSuSucSucSuabab,AmpVertexIRosAhTocSuSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,            & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,             & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,       & 
& cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa,              & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSuSucSucSuabba,cplSuSucSucSuabab,AmpVertexIRosAhTocSuSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMLV_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,     & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,             & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,            & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplAhAhSucSuaa, & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSuSucSucSuabba,cplSuSucSucSuabab,AmpVertexIRosAhTocSuSu)

 End if 
 End if 
AmpVertexAhTocSuSu = AmpVertexAhTocSuSu -  AmpVertexIRdrAhTocSuSu! +  AmpVertexIRosAhTocSuSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,5
  Do gt2=1,5
AmpWaveZAhTocSuSu(gt2,:,:) = AmpWaveZAhTocSuSu(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSuSu(gt1,:,:) 
AmpVertexZAhTocSuSu(gt2,:,:)= AmpVertexZAhTocSuSu(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSuSu(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
! Final State 1 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSuSu(:,gt2,:) = AmpWaveZAhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpWaveAhTocSuSu(:,gt1,:) 
AmpVertexZAhTocSuSu(:,gt2,:)= AmpVertexZAhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpVertexAhTocSuSu(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
! Final State 2 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSuSu(:,:,gt2) = AmpWaveZAhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpWaveAhTocSuSu(:,:,gt1) 
AmpVertexZAhTocSuSu(:,:,gt2)= AmpVertexZAhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpVertexAhTocSuSu(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSuSu = AmpVertexAhTocSuSu  +  AmpVertexIRosAhTocSuSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Su] Su -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu 
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu  
Else 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu + AmpWaveAhTocSuSu + AmpVertexAhTocSuSu
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + AmpWaveAhTocSuSu + AmpVertexAhTocSuSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu 
End if 
Do gt1=1,5
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(MAhOS(gt1).gt.(MSuOS(gt2)+MSuOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MSu(gt2)+MSu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = 2._dp*AmpWaveAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = 2._dp*AmpVertexAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3)  
  AmpSum2AhTocSuSu = + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3) + AmpSqTreeAhTocSuSu(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3)  
  AmpSum2AhTocSuSu = + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3) + AmpSqTreeAhTocSuSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSuSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSuSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),helfactor*AmpSqAhTocSuSu(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MSu(gt2),MSu(gt3),helfactor*AmpSqAhTocSuSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSuSu(gt1, gt2, gt3) + MRGAhTocSuSu(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSuSu(gt1, gt2, gt3) + MRGAhTocSuSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! Ah Ah
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MHpmOS,         & 
& MSdOS,MSuOS,MVWmOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,MSu2OS,         & 
& MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,             & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,        & 
& cplAhAhSucSuaa,AmpVertexAhToAhAh)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MHpmOS,         & 
& MSdOS,MSuOS,MVWmOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,MSu2OS,         & 
& MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,             & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,        & 
& cplAhAhSucSuaa,AmpVertexAhToAhAh)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToAhAh(MAh,MCha,MChi,MFd,MFu,MHpm,MSd,MSu,             & 
& MVWm,MAh2,MCha2,MChi2,MFd2,MFu2,MHpm2,MSd2,MSu2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,           & 
& cplAhcHpmVWm,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSucSuaa,AmpVertexAhToAhAh)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah Ah -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhAh = 0._dp 
 AmpSum2AhToAhAh = 0._dp  
Else 
 AmpSumAhToAhAh = AmpVertexAhToAhAh + AmpWaveAhToAhAh
 AmpSum2AhToAhAh = AmpVertexAhToAhAh + AmpWaveAhToAhAh 
End If 
Do gt1=1,5
i4 = isave 
  Do gt2=2,5
    Do gt3=gt2,5
If (((OSkinematics).and.(MAhOS(gt1).gt.(MAhOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MAh(gt2)+MAh(gt3))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MAh(gt2),MAh(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
End if  
Else  
  AmpSqAhToAhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToAhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),helfactor*AmpSqAhToAhAh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MAh(gt2),MAh(gt3),helfactor*AmpSqAhToAhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
!---------------- 
! Ah VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToAhVP(MAhOS,MChaOS,MFdOS,MFuOS,MHpmOS,MSdOS,          & 
& MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,              & 
& MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,          & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,         & 
& cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& AmpVertexAhToAhVP)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToAhVP(MAhOS,MChaOS,MFdOS,MFuOS,MHpmOS,MSdOS,          & 
& MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,              & 
& MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,          & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,         & 
& cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& AmpVertexAhToAhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToAhVP(MAh,MCha,MFd,MFu,MHpm,MSd,MSu,MVP,              & 
& MVWm,MAh2,MCha2,MFd2,MFu2,MHpm2,MSd2,MSu2,MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,            & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,            & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,           & 
& cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,AmpVertexAhToAhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVP = 0._dp 
 AmpSum2AhToAhVP = 0._dp  
Else 
 AmpSumAhToAhVP = AmpVertexAhToAhVP + AmpWaveAhToAhVP
 AmpSum2AhToAhVP = AmpVertexAhToAhVP + AmpWaveAhToAhVP 
End If 
Do gt1=1,5
i4 = isave 
  Do gt2=2,5
If (((OSkinematics).and.(MAhOS(gt1).gt.(MAhOS(gt2)+0.))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MAh(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MAhOS(gt2),0._dp,AmpSumAhToAhVP(:,gt1, gt2),AmpSum2AhToAhVP(:,gt1, gt2),AmpSqAhToAhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MAh(gt2),MVP,AmpSumAhToAhVP(:,gt1, gt2),AmpSum2AhToAhVP(:,gt1, gt2),AmpSqAhToAhVP(gt1, gt2)) 
End if  
Else  
  AmpSqAhToAhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVP(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),0._dp,helfactor*AmpSqAhToAhVP(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MAh(gt2),MVP,helfactor*AmpSqAhToAhVP(gt1, gt2))
End if 
If ((Abs(MRPAhToAhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
!---------------- 
! Ah VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MHpmOS,         & 
& MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,          & 
& MSu2OS,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVZL,            & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,          & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,AmpVertexAhToAhVZ)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MHpmOS,         & 
& MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,          & 
& MSu2OS,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVZL,            & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,          & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,AmpVertexAhToAhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToAhVZ(MAh,MCha,MChi,MFd,MFu,MHpm,MSd,MSu,             & 
& MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,          & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,         & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,           & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,             & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,AmpVertexAhToAhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVZ = 0._dp 
 AmpSum2AhToAhVZ = 0._dp  
Else 
 AmpSumAhToAhVZ = AmpVertexAhToAhVZ + AmpWaveAhToAhVZ
 AmpSum2AhToAhVZ = AmpVertexAhToAhVZ + AmpWaveAhToAhVZ 
End If 
Do gt1=1,5
i4 = isave 
  Do gt2=2,5
If (((OSkinematics).and.(MAhOS(gt1).gt.(MAhOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MAh(gt2)+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MAhOS(gt2),MVZOS,AmpSumAhToAhVZ(:,gt1, gt2),AmpSum2AhToAhVZ(:,gt1, gt2),AmpSqAhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MAh(gt2),MVZ,AmpSumAhToAhVZ(:,gt1, gt2),AmpSum2AhToAhVZ(:,gt1, gt2),AmpSqAhToAhVZ(gt1, gt2)) 
End if  
Else  
  AmpSqAhToAhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVZ(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),MVZOS,helfactor*AmpSqAhToAhVZ(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MAh(gt2),MVZ,helfactor*AmpSqAhToAhVZ(gt1, gt2))
End if 
If ((Abs(MRPAhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
!---------------- 
! Glu Glu
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToGluGlu(MAhOS,MFdOS,MFuOS,MGluOS,MSdOS,               & 
& MSuOS,MAh2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& AmpVertexAhToGluGlu)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToGluGlu(MAhOS,MFdOS,MFuOS,MGluOS,MSdOS,               & 
& MSuOS,MAh2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& AmpVertexAhToGluGlu)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToGluGlu(MAh,MFd,MFu,MGlu,MSd,MSu,MAh2,MFd2,           & 
& MFu2,MGlu2,MSd2,MSu2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,       & 
& cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,           & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,AmpVertexAhToGluGlu)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Glu Glu -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToGluGlu = 0._dp 
 AmpSum2AhToGluGlu = 0._dp  
Else 
 AmpSumAhToGluGlu = AmpVertexAhToGluGlu + AmpWaveAhToGluGlu
 AmpSum2AhToGluGlu = AmpVertexAhToGluGlu + AmpWaveAhToGluGlu 
End If 
Do gt1=1,5
i4 = isave 
If (((OSkinematics).and.(MAhOS(gt1).gt.(MGluOS+MGluOS))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MGlu+MGlu)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MGluOS,MGluOS,AmpSumAhToGluGlu(:,gt1),AmpSum2AhToGluGlu(:,gt1),AmpSqAhToGluGlu(gt1)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MGlu,MGlu,AmpSumAhToGluGlu(:,gt1),AmpSum2AhToGluGlu(:,gt1),AmpSqAhToGluGlu(gt1)) 
End if  
Else  
  AmpSqAhToGluGlu(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhToGluGlu(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 4._dp*GammaTPS(MAhOS(gt1),MGluOS,MGluOS,helfactor*AmpSqAhToGluGlu(gt1))
Else 
  gP1LAh(gt1,i4) = 4._dp*GammaTPS(MAh(gt1),MGlu,MGlu,helfactor*AmpSqAhToGluGlu(gt1))
End if 
If ((Abs(MRPAhToGluGlu(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToGluGlu(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.5) isave = i4 
End do
!---------------- 
! hh hh
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MhhOS,          & 
& MHpmOS,MSdOS,MSuOS,MVWmOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,Mhh2OS,MHpm2OS,         & 
& MSd2OS,MSu2OS,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplhhhhHpmcHpm1,   & 
& cplhhhhSdcSdaa,cplhhhhSucSuaa,AmpVertexAhTohhhh)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MhhOS,          & 
& MHpmOS,MSdOS,MSuOS,MVWmOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,Mhh2OS,MHpm2OS,         & 
& MSd2OS,MSu2OS,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,            & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplhhhhHpmcHpm1,   & 
& cplhhhhSdcSdaa,cplhhhhSucSuaa,AmpVertexAhTohhhh)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTohhhh(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,MSd,             & 
& MSu,MVWm,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVWm2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,          & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSucSuaa,          & 
& AmpVertexAhTohhhh)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh hh -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhhh = 0._dp 
 AmpSum2AhTohhhh = 0._dp  
Else 
 AmpSumAhTohhhh = AmpVertexAhTohhhh + AmpWaveAhTohhhh
 AmpSum2AhTohhhh = AmpVertexAhTohhhh + AmpWaveAhTohhhh 
End If 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
    Do gt3=gt2,5
If (((OSkinematics).and.(MAhOS(gt1).gt.(MhhOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(Mhh(gt2)+Mhh(gt3))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
End if  
Else  
  AmpSqAhTohhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhTohhhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqAhTohhhh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),Mhh(gt2),Mhh(gt3),helfactor*AmpSqAhTohhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.5) isave = i4 
End do
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_MSSMLV_AhTohhVP(cplAhhhVZ,ctcplAhhhVZ,MAhOS,MAh2OS,               & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWaveAhTohhVP)

 Else 
Call Amplitude_WAVE_MSSMLV_AhTohhVP(cplAhhhVZ,ctcplAhhhVZ,MAhOS,MAh2OS,               & 
& MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWaveAhTohhVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhTohhVP(MAhOS,MChaOS,MFdOS,MFuOS,MhhOS,MHpmOS,          & 
& MSdOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,         & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,             & 
& cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,          & 
& AmpVertexAhTohhVP)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhTohhVP(MAhOS,MChaOS,MFdOS,MFuOS,MhhOS,MHpmOS,          & 
& MSdOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,             & 
& MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,         & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,             & 
& cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,          & 
& AmpVertexAhTohhVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMLV_AhTohhVP(cplAhhhVZ,ctcplAhhhVZ,MAh,MAh2,Mhh,               & 
& Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZVP,AmpWaveAhTohhVP)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhTohhVP(MAh,MCha,MFd,MFu,Mhh,MHpm,MSd,MSu,              & 
& MVP,MVWm,MAh2,MCha2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,MVWm2,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,            & 
& cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,           & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,             & 
& cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexAhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVP = 0._dp 
 AmpSum2AhTohhVP = 0._dp  
Else 
 AmpSumAhTohhVP = AmpVertexAhTohhVP + AmpWaveAhTohhVP
 AmpSum2AhTohhVP = AmpVertexAhTohhVP + AmpWaveAhTohhVP 
End If 
Do gt1=1,5
i4 = isave 
  Do gt2=1,5
If (((OSkinematics).and.(MAhOS(gt1).gt.(MhhOS(gt2)+0.))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(Mhh(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),0._dp,AmpSumAhTohhVP(:,gt1, gt2),AmpSum2AhTohhVP(:,gt1, gt2),AmpSqAhTohhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVP,AmpSumAhTohhVP(:,gt1, gt2),AmpSum2AhTohhVP(:,gt1, gt2),AmpSqAhTohhVP(gt1, gt2)) 
End if  
Else  
  AmpSqAhTohhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVP(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),0._dp,helfactor*AmpSqAhTohhVP(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),Mhh(gt2),MVP,helfactor*AmpSqAhTohhVP(gt1, gt2))
End if 
If ((Abs(MRPAhTohhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.5) isave = i4 
End do
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToVGVG(MAhOS,MFdOS,MFuOS,MSdOS,MSuOS,MVG,              & 
& MAh2OS,MFd2OS,MFu2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToVGVG(MAhOS,MFdOS,MFuOS,MSdOS,MSuOS,MVG,              & 
& MAh2OS,MFd2OS,MFu2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToVGVG(MAh,MFd,MFu,MSd,MSu,MVG,MAh2,MFd2,              & 
& MFu2,MSd2,MSu2,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,        & 
& cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplSdcSdVG,cplSucSuVG,      & 
& cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVGVG = 0._dp 
 AmpSum2AhToVGVG = 0._dp  
Else 
 AmpSumAhToVGVG = AmpVertexAhToVGVG + AmpWaveAhToVGVG
 AmpSum2AhToVGVG = AmpVertexAhToVGVG + AmpWaveAhToVGVG 
End If 
Do gt1=1,5
i4 = isave 
If (((OSkinematics).and.(MAhOS(gt1).gt.(0.+0.))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MVG+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,0._dp,AmpSumAhToVGVG(:,gt1),AmpSum2AhToVGVG(:,gt1),AmpSqAhToVGVG(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVG,MVG,AmpSumAhToVGVG(:,gt1),AmpSum2AhToVGVG(:,gt1),AmpSqAhToVGVG(gt1)) 
End if  
Else  
  AmpSqAhToVGVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVGVG(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 8._dp*GammaTPS(MAhOS(gt1),0._dp,0._dp,helfactor*AmpSqAhToVGVG(gt1))
Else 
  gP1LAh(gt1,i4) = 8._dp*GammaTPS(MAh(gt1),MVG,MVG,helfactor*AmpSqAhToVGVG(gt1))
End if 
If ((Abs(MRPAhToVGVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVGVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.5) isave = i4 
End do
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToVPVP(MAhOS,MChaOS,MFdOS,MFuOS,MHpmOS,MSdOS,          & 
& MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,              & 
& MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,          & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,         & 
& cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSucSuVPVPaa,AmpVertexAhToVPVP)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToVPVP(MAhOS,MChaOS,MFdOS,MFuOS,MHpmOS,MSdOS,          & 
& MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,              & 
& MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,          & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,         & 
& cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,       & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSucSuVPVPaa,AmpVertexAhToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToVPVP(MAh,MCha,MFd,MFu,MHpm,MSd,MSu,MVP,              & 
& MVWm,MAh2,MCha2,MFd2,MFu2,MHpm2,MSd2,MSu2,MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,            & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,            & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSucSuVP,cplcHpmVPVWm,           & 
& cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,           & 
& cplSucSuVPVPaa,AmpVertexAhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVP = 0._dp 
 AmpSum2AhToVPVP = 0._dp  
Else 
 AmpSumAhToVPVP = AmpVertexAhToVPVP + AmpWaveAhToVPVP
 AmpSum2AhToVPVP = AmpVertexAhToVPVP + AmpWaveAhToVPVP 
End If 
Do gt1=1,5
i4 = isave 
If (((OSkinematics).and.(MAhOS(gt1).gt.(0.+0.))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MVP+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,0._dp,AmpSumAhToVPVP(:,gt1),AmpSum2AhToVPVP(:,gt1),AmpSqAhToVPVP(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVP,MVP,AmpSumAhToVPVP(:,gt1),AmpSum2AhToVPVP(:,gt1),AmpSqAhToVPVP(gt1)) 
End if  
Else  
  AmpSqAhToVPVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVP(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),0._dp,0._dp,helfactor*AmpSqAhToVPVP(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVP,MVP,helfactor*AmpSqAhToVPVP(gt1))
End if 
If ((Abs(MRPAhToVPVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.5) isave = i4 
End do
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToVPVZ(MAhOS,MChaOS,MFdOS,MFuOS,MHpmOS,MSdOS,          & 
& MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,MSu2OS,             & 
& MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,         & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,          & 
& cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,         & 
& cplSdcSdVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,          & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSucSuVPVZaa,AmpVertexAhToVPVZ)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToVPVZ(MAhOS,MChaOS,MFdOS,MFuOS,MHpmOS,MSdOS,          & 
& MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,MSu2OS,             & 
& MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,         & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,          & 
& cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,         & 
& cplSdcSdVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,          & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSucSuVPVZaa,AmpVertexAhToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToVPVZ(MAh,MCha,MFd,MFu,MHpm,MSd,MSu,MVP,              & 
& MVWm,MVZ,MAh2,MCha2,MFd2,MFu2,MHpm2,MSd2,MSu2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,            & 
& cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,     & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,    & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,& 
& cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSucSuVPVZaa,AmpVertexAhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVZ = 0._dp 
 AmpSum2AhToVPVZ = 0._dp  
Else 
 AmpSumAhToVPVZ = AmpVertexAhToVPVZ + AmpWaveAhToVPVZ
 AmpSum2AhToVPVZ = AmpVertexAhToVPVZ + AmpWaveAhToVPVZ 
End If 
Do gt1=1,5
i4 = isave 
If (((OSkinematics).and.(MAhOS(gt1).gt.(0.+MVZOS))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MVP+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,MVZOS,AmpSumAhToVPVZ(:,gt1),AmpSum2AhToVPVZ(:,gt1),AmpSqAhToVPVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVP,MVZ,AmpSumAhToVPVZ(:,gt1),AmpSum2AhToVPVZ(:,gt1),AmpSqAhToVPVZ(gt1)) 
End if  
Else  
  AmpSqAhToVPVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVZ(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),0._dp,MVZOS,helfactor*AmpSqAhToVPVZ(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVP,MVZ,helfactor*AmpSqAhToVPVZ(gt1))
End if 
If ((Abs(MRPAhToVPVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.5) isave = i4 
End do
!---------------- 
! VWm Conjg(VWm)
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToVWmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiVWmL,       & 
& cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcgWmgAVWm,     & 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,   & 
& cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSucVWm,cplSucSdVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,          & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,    & 
& cplSdcSdcVWmVWmaa,cplSucSucVWmVWmaa,AmpVertexAhToVWmcVWm)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToVWmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,             & 
& MhhOS,MHpmOS,MSdOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,               & 
& MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,cplcChaChiVWmL,       & 
& cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcgWmgAVWm,     & 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,   & 
& cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,       & 
& cplSdcSucVWm,cplSucSdVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,          & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,    & 
& cplSdcSdcVWmVWmaa,cplSucSucVWmVWmaa,AmpVertexAhToVWmcVWm)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToVWmcVWm(MAh,MCha,MChi,MFd,MFu,Mhh,MHpm,              & 
& MSd,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,Mhh2,MHpm2,MSd2,MSu2,MVP2,             & 
& MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacVWmL, & 
& cplChiChacVWmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,     & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcHpmVWm,     & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,cplSucSdVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,& 
& cplAhcHpmVWmVZ1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSucSucVWmVWmaa,AmpVertexAhToVWmcVWm)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VWm conj[VWm] -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVWmcVWm = 0._dp 
 AmpSum2AhToVWmcVWm = 0._dp  
Else 
 AmpSumAhToVWmcVWm = AmpVertexAhToVWmcVWm + AmpWaveAhToVWmcVWm
 AmpSum2AhToVWmcVWm = AmpVertexAhToVWmcVWm + AmpWaveAhToVWmcVWm 
End If 
Do gt1=1,5
i4 = isave 
If (((OSkinematics).and.(MAhOS(gt1).gt.(MVWmOS+MVWmOS))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MVWm+MVWm)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVWmOS,MVWmOS,AmpSumAhToVWmcVWm(:,gt1),AmpSum2AhToVWmcVWm(:,gt1),AmpSqAhToVWmcVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVWm,MVWm,AmpSumAhToVWmcVWm(:,gt1),AmpSum2AhToVWmcVWm(:,gt1),AmpSqAhToVWmcVWm(gt1)) 
End if  
Else  
  AmpSqAhToVWmcVWm(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVWmcVWm(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),MVWmOS,MVWmOS,helfactor*AmpSqAhToVWmcVWm(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVWm,MVWm,helfactor*AmpSqAhToVWmcVWm(gt1))
End if 
If ((Abs(MRPAhToVWmcVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVWmcVWm(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.5) isave = i4 
End do
!---------------- 
! VZ VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMLV_AhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MHpmOS,         & 
& MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,          & 
& MSu2OS,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVZL,            & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,          & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplHpmcHpmVZVZ1,  & 
& cplSdcSdVZVZaa,cplSucSuVZVZaa,AmpVertexAhToVZVZ)

 Else 
Call Amplitude_VERTEX_MSSMLV_AhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,MHpmOS,         & 
& MSdOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MHpm2OS,MSd2OS,          & 
& MSu2OS,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVZL,            & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,          & 
& cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplHpmcHpmVZVZ1,  & 
& cplSdcSdVZVZaa,cplSucSuVZVZaa,AmpVertexAhToVZVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMLV_AhToVZVZ(MAh,MCha,MChi,MFd,MFu,MHpm,MSd,MSu,             & 
& MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MHpm2,MSd2,MSu2,MVWm2,MVZ2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,          & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,         & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,           & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,             & 
& cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSucSuVZVZaa,         & 
& AmpVertexAhToVZVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VZ VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVZVZ = 0._dp 
 AmpSum2AhToVZVZ = 0._dp  
Else 
 AmpSumAhToVZVZ = AmpVertexAhToVZVZ + AmpWaveAhToVZVZ
 AmpSum2AhToVZVZ = AmpVertexAhToVZVZ + AmpWaveAhToVZVZ 
End If 
Do gt1=1,5
i4 = isave 
If (((OSkinematics).and.(MAhOS(gt1).gt.(MVZOS+MVZOS))).or.((.not.OSkinematics).and.(MAh(gt1).gt.(MVZ+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVZOS,MVZOS,AmpSumAhToVZVZ(:,gt1),AmpSum2AhToVZVZ(:,gt1),AmpSqAhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVZ,MVZ,AmpSumAhToVZVZ(:,gt1),AmpSum2AhToVZVZ(:,gt1),AmpSqAhToVZVZ(gt1)) 
End if  
Else  
  AmpSqAhToVZVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVZVZ(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MVZOS,MVZOS,helfactor*AmpSqAhToVZVZ(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVZ,MVZ,helfactor*AmpSqAhToVZVZ(gt1))
End if 
If ((Abs(MRPAhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.5) isave = i4 
End do
End Subroutine OneLoopDecay_Ah

End Module Wrapper_OneLoopDecay_Ah_MSSMLV
