! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 12:51 on 25.1.2018   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Chi_MSSMBpV
Use Model_Data_MSSMBpV 
Use Kinematics 
Use OneLoopDecay_Chi_MSSMBpV 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Chi(MSdOS,MSd2OS,MSvOS,MSv2OS,MSuOS,MSu2OS,MSeOS,             & 
& MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,MChaOS,MCha2OS,         & 
& MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,             & 
& MVWm2OS,ZDOS,ZVOS,ZUOS,ZEOS,ZHOS,ZAOS,ZPOS,ZNOS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,           & 
& ZDROS,ZULOS,ZUROS,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,               & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,             & 
& ZV,ZW,ZZ,alphaH,betaH,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,ml2,mHd2,            & 
& mHu2,md2,mu2,me2,M1,M2,M3,vd,vu,dg1,dg2,dg3,dMu,dBmu,dYd,dTd,dYe,dTe,dL3,              & 
& dT3,dYu,dTu,dmq2,dml2,dmHd2,dmHu2,dmd2,dmu2,dme2,dM1,dM2,dM3,dvd,dvu,dpG,              & 
& dZD,dZV,dZU,dZE,dZH,dZA,dZP,dZN,dUM,dUP,dZEL,dZER,dZDL,dZDR,dZUL,dZUR,dSinTW,          & 
& dCosTW,dTanTW,ZfVG,ZffG,ZfFvL,ZfVP,ZfVZ,ZfVWm,ZfSd,ZfSv,ZfSu,ZfSe,Zfhh,ZfAh,           & 
& ZfHpm,ZfL0,ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,cplAhAhhh,      & 
& cplAhcHpmVWm,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,     & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,   & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdcFdcSuL,  & 
& cplcFdcFdcSuR,cplcFdcFucSdL,cplcFdcFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,      & 
& cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvL,         & 
& cplcFeChaSvR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,            & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvHpmL,              & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,         & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvVZL,cplcFvFvVZR,cplChaFucSdL,        & 
& cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcSdcSdcSu,         & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplFdFdSuL,cplFdFdSuR,cplFdFuSdL,cplFdFuSdR,cplGluFdcSdL,    & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,            & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhVZVZ,       & 
& cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmSucSd,cplHpmSvcSe,           & 
& cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSucVWm,cplSecHpmcSv,               & 
& cplSecSeVP,cplSecSeVZ,cplSecSvcVWm,cplSucSdVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,       & 
& cplSvcSeVWm,cplSvcSvVZ,ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplChiChacVWmL,             & 
& ctcplChiChacVWmR,ctcplChiChiAhL,ctcplChiChiAhR,ctcplChiChihhL,ctcplChiChihhR,          & 
& ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,            & 
& ctcplChiFecSeR,ctcplChiFucSuL,ctcplChiFucSuR,ctcplChiFvcSvL,ctcplChiFvcSvR,            & 
& GcplChiChacHpmL,GcplChiChacHpmR,GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplChiChacHpmL,        & 
& GosZcplChiChacHpmR,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplChiChacHpmL,GZcplChiChacHpmR,& 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChiHpmL,           & 
& ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdChiSdL,ZcplcFdChiSdR,           & 
& ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdGluSdL,ZcplcFdGluSdR,       & 
& ZcplcFeChiSeL,ZcplcFeChiSeR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFuChiSuL,ZcplcFuChiSuR,     & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuGluSuL,ZcplcFuGluSuR,       & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplChiChiAhL,         & 
& ZcplChiChiAhR,ZcplChiChihhL,ZcplChiChihhR,ZcplChiChiVZL,ZcplChiChiVZR,ZcplChiFdcSdL,   & 
& ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplChiFvcSvL,   & 
& ZcplChiFvcSvR,ZcplcHpmVPVWm,ZcplcVWmVPVWm,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplGluFucSuL,   & 
& ZcplGluFucSuR,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVG,ZcplSdcSdVP,ZcplSecSeVP,         & 
& ZcplSucSuVG,ZcplSucSuVP,ZRUZD,ZRUZV,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,               & 
& ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,            & 
& kont,gP1LChi)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L3(3,3,3),Yu(3,3),Mu,Td(3,3),Te(3,3),T3(3,3,3),Tu(3,3),               & 
& Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu

Real(dp),Intent(in) :: MAh(2),MAh2(2),MCha(2),MCha2(2),MChi(4),MChi2(4),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MGlu,MGlu2,Mhh(2),Mhh2(2),MHpm(2),MHpm2(2),MSd(6),              & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(3),MSv2(3),MVWm,MVWm2,MVZ,MVZ2,              & 
& TW,v,ZA(2,2),ZH(2,2),ZP(2,2),ZZ(2,2),alphaH,betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),               & 
& ZN(4,4),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(3,3),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dmHd2,dmHu2,dvd,dvu,dZH(2,2),dZA(2,2),dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp),Intent(in) :: dMu,dBmu,dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dL3(3,3,3),dT3(3,3,3),dYu(3,3),          & 
& dTu(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),dmu2(3,3),dme2(3,3),dM1,dM2,dM3,dpG,            & 
& dZD(6,6),dZV(3,3),dZU(6,6),dZE(6,6),dZN(4,4),dUM(2,2),dUP(2,2),dZEL(3,3),              & 
& dZER(3,3),dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp),Intent(in) :: cplAhAhhh(2,2,2),cplAhcHpmVWm(2,2),cplAhhhVZ(2,2),cplAhHpmcHpm(2,2,2),cplAhHpmcVWm(2,2),& 
& cplAhSdcSd(2,6,6),cplAhSecSe(2,6,6),cplAhSucSu(2,6,6),cplcChaChaAhL(2,2,2),            & 
& cplcChaChaAhR(2,2,2),cplcChaChahhL(2,2,2),cplcChaChahhR(2,2,2),cplcChaChaVPL(2,2),     & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,4,2),        & 
& cplcChaChiHpmR(2,4,2),cplcChaChiVWmL(2,4),cplcChaChiVWmR(2,4),cplcChaFdcSuL(2,3,6),    & 
& cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,3),cplcChaFecSvR(2,3,3),cplcFdcFdcSuL(3,3,6),   & 
& cplcFdcFdcSuR(3,3,6),cplcFdcFucSdL(3,3,6),cplcFdcFucSdR(3,3,6),cplcFdChaSuL(3,2,6),    & 
& cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,4,6),cplcFdChiSdR(3,4,6),cplcFdFdAhL(3,3,2),        & 
& cplcFdFdAhR(3,3,2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),             & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),           & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFeChaSvL(3,2,3),cplcFeChaSvR(3,2,3),           & 
& cplcFeChiSeL(3,4,6),cplcFeChiSeR(3,4,6),cplcFeFeAhL(3,3,2),cplcFeFeAhR(3,3,2),         & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),             & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFuChiSuL(3,4,6),cplcFuChiSuR(3,4,6),           & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuAhL(3,3,2),cplcFuFuAhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplcFvChiSvL(3,4,3),              & 
& cplcFvChiSvR(3,4,3),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplcFvFecVWmL(3,3),      & 
& cplcFvFecVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplChaFucSdL(2,3,6),              & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChacHpmL(4,2,2),     & 
& cplChiChacHpmR(4,2,2),cplChiChacVWmL(4,2),cplChiChacVWmR(4,2),cplChiChiAhL(4,4,2),     & 
& cplChiChiAhR(4,4,2),cplChiChihhL(4,4,2),cplChiChihhR(4,4,2),cplChiChiVZL(4,4),         & 
& cplChiChiVZR(4,4),cplChiFdcSdL(4,3,6),cplChiFdcSdR(4,3,6),cplChiFecSeL(4,3,6),         & 
& cplChiFecSeR(4,3,6),cplChiFucSuL(4,3,6),cplChiFucSuR(4,3,6),cplChiFvcSvL(4,3,3),       & 
& cplChiFvcSvR(4,3,3),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcSdcSdcSu(6,6,6),               & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplFdFdSuL(3,3,6),cplFdFdSuR(3,3,6),cplFdFuSdL(3,3,6),       & 
& cplFdFuSdR(3,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),               & 
& cplGluFucSuR(3,6),cplhhcHpmVWm(2,2),cplhhcVWmVWm(2),cplhhhhhh(2,2,2),cplhhHpmcHpm(2,2,2),& 
& cplhhHpmcVWm(2,2),cplhhSdcSd(2,6,6),cplhhSecSe(2,6,6),cplhhSucSu(2,6,6),               & 
& cplhhSvcSv(2,3,3),cplhhVZVZ(2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcVWmVP(2),    & 
& cplHpmcVWmVZ(2),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,3,6),cplSdcHpmcSu(6,2,6),             & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSucVWm(6,6),cplSecHpmcSv(6,2,3), & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSvcVWm(6,3),cplSucSdVWm(6,6),cplSucSuVG(6,6),    & 
& cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSvcSeVWm(3,6),cplSvcSvVZ(3,3),ctcplChiChacHpmL(4,2,2)

Complex(dp),Intent(in) :: ctcplChiChacHpmR(4,2,2),ctcplChiChacVWmL(4,2),ctcplChiChacVWmR(4,2),ctcplChiChiAhL(4,4,2),& 
& ctcplChiChiAhR(4,4,2),ctcplChiChihhL(4,4,2),ctcplChiChihhR(4,4,2),ctcplChiChiVZL(4,4), & 
& ctcplChiChiVZR(4,4),ctcplChiFdcSdL(4,3,6),ctcplChiFdcSdR(4,3,6),ctcplChiFecSeL(4,3,6), & 
& ctcplChiFecSeR(4,3,6),ctcplChiFucSuL(4,3,6),ctcplChiFucSuR(4,3,6),ctcplChiFvcSvL(4,3,3),& 
& ctcplChiFvcSvR(4,3,3),GcplChiChacHpmL(4,2,2),GcplChiChacHpmR(4,2,2),GcplcHpmVPVWm(2),  & 
& GcplHpmcVWmVP(2),GosZcplChiChacHpmL(4,2,2),GosZcplChiChacHpmR(4,2,2),GosZcplcHpmVPVWm(2),& 
& GosZcplHpmcVWmVP(2),GZcplChiChacHpmL(4,2,2),GZcplChiChacHpmR(4,2,2),GZcplcHpmVPVWm(2), & 
& GZcplHpmcVWmVP(2),ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),ZcplcChaChiHpmL(2,4,2),      & 
& ZcplcChaChiHpmR(2,4,2),ZcplcChaChiVWmL(2,4),ZcplcChaChiVWmR(2,4),ZcplcFdChiSdL(3,4,6), & 
& ZcplcFdChiSdR(3,4,6),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),ZcplcFdFdVPL(3,3),            & 
& ZcplcFdFdVPR(3,3),ZcplcFdGluSdL(3,6),ZcplcFdGluSdR(3,6),ZcplcFeChiSeL(3,4,6),          & 
& ZcplcFeChiSeR(3,4,6),ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFuChiSuL(3,4,6),         & 
& ZcplcFuChiSuR(3,4,6),ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),            & 
& ZcplcFuFuVPR(3,3),ZcplcFuGluSuL(3,6),ZcplcFuGluSuR(3,6),ZcplChiChacHpmL(4,2,2),        & 
& ZcplChiChacHpmR(4,2,2),ZcplChiChacVWmL(4,2),ZcplChiChacVWmR(4,2),ZcplChiChiAhL(4,4,2), & 
& ZcplChiChiAhR(4,4,2),ZcplChiChihhL(4,4,2),ZcplChiChihhR(4,4,2),ZcplChiChiVZL(4,4),     & 
& ZcplChiChiVZR(4,4),ZcplChiFdcSdL(4,3,6),ZcplChiFdcSdR(4,3,6),ZcplChiFecSeL(4,3,6),     & 
& ZcplChiFecSeR(4,3,6),ZcplChiFucSuL(4,3,6),ZcplChiFucSuR(4,3,6),ZcplChiFvcSvL(4,3,3),   & 
& ZcplChiFvcSvR(4,3,3),ZcplcHpmVPVWm(2),ZcplcVWmVPVWm,ZcplGluFdcSdL(3,6),ZcplGluFdcSdR(3,6),& 
& ZcplGluFucSuL(3,6),ZcplGluFucSuR(3,6),ZcplHpmcHpmVP(2,2),ZcplHpmcVWmVP(2),             & 
& ZcplSdcSdVG(6,6),ZcplSdcSdVP(6,6),ZcplSecSeVP(6,6),ZcplSucSuVG(6,6),ZcplSucSuVP(6,6)

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZffG,ZfFvL(3,3),ZfVP,ZfVZ,ZfVWm,ZfSd(6,6),ZfSv(3,3),ZfSu(6,6),ZfSe(6,6),         & 
& Zfhh(2,2),ZfAh(2,2),ZfHpm(2,2),ZfL0(4,4),ZfLm(2,2),ZfLp(2,2),ZfFEL(3,3),               & 
& ZfFER(3,3),ZfFDL(3,3),ZfFDR(3,3),ZfFUL(3,3),ZfFUR(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MSdOS(6),MSd2OS(6),MSvOS(3),MSv2OS(3),MSuOS(6),MSu2OS(6),MSeOS(6),MSe2OS(6),          & 
& MhhOS(2),Mhh2OS(2),MAhOS(2),MAh2OS(2),MHpmOS(2),MHpm2OS(2),MChiOS(4),MChi2OS(4),       & 
& MChaOS(2),MCha2OS(2),MFeOS(3),MFe2OS(3),MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),         & 
& MGluOS,MGlu2OS,MVZOS,MVZ2OS,MVWmOS,MVWm2OS,ZHOS(2,2),ZAOS(2,2),ZPOS(2,2)

Complex(dp),Intent(in) :: ZDOS(6,6),ZVOS(3,3),ZUOS(6,6),ZEOS(6,6),ZNOS(4,4),UMOS(2,2),UPOS(2,2),ZELOS(3,3),     & 
& ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3)

Complex(dp),Intent(in) :: ZRUZD(6,6),ZRUZV(3,3),ZRUZU(6,6),ZRUZE(6,6),ZRUZH(2,2),ZRUZA(2,2),ZRUZP(2,2),         & 
& ZRUZN(4,4),ZRUUM(2,2),ZRUUP(2,2),ZRUZEL(3,3),ZRUZER(3,3),ZRUZDL(3,3),ZRUZDR(3,3),      & 
& ZRUZUL(3,3),ZRUZUR(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LChi(4,88) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUZDc(6, 6) 
Complex(dp) :: ZRUZVc(3, 3) 
Complex(dp) :: ZRUZUc(6, 6) 
Complex(dp) :: ZRUZEc(6, 6) 
Complex(dp) :: ZRUZHc(2, 2) 
Complex(dp) :: ZRUZAc(2, 2) 
Complex(dp) :: ZRUZPc(2, 2) 
Complex(dp) :: ZRUZNc(4, 4) 
Complex(dp) :: ZRUUMc(2, 2) 
Complex(dp) :: ZRUUPc(2, 2) 
Complex(dp) :: ZRUZELc(3, 3) 
Complex(dp) :: ZRUZERc(3, 3) 
Complex(dp) :: ZRUZDLc(3, 3) 
Complex(dp) :: ZRUZDRc(3, 3) 
Complex(dp) :: ZRUZULc(3, 3) 
Complex(dp) :: ZRUZURc(3, 3) 
Real(dp) :: MRPChiToChiAh(4,4,2),MRGChiToChiAh(4,4,2), MRPZChiToChiAh(4,4,2),MRGZChiToChiAh(4,4,2) 
Real(dp) :: MVPChiToChiAh(4,4,2) 
Real(dp) :: RMsqTreeChiToChiAh(4,4,2),RMsqWaveChiToChiAh(4,4,2),RMsqVertexChiToChiAh(4,4,2) 
Complex(dp) :: AmpTreeChiToChiAh(2,4,4,2),AmpWaveChiToChiAh(2,4,4,2)=(0._dp,0._dp),AmpVertexChiToChiAh(2,4,4,2)& 
 & ,AmpVertexIRosChiToChiAh(2,4,4,2),AmpVertexIRdrChiToChiAh(2,4,4,2), AmpSumChiToChiAh(2,4,4,2), AmpSum2ChiToChiAh(2,4,4,2) 
Complex(dp) :: AmpTreeZChiToChiAh(2,4,4,2),AmpWaveZChiToChiAh(2,4,4,2),AmpVertexZChiToChiAh(2,4,4,2) 
Real(dp) :: AmpSqChiToChiAh(4,4,2),  AmpSqTreeChiToChiAh(4,4,2) 
Real(dp) :: MRPChiToChacHpm(4,2,2),MRGChiToChacHpm(4,2,2), MRPZChiToChacHpm(4,2,2),MRGZChiToChacHpm(4,2,2) 
Real(dp) :: MVPChiToChacHpm(4,2,2) 
Real(dp) :: RMsqTreeChiToChacHpm(4,2,2),RMsqWaveChiToChacHpm(4,2,2),RMsqVertexChiToChacHpm(4,2,2) 
Complex(dp) :: AmpTreeChiToChacHpm(2,4,2,2),AmpWaveChiToChacHpm(2,4,2,2)=(0._dp,0._dp),AmpVertexChiToChacHpm(2,4,2,2)& 
 & ,AmpVertexIRosChiToChacHpm(2,4,2,2),AmpVertexIRdrChiToChacHpm(2,4,2,2), AmpSumChiToChacHpm(2,4,2,2), AmpSum2ChiToChacHpm(2,4,2,2) 
Complex(dp) :: AmpTreeZChiToChacHpm(2,4,2,2),AmpWaveZChiToChacHpm(2,4,2,2),AmpVertexZChiToChacHpm(2,4,2,2) 
Real(dp) :: AmpSqChiToChacHpm(4,2,2),  AmpSqTreeChiToChacHpm(4,2,2) 
Real(dp) :: MRPChiToChacVWm(4,2),MRGChiToChacVWm(4,2), MRPZChiToChacVWm(4,2),MRGZChiToChacVWm(4,2) 
Real(dp) :: MVPChiToChacVWm(4,2) 
Real(dp) :: RMsqTreeChiToChacVWm(4,2),RMsqWaveChiToChacVWm(4,2),RMsqVertexChiToChacVWm(4,2) 
Complex(dp) :: AmpTreeChiToChacVWm(4,4,2),AmpWaveChiToChacVWm(4,4,2)=(0._dp,0._dp),AmpVertexChiToChacVWm(4,4,2)& 
 & ,AmpVertexIRosChiToChacVWm(4,4,2),AmpVertexIRdrChiToChacVWm(4,4,2), AmpSumChiToChacVWm(4,4,2), AmpSum2ChiToChacVWm(4,4,2) 
Complex(dp) :: AmpTreeZChiToChacVWm(4,4,2),AmpWaveZChiToChacVWm(4,4,2),AmpVertexZChiToChacVWm(4,4,2) 
Real(dp) :: AmpSqChiToChacVWm(4,2),  AmpSqTreeChiToChacVWm(4,2) 
Real(dp) :: MRPChiToChihh(4,4,2),MRGChiToChihh(4,4,2), MRPZChiToChihh(4,4,2),MRGZChiToChihh(4,4,2) 
Real(dp) :: MVPChiToChihh(4,4,2) 
Real(dp) :: RMsqTreeChiToChihh(4,4,2),RMsqWaveChiToChihh(4,4,2),RMsqVertexChiToChihh(4,4,2) 
Complex(dp) :: AmpTreeChiToChihh(2,4,4,2),AmpWaveChiToChihh(2,4,4,2)=(0._dp,0._dp),AmpVertexChiToChihh(2,4,4,2)& 
 & ,AmpVertexIRosChiToChihh(2,4,4,2),AmpVertexIRdrChiToChihh(2,4,4,2), AmpSumChiToChihh(2,4,4,2), AmpSum2ChiToChihh(2,4,4,2) 
Complex(dp) :: AmpTreeZChiToChihh(2,4,4,2),AmpWaveZChiToChihh(2,4,4,2),AmpVertexZChiToChihh(2,4,4,2) 
Real(dp) :: AmpSqChiToChihh(4,4,2),  AmpSqTreeChiToChihh(4,4,2) 
Real(dp) :: MRPChiToChiVZ(4,4),MRGChiToChiVZ(4,4), MRPZChiToChiVZ(4,4),MRGZChiToChiVZ(4,4) 
Real(dp) :: MVPChiToChiVZ(4,4) 
Real(dp) :: RMsqTreeChiToChiVZ(4,4),RMsqWaveChiToChiVZ(4,4),RMsqVertexChiToChiVZ(4,4) 
Complex(dp) :: AmpTreeChiToChiVZ(4,4,4),AmpWaveChiToChiVZ(4,4,4)=(0._dp,0._dp),AmpVertexChiToChiVZ(4,4,4)& 
 & ,AmpVertexIRosChiToChiVZ(4,4,4),AmpVertexIRdrChiToChiVZ(4,4,4), AmpSumChiToChiVZ(4,4,4), AmpSum2ChiToChiVZ(4,4,4) 
Complex(dp) :: AmpTreeZChiToChiVZ(4,4,4),AmpWaveZChiToChiVZ(4,4,4),AmpVertexZChiToChiVZ(4,4,4) 
Real(dp) :: AmpSqChiToChiVZ(4,4),  AmpSqTreeChiToChiVZ(4,4) 
Real(dp) :: MRPChiToFdcSd(4,3,6),MRGChiToFdcSd(4,3,6), MRPZChiToFdcSd(4,3,6),MRGZChiToFdcSd(4,3,6) 
Real(dp) :: MVPChiToFdcSd(4,3,6) 
Real(dp) :: RMsqTreeChiToFdcSd(4,3,6),RMsqWaveChiToFdcSd(4,3,6),RMsqVertexChiToFdcSd(4,3,6) 
Complex(dp) :: AmpTreeChiToFdcSd(2,4,3,6),AmpWaveChiToFdcSd(2,4,3,6)=(0._dp,0._dp),AmpVertexChiToFdcSd(2,4,3,6)& 
 & ,AmpVertexIRosChiToFdcSd(2,4,3,6),AmpVertexIRdrChiToFdcSd(2,4,3,6), AmpSumChiToFdcSd(2,4,3,6), AmpSum2ChiToFdcSd(2,4,3,6) 
Complex(dp) :: AmpTreeZChiToFdcSd(2,4,3,6),AmpWaveZChiToFdcSd(2,4,3,6),AmpVertexZChiToFdcSd(2,4,3,6) 
Real(dp) :: AmpSqChiToFdcSd(4,3,6),  AmpSqTreeChiToFdcSd(4,3,6) 
Real(dp) :: MRPChiToFecSe(4,3,6),MRGChiToFecSe(4,3,6), MRPZChiToFecSe(4,3,6),MRGZChiToFecSe(4,3,6) 
Real(dp) :: MVPChiToFecSe(4,3,6) 
Real(dp) :: RMsqTreeChiToFecSe(4,3,6),RMsqWaveChiToFecSe(4,3,6),RMsqVertexChiToFecSe(4,3,6) 
Complex(dp) :: AmpTreeChiToFecSe(2,4,3,6),AmpWaveChiToFecSe(2,4,3,6)=(0._dp,0._dp),AmpVertexChiToFecSe(2,4,3,6)& 
 & ,AmpVertexIRosChiToFecSe(2,4,3,6),AmpVertexIRdrChiToFecSe(2,4,3,6), AmpSumChiToFecSe(2,4,3,6), AmpSum2ChiToFecSe(2,4,3,6) 
Complex(dp) :: AmpTreeZChiToFecSe(2,4,3,6),AmpWaveZChiToFecSe(2,4,3,6),AmpVertexZChiToFecSe(2,4,3,6) 
Real(dp) :: AmpSqChiToFecSe(4,3,6),  AmpSqTreeChiToFecSe(4,3,6) 
Real(dp) :: MRPChiToFucSu(4,3,6),MRGChiToFucSu(4,3,6), MRPZChiToFucSu(4,3,6),MRGZChiToFucSu(4,3,6) 
Real(dp) :: MVPChiToFucSu(4,3,6) 
Real(dp) :: RMsqTreeChiToFucSu(4,3,6),RMsqWaveChiToFucSu(4,3,6),RMsqVertexChiToFucSu(4,3,6) 
Complex(dp) :: AmpTreeChiToFucSu(2,4,3,6),AmpWaveChiToFucSu(2,4,3,6)=(0._dp,0._dp),AmpVertexChiToFucSu(2,4,3,6)& 
 & ,AmpVertexIRosChiToFucSu(2,4,3,6),AmpVertexIRdrChiToFucSu(2,4,3,6), AmpSumChiToFucSu(2,4,3,6), AmpSum2ChiToFucSu(2,4,3,6) 
Complex(dp) :: AmpTreeZChiToFucSu(2,4,3,6),AmpWaveZChiToFucSu(2,4,3,6),AmpVertexZChiToFucSu(2,4,3,6) 
Real(dp) :: AmpSqChiToFucSu(4,3,6),  AmpSqTreeChiToFucSu(4,3,6) 
Real(dp) :: MRPChiToFvcSv(4,3,3),MRGChiToFvcSv(4,3,3), MRPZChiToFvcSv(4,3,3),MRGZChiToFvcSv(4,3,3) 
Real(dp) :: MVPChiToFvcSv(4,3,3) 
Real(dp) :: RMsqTreeChiToFvcSv(4,3,3),RMsqWaveChiToFvcSv(4,3,3),RMsqVertexChiToFvcSv(4,3,3) 
Complex(dp) :: AmpTreeChiToFvcSv(2,4,3,3),AmpWaveChiToFvcSv(2,4,3,3)=(0._dp,0._dp),AmpVertexChiToFvcSv(2,4,3,3)& 
 & ,AmpVertexIRosChiToFvcSv(2,4,3,3),AmpVertexIRdrChiToFvcSv(2,4,3,3), AmpSumChiToFvcSv(2,4,3,3), AmpSum2ChiToFvcSv(2,4,3,3) 
Complex(dp) :: AmpTreeZChiToFvcSv(2,4,3,3),AmpWaveZChiToFvcSv(2,4,3,3),AmpVertexZChiToFvcSv(2,4,3,3) 
Real(dp) :: AmpSqChiToFvcSv(4,3,3),  AmpSqTreeChiToFvcSv(4,3,3) 
Real(dp) :: MRPChiToChiVP(4,4),MRGChiToChiVP(4,4), MRPZChiToChiVP(4,4),MRGZChiToChiVP(4,4) 
Real(dp) :: MVPChiToChiVP(4,4) 
Real(dp) :: RMsqTreeChiToChiVP(4,4),RMsqWaveChiToChiVP(4,4),RMsqVertexChiToChiVP(4,4) 
Complex(dp) :: AmpTreeChiToChiVP(4,4,4),AmpWaveChiToChiVP(4,4,4)=(0._dp,0._dp),AmpVertexChiToChiVP(4,4,4)& 
 & ,AmpVertexIRosChiToChiVP(4,4,4),AmpVertexIRdrChiToChiVP(4,4,4), AmpSumChiToChiVP(4,4,4), AmpSum2ChiToChiVP(4,4,4) 
Complex(dp) :: AmpTreeZChiToChiVP(4,4,4),AmpWaveZChiToChiVP(4,4,4),AmpVertexZChiToChiVP(4,4,4) 
Real(dp) :: AmpSqChiToChiVP(4,4),  AmpSqTreeChiToChiVP(4,4) 
Real(dp) :: MRPChiToGluVG(4),MRGChiToGluVG(4), MRPZChiToGluVG(4),MRGZChiToGluVG(4) 
Real(dp) :: MVPChiToGluVG(4) 
Real(dp) :: RMsqTreeChiToGluVG(4),RMsqWaveChiToGluVG(4),RMsqVertexChiToGluVG(4) 
Complex(dp) :: AmpTreeChiToGluVG(4,4),AmpWaveChiToGluVG(4,4)=(0._dp,0._dp),AmpVertexChiToGluVG(4,4)& 
 & ,AmpVertexIRosChiToGluVG(4,4),AmpVertexIRdrChiToGluVG(4,4), AmpSumChiToGluVG(4,4), AmpSum2ChiToGluVG(4,4) 
Complex(dp) :: AmpTreeZChiToGluVG(4,4),AmpWaveZChiToGluVG(4,4),AmpVertexZChiToGluVG(4,4) 
Real(dp) :: AmpSqChiToGluVG(4),  AmpSqTreeChiToGluVG(4) 
Write(*,*) "Calculating one-loop decays of Chi " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUZDc = Conjg(ZRUZD)
ZRUZVc = Conjg(ZRUZV)
ZRUZUc = Conjg(ZRUZU)
ZRUZEc = Conjg(ZRUZE)
ZRUZHc = Conjg(ZRUZH)
ZRUZAc = Conjg(ZRUZA)
ZRUZPc = Conjg(ZRUZP)
ZRUZNc = Conjg(ZRUZN)
ZRUUMc = Conjg(ZRUUM)
ZRUUPc = Conjg(ZRUUP)
ZRUZELc = Conjg(ZRUZEL)
ZRUZERc = Conjg(ZRUZER)
ZRUZDLc = Conjg(ZRUZDL)
ZRUZDRc = Conjg(ZRUZDR)
ZRUZULc = Conjg(ZRUZUL)
ZRUZURc = Conjg(ZRUZUR)

 ! Counter 
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToChiAh(cplChiChiAhL,cplChiChiAhR,MAh,MChi,            & 
& MAh2,MChi2,AmpTreeChiToChiAh)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToChiAh(ZcplChiChiAhL,ZcplChiChiAhR,MAh,               & 
& MChi,MAh2,MChi2,AmpTreeChiToChiAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChiAh(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,           & 
& MAhOS,MChiOS,MRPChiToChiAh,MRGChiToChiAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChiAh(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,         & 
& MAhOS,MChiOS,MRPChiToChiAh,MRGChiToChiAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToChiAh(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,           & 
& MAh,MChi,MRPChiToChiAh,MRGChiToChiAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChiAh(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,         & 
& MAh,MChi,MRPChiToChiAh,MRGChiToChiAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToChiAh(cplChiChiAhL,cplChiChiAhR,ctcplChiChiAhL,      & 
& ctcplChiChiAhR,MAh,MAh2,MChi,MChi2,ZfAh,ZfL0,AmpWaveChiToChiAh)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,             & 
& MSe2,MSu2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,               & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexChiToChiAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,             & 
& MSe2,MSu2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,               & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRdrChiToChiAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,              & 
& MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVWm2OS,MVZ2OS,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,             & 
& MSe2,MSu2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,ZcplChiChiAhL,              & 
& ZcplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,              & 
& MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVWm2OS,MVZ2OS,               & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,    & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,             & 
& MSe2,MSu2,MVWm2,MVZ2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,               & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

 End if 
 End if 
AmpVertexChiToChiAh = AmpVertexChiToChiAh -  AmpVertexIRdrChiToChiAh! +  AmpVertexIRosChiToChiAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToChiAh(1,gt2,:,:) = AmpWaveZChiToChiAh(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiAh(1,gt1,:,:) 
AmpVertexZChiToChiAh(1,gt2,:,:)= AmpVertexZChiToChiAh(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiAh(1,gt1,:,:) 
AmpWaveZChiToChiAh(2,gt2,:,:) = AmpWaveZChiToChiAh(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiAh(2,gt1,:,:) 
AmpVertexZChiToChiAh(2,gt2,:,:)= AmpVertexZChiToChiAh(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiAh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
! Final State 1 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToChiAh(1,:,gt2,:) = AmpWaveZChiToChiAh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiAh(1,:,gt1,:) 
AmpVertexZChiToChiAh(1,:,gt2,:)= AmpVertexZChiToChiAh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChiToChiAh(1,:,gt1,:) 
AmpWaveZChiToChiAh(2,:,gt2,:) = AmpWaveZChiToChiAh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiAh(2,:,gt1,:) 
AmpVertexZChiToChiAh(2,:,gt2,:)= AmpVertexZChiToChiAh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiAh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
! Final State 2 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChiAh(:,:,:,gt2) = AmpWaveZChiToChiAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveChiToChiAh(:,:,:,gt1) 
AmpVertexZChiToChiAh(:,:,:,gt2)= AmpVertexZChiToChiAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexChiToChiAh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChiAh = AmpVertexChiToChiAh  +  AmpVertexIRosChiToChiAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChiAh = AmpTreeChiToChiAh 
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh  
Else 
 AmpSumChiToChiAh = AmpTreeChiToChiAh + AmpWaveChiToChiAh + AmpVertexChiToChiAh
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh + AmpWaveChiToChiAh + AmpVertexChiToChiAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiAh = AmpTreeChiToChiAh
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
    Do gt3=2,2
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChiOS(gt2)+MAhOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MChi(gt2)+MAh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = 2._dp*AmpWaveChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = 2._dp*AmpVertexChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChiAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3)  
  AmpSum2ChiToChiAh = + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3) + AmpSqTreeChiToChiAh(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3)  
  AmpSum2ChiToChiAh = + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3) + AmpSqTreeChiToChiAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChiAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),helfactor*AmpSqChiToChiAh(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MChi(gt2),MAh(gt3),helfactor*AmpSqChiToChiAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChiToChiAh(gt1, gt2, gt3) + MRGChiToChiAh(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChiToChiAh(gt1, gt2, gt3) + MRGChiToChiAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Conjg(Hpm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToChacHpm(cplChiChacHpmL,cplChiChacHpmR,               & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChiToChacHpm)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToChacHpm(ZcplChiChacHpmL,ZcplChiChacHpmR,             & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChiToChacHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChacHpm(MLambda,em,gs,cplChiChacHpmL,cplChiChacHpmR,     & 
& MChaOS,MChiOS,MHpmOS,MRPChiToChacHpm,MRGChiToChacHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChacHpm(MLambda,em,gs,ZcplChiChacHpmL,ZcplChiChacHpmR,   & 
& MChaOS,MChiOS,MHpmOS,MRPChiToChacHpm,MRGChiToChacHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToChacHpm(MLambda,em,gs,cplChiChacHpmL,cplChiChacHpmR,     & 
& MCha,MChi,MHpm,MRPChiToChacHpm,MRGChiToChacHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChacHpm(MLambda,em,gs,ZcplChiChacHpmL,ZcplChiChacHpmR,   & 
& MCha,MChi,MHpm,MRPChiToChacHpm,MRGChiToChacHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToChacHpm(cplChiChacHpmL,cplChiChacHpmR,               & 
& ctcplChiChacHpmL,ctcplChiChacHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,AmpWaveChiToChacHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,          & 
& cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,  & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,        & 
& cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexChiToChacHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,    & 
& cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,  & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,        & 
& cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRdrChiToChacHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacHpm(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSv2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,ZcplChiChacHpmL,ZcplChiChacHpmR,cplChiChacVWmL,              & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,  & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,        & 
& cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosChiToChacHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,    & 
& cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,ZcplChiChacHpmL,ZcplChiChacHpmR,cplChiChacVWmL, & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,  & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,        & 
& cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosChiToChacHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacHpm(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSv2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,               & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,        & 
& cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosChiToChacHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,    & 
& cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,  & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplSdcHpmcSu,        & 
& cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,AmpVertexIRosChiToChacHpm)

 End if 
 End if 
AmpVertexChiToChacHpm = AmpVertexChiToChacHpm -  AmpVertexIRdrChiToChacHpm! +  AmpVertexIRosChiToChacHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToChacHpm(1,gt2,:,:) = AmpWaveZChiToChacHpm(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacHpm(1,gt1,:,:) 
AmpVertexZChiToChacHpm(1,gt2,:,:)= AmpVertexZChiToChacHpm(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacHpm(1,gt1,:,:) 
AmpWaveZChiToChacHpm(2,gt2,:,:) = AmpWaveZChiToChacHpm(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacHpm(2,gt1,:,:) 
AmpVertexZChiToChacHpm(2,gt2,:,:)= AmpVertexZChiToChacHpm(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacHpm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
! Final State 1 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacHpm(1,:,gt2,:) = AmpWaveZChiToChacHpm(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChiToChacHpm(1,:,gt1,:) 
AmpVertexZChiToChacHpm(1,:,gt2,:)= AmpVertexZChiToChacHpm(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChiToChacHpm(1,:,gt1,:) 
AmpWaveZChiToChacHpm(2,:,gt2,:) = AmpWaveZChiToChacHpm(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacHpm(2,:,gt1,:) 
AmpVertexZChiToChacHpm(2,:,gt2,:)= AmpVertexZChiToChacHpm(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacHpm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
! Final State 2 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacHpm(:,:,:,gt2) = AmpWaveZChiToChacHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveChiToChacHpm(:,:,:,gt1) 
AmpVertexZChiToChacHpm(:,:,:,gt2)= AmpVertexZChiToChacHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexChiToChacHpm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChacHpm = AmpVertexChiToChacHpm  +  AmpVertexIRosChiToChacHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Cha conj[Hpm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm 
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm  
Else 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm + AmpWaveChiToChacHpm + AmpVertexChiToChacHpm
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + AmpWaveChiToChacHpm + AmpVertexChiToChacHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,2
    Do gt3=2,2
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChaOS(gt2)+MHpmOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MCha(gt2)+MHpm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = 2._dp*AmpWaveChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = 2._dp*AmpVertexChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqTreeChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3)  
  AmpSum2ChiToChacHpm = + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3) + AmpSqTreeChiToChacHpm(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqTreeChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3)  
  AmpSum2ChiToChacHpm = + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3) + AmpSqTreeChiToChacHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChacHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChacHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),helfactor*AmpSqChiToChacHpm(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MCha(gt2),MHpm(gt3),helfactor*AmpSqChiToChacHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChacHpm(gt1, gt2, gt3) + MRGChiToChacHpm(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChacHpm(gt1, gt2, gt3) + MRGChiToChacHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToChacVWm(cplChiChacVWmL,cplChiChacVWmR,               & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChiToChacVWm)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToChacVWm(ZcplChiChacVWmL,ZcplChiChacVWmR,             & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChiToChacVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChacVWm(MLambda,em,gs,cplChiChacVWmL,cplChiChacVWmR,     & 
& MChaOS,MChiOS,MVWmOS,MRPChiToChacVWm,MRGChiToChacVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChacVWm(MLambda,em,gs,ZcplChiChacVWmL,ZcplChiChacVWmR,   & 
& MChaOS,MChiOS,MVWmOS,MRPChiToChacVWm,MRGChiToChacVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToChacVWm(MLambda,em,gs,cplChiChacVWmL,cplChiChacVWmR,     & 
& MCha,MChi,MVWm,MRPChiToChacVWm,MRGChiToChacVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChacVWm(MLambda,em,gs,ZcplChiChacVWmL,ZcplChiChacVWmR,   & 
& MCha,MChi,MVWm,MRPChiToChacVWm,MRGChiToChacVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToChacVWm(cplChiChacVWmL,cplChiChacVWmR,               & 
& ctcplChiChacVWmL,ctcplChiChacVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,               & 
& ZfLm,ZfLp,ZfVWm,AmpWaveChiToChacVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,          & 
& cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,        & 
& cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexChiToChacVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,    & 
& cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,        & 
& cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRdrChiToChacVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacVWm(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSv2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplAhHpmcVWm,GosZcplChiChacHpmL,GosZcplChiChacHpmR,ZcplChiChacVWmL,ZcplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,GosZcplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,    & 
& cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRosChiToChacVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,    & 
& cplChiChiAhR,cplAhHpmcVWm,GZcplChiChacHpmL,GZcplChiChacHpmR,ZcplChiChacVWmL,           & 
& ZcplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,     & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,         & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,GZcplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,      & 
& cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRosChiToChacVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacVWm(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,              & 
& MSv2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,      & 
& cplAhHpmcVWm,GcplChiChacHpmL,GcplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,            & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,GcplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,       & 
& cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRosChiToChacVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,    & 
& cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplSdcSucVWm,        & 
& cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,AmpVertexIRosChiToChacVWm)

 End if 
 End if 
AmpVertexChiToChacVWm = AmpVertexChiToChacVWm -  AmpVertexIRdrChiToChacVWm! +  AmpVertexIRosChiToChacVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChacVWm=0._dp 
AmpVertexZChiToChacVWm=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToChacVWm(1,gt2,:) = AmpWaveZChiToChacVWm(1,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacVWm(1,gt1,:) 
AmpVertexZChiToChacVWm(1,gt2,:)= AmpVertexZChiToChacVWm(1,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacVWm(1,gt1,:) 
AmpWaveZChiToChacVWm(2,gt2,:) = AmpWaveZChiToChacVWm(2,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacVWm(2,gt1,:) 
AmpVertexZChiToChacVWm(2,gt2,:)= AmpVertexZChiToChacVWm(2,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacVWm(2,gt1,:) 
AmpWaveZChiToChacVWm(3,gt2,:) = AmpWaveZChiToChacVWm(3,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacVWm(3,gt1,:) 
AmpVertexZChiToChacVWm(3,gt2,:)= AmpVertexZChiToChacVWm(3,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacVWm(3,gt1,:) 
AmpWaveZChiToChacVWm(4,gt2,:) = AmpWaveZChiToChacVWm(4,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacVWm(4,gt1,:) 
AmpVertexZChiToChacVWm(4,gt2,:)= AmpVertexZChiToChacVWm(4,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacVWm(4,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChacVWm=AmpWaveZChiToChacVWm 
AmpVertexChiToChacVWm= AmpVertexZChiToChacVWm
! Final State 1 
AmpWaveZChiToChacVWm=0._dp 
AmpVertexZChiToChacVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacVWm(1,:,gt2) = AmpWaveZChiToChacVWm(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChiToChacVWm(1,:,gt1) 
AmpVertexZChiToChacVWm(1,:,gt2)= AmpVertexZChiToChacVWm(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChiToChacVWm(1,:,gt1) 
AmpWaveZChiToChacVWm(2,:,gt2) = AmpWaveZChiToChacVWm(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacVWm(2,:,gt1) 
AmpVertexZChiToChacVWm(2,:,gt2)= AmpVertexZChiToChacVWm(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacVWm(2,:,gt1) 
AmpWaveZChiToChacVWm(3,:,gt2) = AmpWaveZChiToChacVWm(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChiToChacVWm(3,:,gt1) 
AmpVertexZChiToChacVWm(3,:,gt2)= AmpVertexZChiToChacVWm(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChiToChacVWm(3,:,gt1) 
AmpWaveZChiToChacVWm(4,:,gt2) = AmpWaveZChiToChacVWm(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacVWm(4,:,gt1) 
AmpVertexZChiToChacVWm(4,:,gt2)= AmpVertexZChiToChacVWm(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacVWm(4,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChacVWm=AmpWaveZChiToChacVWm 
AmpVertexChiToChacVWm= AmpVertexZChiToChacVWm
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChacVWm = AmpVertexChiToChacVWm  +  AmpVertexIRosChiToChacVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Cha conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm 
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm  
Else 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm + AmpWaveChiToChacVWm + AmpVertexChiToChacVWm
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + AmpWaveChiToChacVWm + AmpVertexChiToChacVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChaOS(gt2)+MVWmOS))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MCha(gt2)+MVWm)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = 2._dp*AmpWaveChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = 2._dp*AmpVertexChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChacVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqTreeChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2)  
  AmpSum2ChiToChacVWm = + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2) + AmpSqTreeChiToChacVWm(gt1, gt2)  
Else  
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqTreeChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2)  
  AmpSum2ChiToChacVWm = + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2) + AmpSqTreeChiToChacVWm(gt1, gt2)  
End if  
Else  
  AmpSqChiToChacVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChacVWm(gt1, gt2).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChaOS(gt2),MVWmOS,helfactor*AmpSqChiToChacVWm(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MCha(gt2),MVWm,helfactor*AmpSqChiToChacVWm(gt1, gt2))
End if 
If ((Abs(MRPChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChacVWm(gt1, gt2) + MRGChiToChacVWm(gt1, gt2)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChacVWm(gt1, gt2) + MRGChiToChacVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToChihh(cplChiChihhL,cplChiChihhR,MChi,Mhh,            & 
& MChi2,Mhh2,AmpTreeChiToChihh)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToChihh(ZcplChiChihhL,ZcplChiChihhR,MChi,              & 
& Mhh,MChi2,Mhh2,AmpTreeChiToChihh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChihh(MLambda,em,gs,cplChiChihhL,cplChiChihhR,           & 
& MChiOS,MhhOS,MRPChiToChihh,MRGChiToChihh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChihh(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,         & 
& MChiOS,MhhOS,MRPChiToChihh,MRGChiToChihh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToChihh(MLambda,em,gs,cplChiChihhL,cplChiChihhR,           & 
& MChi,Mhh,MRPChiToChihh,MRGChiToChihh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChihh(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,         & 
& MChi,Mhh,MRPChiToChihh,MRGChiToChihh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToChihh(cplChiChihhL,cplChiChihhR,ctcplChiChihhL,      & 
& ctcplChiChihhR,MChi,MChi2,Mhh,Mhh2,Zfhh,ZfL0,AmpWaveChiToChihh)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,       & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexChiToChihh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,       & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRdrChiToChihh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChihh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,        & 
& MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,               & 
& MVZ2OS,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,ZcplChiChihhL,               & 
& ZcplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,        & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,AmpVertexIRosChiToChihh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,ZcplChiChihhL,ZcplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,      & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,       & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRosChiToChihh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChihh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,        & 
& MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,               & 
& MVZ2OS,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& AmpVertexIRosChiToChihh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,        & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,       & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,AmpVertexIRosChiToChihh)

 End if 
 End if 
AmpVertexChiToChihh = AmpVertexChiToChihh -  AmpVertexIRdrChiToChihh! +  AmpVertexIRosChiToChihh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToChihh(1,gt2,:,:) = AmpWaveZChiToChihh(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChihh(1,gt1,:,:) 
AmpVertexZChiToChihh(1,gt2,:,:)= AmpVertexZChiToChihh(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChihh(1,gt1,:,:) 
AmpWaveZChiToChihh(2,gt2,:,:) = AmpWaveZChiToChihh(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChihh(2,gt1,:,:) 
AmpVertexZChiToChihh(2,gt2,:,:)= AmpVertexZChiToChihh(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChihh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
! Final State 1 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToChihh(1,:,gt2,:) = AmpWaveZChiToChihh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChihh(1,:,gt1,:) 
AmpVertexZChiToChihh(1,:,gt2,:)= AmpVertexZChiToChihh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChiToChihh(1,:,gt1,:) 
AmpWaveZChiToChihh(2,:,gt2,:) = AmpWaveZChiToChihh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChihh(2,:,gt1,:) 
AmpVertexZChiToChihh(2,:,gt2,:)= AmpVertexZChiToChihh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChiToChihh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
! Final State 2 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChihh(:,:,:,gt2) = AmpWaveZChiToChihh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveChiToChihh(:,:,:,gt1) 
AmpVertexZChiToChihh(:,:,:,gt2)= AmpVertexZChiToChihh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexChiToChihh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChihh = AmpVertexChiToChihh  +  AmpVertexIRosChiToChihh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChihh = AmpTreeChiToChihh 
 AmpSum2ChiToChihh = AmpTreeChiToChihh + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh  
Else 
 AmpSumChiToChihh = AmpTreeChiToChihh + AmpWaveChiToChihh + AmpVertexChiToChihh
 AmpSum2ChiToChihh = AmpTreeChiToChihh + AmpWaveChiToChihh + AmpVertexChiToChihh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChihh = AmpTreeChiToChihh
 AmpSum2ChiToChihh = AmpTreeChiToChihh 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
    Do gt3=1,2
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChiOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MChi(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChihh = AmpTreeChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = 2._dp*AmpWaveChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = 2._dp*AmpVertexChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = AmpTreeChiToChihh + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChihh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChihh = AmpTreeChiToChihh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3)  
  AmpSum2ChiToChihh = + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3) + AmpSqTreeChiToChihh(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChihh = AmpTreeChiToChihh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3)  
  AmpSum2ChiToChihh = + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3) + AmpSqTreeChiToChihh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChihh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChihh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),helfactor*AmpSqChiToChihh(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MChi(gt2),Mhh(gt3),helfactor*AmpSqChiToChihh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChiToChihh(gt1, gt2, gt3) + MRGChiToChihh(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChiToChihh(gt1, gt2, gt3) + MRGChiToChihh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToChiVZ(cplChiChiVZL,cplChiChiVZR,MChi,MVZ,            & 
& MChi2,MVZ2,AmpTreeChiToChiVZ)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToChiVZ(ZcplChiChiVZL,ZcplChiChiVZR,MChi,              & 
& MVZ,MChi2,MVZ2,AmpTreeChiToChiVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChiVZ(MLambda,em,gs,cplChiChiVZL,cplChiChiVZR,           & 
& MChiOS,MVZOS,MRPChiToChiVZ,MRGChiToChiVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChiVZ(MLambda,em,gs,ZcplChiChiVZL,ZcplChiChiVZR,         & 
& MChiOS,MVZOS,MRPChiToChiVZ,MRGChiToChiVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToChiVZ(MLambda,em,gs,cplChiChiVZL,cplChiChiVZR,           & 
& MChi,MVZ,MRPChiToChiVZ,MRGChiToChiVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToChiVZ(MLambda,em,gs,ZcplChiChiVZL,ZcplChiChiVZR,         & 
& MChi,MVZ,MRPChiToChiVZ,MRGChiToChiVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToChiVZ(cplChiChiVZL,cplChiChiVZR,ctcplChiChiVZL,      & 
& ctcplChiChiVZR,MChi,MChi2,MVZ,MVZ2,ZfL0,ZfVZ,AmpWaveChiToChiVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,     & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexChiToChiVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,     & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRdrChiToChiVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,        & 
& MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,               & 
& MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,              & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,   & 
& ZcplChiChiVZL,ZcplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChiToChiVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChihhL,cplChiChihhR,ZcplChiChiVZL,ZcplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,     & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChiToChiVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,        & 
& MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,               & 
& MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,              & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,         & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,       & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChiToChiVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,cplcChaChaVZR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,     & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChiToChiVZ)

 End if 
 End if 
AmpVertexChiToChiVZ = AmpVertexChiToChiVZ -  AmpVertexIRdrChiToChiVZ! +  AmpVertexIRosChiToChiVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChiVZ=0._dp 
AmpVertexZChiToChiVZ=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToChiVZ(1,gt2,:) = AmpWaveZChiToChiVZ(1,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(1,gt1,:) 
AmpVertexZChiToChiVZ(1,gt2,:)= AmpVertexZChiToChiVZ(1,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(1,gt1,:) 
AmpWaveZChiToChiVZ(2,gt2,:) = AmpWaveZChiToChiVZ(2,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(2,gt1,:) 
AmpVertexZChiToChiVZ(2,gt2,:)= AmpVertexZChiToChiVZ(2,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(2,gt1,:) 
AmpWaveZChiToChiVZ(3,gt2,:) = AmpWaveZChiToChiVZ(3,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(3,gt1,:) 
AmpVertexZChiToChiVZ(3,gt2,:)= AmpVertexZChiToChiVZ(3,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(3,gt1,:) 
AmpWaveZChiToChiVZ(4,gt2,:) = AmpWaveZChiToChiVZ(4,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(4,gt1,:) 
AmpVertexZChiToChiVZ(4,gt2,:)= AmpVertexZChiToChiVZ(4,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChiVZ=AmpWaveZChiToChiVZ 
AmpVertexChiToChiVZ= AmpVertexZChiToChiVZ
! Final State 1 
AmpWaveZChiToChiVZ=0._dp 
AmpVertexZChiToChiVZ=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToChiVZ(1,:,gt2) = AmpWaveZChiToChiVZ(1,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(1,:,gt1) 
AmpVertexZChiToChiVZ(1,:,gt2)= AmpVertexZChiToChiVZ(1,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(1,:,gt1) 
AmpWaveZChiToChiVZ(2,:,gt2) = AmpWaveZChiToChiVZ(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(2,:,gt1) 
AmpVertexZChiToChiVZ(2,:,gt2)= AmpVertexZChiToChiVZ(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(2,:,gt1) 
AmpWaveZChiToChiVZ(3,:,gt2) = AmpWaveZChiToChiVZ(3,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(3,:,gt1) 
AmpVertexZChiToChiVZ(3,:,gt2)= AmpVertexZChiToChiVZ(3,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(3,:,gt1) 
AmpWaveZChiToChiVZ(4,:,gt2) = AmpWaveZChiToChiVZ(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(4,:,gt1) 
AmpVertexZChiToChiVZ(4,:,gt2)= AmpVertexZChiToChiVZ(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChiVZ=AmpWaveZChiToChiVZ 
AmpVertexChiToChiVZ= AmpVertexZChiToChiVZ
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChiVZ = AmpVertexChiToChiVZ  +  AmpVertexIRosChiToChiVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ 
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ  
Else 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ + AmpWaveChiToChiVZ + AmpVertexChiToChiVZ
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + AmpWaveChiToChiVZ + AmpVertexChiToChiVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChiOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MChi(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = 2._dp*AmpWaveChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = 2._dp*AmpVertexChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChiVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqTreeChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2)  
  AmpSum2ChiToChiVZ = + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2) + AmpSqTreeChiToChiVZ(gt1, gt2)  
Else  
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqTreeChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2)  
  AmpSum2ChiToChiVZ = + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2) + AmpSqTreeChiToChiVZ(gt1, gt2)  
End if  
Else  
  AmpSqChiToChiVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiVZ(gt1, gt2).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MVZOS,helfactor*AmpSqChiToChiVZ(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MChi(gt2),MVZ,helfactor*AmpSqChiToChiVZ(gt1, gt2))
End if 
If ((Abs(MRPChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChiToChiVZ(gt1, gt2) + MRGChiToChiVZ(gt1, gt2)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChiToChiVZ(gt1, gt2) + MRGChiToChiVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fd Conjg(Sd)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToFdcSd(cplChiFdcSdL,cplChiFdcSdR,MChi,MFd,            & 
& MSd,MChi2,MFd2,MSd2,AmpTreeChiToFdcSd)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToFdcSd(ZcplChiFdcSdL,ZcplChiFdcSdR,MChi,              & 
& MFd,MSd,MChi2,MFd2,MSd2,AmpTreeChiToFdcSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFdcSd(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,           & 
& MChiOS,MFdOS,MSdOS,MRPChiToFdcSd,MRGChiToFdcSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFdcSd(MLambda,em,gs,ZcplChiFdcSdL,ZcplChiFdcSdR,         & 
& MChiOS,MFdOS,MSdOS,MRPChiToFdcSd,MRGChiToFdcSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToFdcSd(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,           & 
& MChi,MFd,MSd,MRPChiToFdcSd,MRGChiToFdcSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFdcSd(MLambda,em,gs,ZcplChiFdcSdL,ZcplChiFdcSdR,         & 
& MChi,MFd,MSd,MRPChiToFdcSd,MRGChiToFdcSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToFdcSd(cplChiFdcSdL,cplChiFdcSdR,ctcplChiFdcSdL,      & 
& ctcplChiFdcSdR,MChi,MChi2,MFd,MFd2,MSd,MSd2,ZfFDL,ZfFDR,ZfL0,ZfSd,AmpWaveChiToFdcSd)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,      & 
& cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,   & 
& cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,         & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplFdFdSuL,       & 
& cplFdFdSuR,cplFdFuSdL,cplFdFuSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,cplcFdcFucSdL,     & 
& cplcFdcFucSdR,cplcSdcSdcSu,AmpVertexChiToFdcSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,            & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplFdFdSuL,cplFdFdSuR,cplFdFuSdL,cplFdFuSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,     & 
& cplcFdcFucSdL,cplcFdcFucSdR,cplcSdcSdcSu,AmpVertexIRdrChiToFdcSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFdcSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,ZcplChiFdcSdL,ZcplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplFdFdSuL,cplFdFdSuR,cplFdFuSdL,           & 
& cplFdFuSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,      & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,cplcFdcFucSdL,cplcFdcFucSdR,  & 
& cplcSdcSdcSu,AmpVertexIRosChiToFdcSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,            & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& ZcplChiFdcSdL,ZcplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplFdFdSuL,cplFdFdSuR,cplFdFuSdL,cplFdFuSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,     & 
& cplcFdcFucSdL,cplcFdcFucSdR,cplcSdcSdcSu,AmpVertexIRosChiToFdcSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFdcSd(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplFdFdSuL,cplFdFdSuR,cplFdFuSdL,           & 
& cplFdFuSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,      & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,cplcFdcFucSdL,cplcFdcFucSdR,  & 
& cplcSdcSdcSu,AmpVertexIRosChiToFdcSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,            & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplFdFdSuL,cplFdFdSuR,cplFdFuSdL,cplFdFuSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,     & 
& cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSucSdVWm,     & 
& cplcFdcFucSdL,cplcFdcFucSdR,cplcSdcSdcSu,AmpVertexIRosChiToFdcSd)

 End if 
 End if 
AmpVertexChiToFdcSd = AmpVertexChiToFdcSd -  AmpVertexIRdrChiToFdcSd! +  AmpVertexIRosChiToFdcSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToFdcSd(1,gt2,:,:) = AmpWaveZChiToFdcSd(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFdcSd(1,gt1,:,:) 
AmpVertexZChiToFdcSd(1,gt2,:,:)= AmpVertexZChiToFdcSd(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFdcSd(1,gt1,:,:) 
AmpWaveZChiToFdcSd(2,gt2,:,:) = AmpWaveZChiToFdcSd(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFdcSd(2,gt1,:,:) 
AmpVertexZChiToFdcSd(2,gt2,:,:)= AmpVertexZChiToFdcSd(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFdcSd(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
! Final State 1 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFdcSd(1,:,gt2,:) = AmpWaveZChiToFdcSd(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpWaveChiToFdcSd(1,:,gt1,:) 
AmpVertexZChiToFdcSd(1,:,gt2,:)= AmpVertexZChiToFdcSd(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpVertexChiToFdcSd(1,:,gt1,:) 
AmpWaveZChiToFdcSd(2,:,gt2,:) = AmpWaveZChiToFdcSd(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpWaveChiToFdcSd(2,:,gt1,:) 
AmpVertexZChiToFdcSd(2,:,gt2,:)= AmpVertexZChiToFdcSd(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpVertexChiToFdcSd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
! Final State 2 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFdcSd(:,:,:,gt2) = AmpWaveZChiToFdcSd(:,:,:,gt2)+ZRUZDc(gt2,gt1)*AmpWaveChiToFdcSd(:,:,:,gt1) 
AmpVertexZChiToFdcSd(:,:,:,gt2)= AmpVertexZChiToFdcSd(:,:,:,gt2)+ZRUZDc(gt2,gt1)*AmpVertexChiToFdcSd(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFdcSd = AmpVertexChiToFdcSd  +  AmpVertexIRosChiToFdcSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fd conj[Sd] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd 
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd  
Else 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd + AmpWaveChiToFdcSd + AmpVertexChiToFdcSd
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + AmpWaveChiToFdcSd + AmpVertexChiToFdcSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChiOS(gt1).gt.(MFdOS(gt2)+MSdOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MFd(gt2)+MSd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = 2._dp*AmpWaveChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = 2._dp*AmpVertexChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqTreeChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3)  
  AmpSum2ChiToFdcSd = + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3) + AmpSqTreeChiToFdcSd(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqTreeChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3)  
  AmpSum2ChiToFdcSd = + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3) + AmpSqTreeChiToFdcSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFdcSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFdcSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),helfactor*AmpSqChiToFdcSd(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChi(gt1),MFd(gt2),MSd(gt3),helfactor*AmpSqChiToFdcSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFdcSd(gt1, gt2, gt3) + MRGChiToFdcSd(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFdcSd(gt1, gt2, gt3) + MRGChiToFdcSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe Conjg(Se)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToFecSe(cplChiFecSeL,cplChiFecSeR,MChi,MFe,            & 
& MSe,MChi2,MFe2,MSe2,AmpTreeChiToFecSe)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToFecSe(ZcplChiFecSeL,ZcplChiFecSeR,MChi,              & 
& MFe,MSe,MChi2,MFe2,MSe2,AmpTreeChiToFecSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFecSe(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,           & 
& MChiOS,MFeOS,MSeOS,MRPChiToFecSe,MRGChiToFecSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFecSe(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,         & 
& MChiOS,MFeOS,MSeOS,MRPChiToFecSe,MRGChiToFecSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToFecSe(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,           & 
& MChi,MFe,MSe,MRPChiToFecSe,MRGChiToFecSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFecSe(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,         & 
& MChi,MFe,MSe,MRPChiToFecSe,MRGChiToFecSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToFecSe(cplChiFecSeL,cplChiFecSeR,ctcplChiFecSeL,      & 
& ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,AmpWaveChiToFecSe)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToFecSe(MAh,MCha,MChi,MFe,Mhh,MHpm,MSe,              & 
& MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,Mhh2,MHpm2,MSe2,MSv2,MVP2,MVWm2,MVZ2,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,         & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSvcSeVWm,AmpVertexChiToFecSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFecSe(MAh,MCha,MChi,MFe,Mhh,MHpm,               & 
& MSe,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,Mhh2,MHpm2,MSe2,MSv2,MVP2,MVWm2,            & 
& MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,         & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSvcSeVWm,AmpVertexIRdrChiToFecSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFecSe(MAhOS,MChaOS,MChiOS,MFeOS,MhhOS,          & 
& MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFe2OS,Mhh2OS,              & 
& MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& ZcplChiFecSeL,ZcplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSvcSeVWm,AmpVertexIRosChiToFecSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFecSe(MAh,MCha,MChi,MFe,Mhh,MHpm,               & 
& MSe,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,Mhh2,MHpm2,MSe2,MSv2,MVP2,MVWm2,            & 
& MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,ZcplChiFecSeL,ZcplChiFecSeR,cplChiFvcSvL,       & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,         & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSvcSeVWm,AmpVertexIRosChiToFecSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFecSe(MAhOS,MChaOS,MChiOS,MFeOS,MhhOS,          & 
& MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,MFe2OS,Mhh2OS,              & 
& MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSvcSeVWm,AmpVertexIRosChiToFecSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFecSe(MAh,MCha,MChi,MFe,Mhh,MHpm,               & 
& MSe,MSv,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFe2,Mhh2,MHpm2,MSe2,MSv2,MVP2,MVWm2,            & 
& MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,        & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,         & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSvcSeVWm,AmpVertexIRosChiToFecSe)

 End if 
 End if 
AmpVertexChiToFecSe = AmpVertexChiToFecSe -  AmpVertexIRdrChiToFecSe! +  AmpVertexIRosChiToFecSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToFecSe(1,gt2,:,:) = AmpWaveZChiToFecSe(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFecSe(1,gt1,:,:) 
AmpVertexZChiToFecSe(1,gt2,:,:)= AmpVertexZChiToFecSe(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFecSe(1,gt1,:,:) 
AmpWaveZChiToFecSe(2,gt2,:,:) = AmpWaveZChiToFecSe(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFecSe(2,gt1,:,:) 
AmpVertexZChiToFecSe(2,gt2,:,:)= AmpVertexZChiToFecSe(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFecSe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
! Final State 1 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFecSe(1,:,gt2,:) = AmpWaveZChiToFecSe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveChiToFecSe(1,:,gt1,:) 
AmpVertexZChiToFecSe(1,:,gt2,:)= AmpVertexZChiToFecSe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexChiToFecSe(1,:,gt1,:) 
AmpWaveZChiToFecSe(2,:,gt2,:) = AmpWaveZChiToFecSe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveChiToFecSe(2,:,gt1,:) 
AmpVertexZChiToFecSe(2,:,gt2,:)= AmpVertexZChiToFecSe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexChiToFecSe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
! Final State 2 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFecSe(:,:,:,gt2) = AmpWaveZChiToFecSe(:,:,:,gt2)+ZRUZEc(gt2,gt1)*AmpWaveChiToFecSe(:,:,:,gt1) 
AmpVertexZChiToFecSe(:,:,:,gt2)= AmpVertexZChiToFecSe(:,:,:,gt2)+ZRUZEc(gt2,gt1)*AmpVertexChiToFecSe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFecSe = AmpVertexChiToFecSe  +  AmpVertexIRosChiToFecSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fe conj[Se] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFecSe = AmpTreeChiToFecSe 
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe  
Else 
 AmpSumChiToFecSe = AmpTreeChiToFecSe + AmpWaveChiToFecSe + AmpVertexChiToFecSe
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe + AmpWaveChiToFecSe + AmpVertexChiToFecSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFecSe = AmpTreeChiToFecSe
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChiOS(gt1).gt.(MFeOS(gt2)+MSeOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MFe(gt2)+MSe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = 2._dp*AmpWaveChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = 2._dp*AmpVertexChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFecSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqTreeChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3)  
  AmpSum2ChiToFecSe = + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3) + AmpSqTreeChiToFecSe(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqTreeChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3)  
  AmpSum2ChiToFecSe = + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3) + AmpSqTreeChiToFecSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFecSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFecSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),helfactor*AmpSqChiToFecSe(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MFe(gt2),MSe(gt3),helfactor*AmpSqChiToFecSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFecSe(gt1, gt2, gt3) + MRGChiToFecSe(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFecSe(gt1, gt2, gt3) + MRGChiToFecSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fu Conjg(Su)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToFucSu(cplChiFucSuL,cplChiFucSuR,MChi,MFu,            & 
& MSu,MChi2,MFu2,MSu2,AmpTreeChiToFucSu)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToFucSu(ZcplChiFucSuL,ZcplChiFucSuR,MChi,              & 
& MFu,MSu,MChi2,MFu2,MSu2,AmpTreeChiToFucSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFucSu(MLambda,em,gs,cplChiFucSuL,cplChiFucSuR,           & 
& MChiOS,MFuOS,MSuOS,MRPChiToFucSu,MRGChiToFucSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFucSu(MLambda,em,gs,ZcplChiFucSuL,ZcplChiFucSuR,         & 
& MChiOS,MFuOS,MSuOS,MRPChiToFucSu,MRGChiToFucSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToFucSu(MLambda,em,gs,cplChiFucSuL,cplChiFucSuR,           & 
& MChi,MFu,MSu,MRPChiToFucSu,MRGChiToFucSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFucSu(MLambda,em,gs,ZcplChiFucSuL,ZcplChiFucSuR,         & 
& MChi,MFu,MSu,MRPChiToFucSu,MRGChiToFucSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToFucSu(cplChiFucSuL,cplChiFucSuR,ctcplChiFucSuL,      & 
& ctcplChiFucSuR,MChi,MChi2,MFu,MFu2,MSu,MSu2,ZfFUL,ZfFUR,ZfL0,ZfSu,AmpWaveChiToFucSu)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,              & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,MHpm2,             & 
& MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,cplcFuFuAhR,      & 
& cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,   & 
& cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,         & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplFdFuSdL,       & 
& cplFdFuSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,          & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplhhSucSu,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplcFdcFdcSuL,              & 
& cplcFdcFdcSuR,cplcSdcSdcSu,AmpVertexChiToFucSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,            & 
& cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplFdFuSdL,cplFdFuSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplcFdcFdcSuL,   & 
& cplcFdcFdcSuR,cplcSdcSdcSu,AmpVertexIRdrChiToFucSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFucSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,ZcplChiFucSuL,        & 
& ZcplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,    & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplFdFuSdL,cplFdFuSdR,cplcChaFdcSuL,        & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,             & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplcFdcFdcSuL,cplcFdcFdcSuR,cplcSdcSdcSu,             & 
& AmpVertexIRosChiToFucSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,            & 
& cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,ZcplChiFucSuL,ZcplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplFdFuSdL,cplFdFuSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplcFdcFdcSuL,   & 
& cplcFdcFdcSuR,cplcSdcSdcSu,AmpVertexIRosChiToFucSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFucSu(MAhOS,MChaOS,MChiOS,MFdOS,MFuOS,          & 
& MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MChi2OS,           & 
& MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,           & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,         & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplFdFuSdL,cplFdFuSdR,cplcChaFdcSuL,        & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,             & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplcFdcFdcSuL,cplcFdcFdcSuR,cplcSdcSdcSu,             & 
& AmpVertexIRosChiToFucSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,               & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,            & 
& cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplFdFuSdL,cplFdFuSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplcFdcFdcSuL,   & 
& cplcFdcFdcSuR,cplcSdcSdcSu,AmpVertexIRosChiToFucSu)

 End if 
 End if 
AmpVertexChiToFucSu = AmpVertexChiToFucSu -  AmpVertexIRdrChiToFucSu! +  AmpVertexIRosChiToFucSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToFucSu(1,gt2,:,:) = AmpWaveZChiToFucSu(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFucSu(1,gt1,:,:) 
AmpVertexZChiToFucSu(1,gt2,:,:)= AmpVertexZChiToFucSu(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFucSu(1,gt1,:,:) 
AmpWaveZChiToFucSu(2,gt2,:,:) = AmpWaveZChiToFucSu(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFucSu(2,gt1,:,:) 
AmpVertexZChiToFucSu(2,gt2,:,:)= AmpVertexZChiToFucSu(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFucSu(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
! Final State 1 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFucSu(1,:,gt2,:) = AmpWaveZChiToFucSu(1,:,gt2,:)+ZRUZUL(gt2,gt1)*AmpWaveChiToFucSu(1,:,gt1,:) 
AmpVertexZChiToFucSu(1,:,gt2,:)= AmpVertexZChiToFucSu(1,:,gt2,:)+ZRUZUL(gt2,gt1)*AmpVertexChiToFucSu(1,:,gt1,:) 
AmpWaveZChiToFucSu(2,:,gt2,:) = AmpWaveZChiToFucSu(2,:,gt2,:)+ZRUZURc(gt2,gt1)*AmpWaveChiToFucSu(2,:,gt1,:) 
AmpVertexZChiToFucSu(2,:,gt2,:)= AmpVertexZChiToFucSu(2,:,gt2,:)+ZRUZURc(gt2,gt1)*AmpVertexChiToFucSu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
! Final State 2 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFucSu(:,:,:,gt2) = AmpWaveZChiToFucSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpWaveChiToFucSu(:,:,:,gt1) 
AmpVertexZChiToFucSu(:,:,:,gt2)= AmpVertexZChiToFucSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpVertexChiToFucSu(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFucSu = AmpVertexChiToFucSu  +  AmpVertexIRosChiToFucSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fu conj[Su] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFucSu = AmpTreeChiToFucSu 
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu  
Else 
 AmpSumChiToFucSu = AmpTreeChiToFucSu + AmpWaveChiToFucSu + AmpVertexChiToFucSu
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu + AmpWaveChiToFucSu + AmpVertexChiToFucSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFucSu = AmpTreeChiToFucSu
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(MChiOS(gt1).gt.(MFuOS(gt2)+MSuOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MFu(gt2)+MSu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = 2._dp*AmpWaveChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = 2._dp*AmpVertexChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFucSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqTreeChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3)  
  AmpSum2ChiToFucSu = + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3) + AmpSqTreeChiToFucSu(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqTreeChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3)  
  AmpSum2ChiToFucSu = + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3) + AmpSqTreeChiToFucSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFucSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFucSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),helfactor*AmpSqChiToFucSu(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChi(gt1),MFu(gt2),MSu(gt3),helfactor*AmpSqChiToFucSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFucSu(gt1, gt2, gt3) + MRGChiToFucSu(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFucSu(gt1, gt2, gt3) + MRGChiToFucSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Conjg(Sv)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_MSSMBpV_ChiToFvcSv(cplChiFvcSvL,cplChiFvcSvR,MChi,MSv,            & 
& MChi2,MSv2,AmpTreeChiToFvcSv)

  Else 
Call Amplitude_Tree_MSSMBpV_ChiToFvcSv(ZcplChiFvcSvL,ZcplChiFvcSvR,MChi,              & 
& MSv,MChi2,MSv2,AmpTreeChiToFvcSv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFvcSv(MLambda,em,gs,cplChiFvcSvL,cplChiFvcSvR,           & 
& MChiOS,MSvOS,MRPChiToFvcSv,MRGChiToFvcSv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFvcSv(MLambda,em,gs,ZcplChiFvcSvL,ZcplChiFvcSvR,         & 
& MChiOS,MSvOS,MRPChiToFvcSv,MRGChiToFvcSv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_MSSMBpV_ChiToFvcSv(MLambda,em,gs,cplChiFvcSvL,cplChiFvcSvR,           & 
& MChi,MSv,MRPChiToFvcSv,MRGChiToFvcSv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_MSSMBpV_ChiToFvcSv(MLambda,em,gs,ZcplChiFvcSvL,ZcplChiFvcSvR,         & 
& MChi,MSv,MRPChiToFvcSv,MRGChiToFvcSv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToFvcSv(cplChiFvcSvL,cplChiFvcSvR,ctcplChiFvcSvL,      & 
& ctcplChiFvcSvR,MChi,MChi2,MSv,MSv2,ZfFvL,ZfL0,ZfSv,AmpWaveChiToFvcSv)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToFvcSv(MCha,MChi,MFe,Mhh,MHpm,MSe,MSv,              & 
& MVWm,MVZ,MCha2,MChi2,MFe2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,MVZ2,cplChiChacHpmL,              & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFeFvHpmL,   & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplhhSvcSv,             & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,AmpVertexChiToFvcSv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFvcSv(MCha,MChi,MFe,Mhh,MHpm,MSe,               & 
& MSv,MVWm,MVZ,MCha2,MChi2,MFe2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,MVZ2,cplChiChacHpmL,          & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFeFvHpmL,   & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplhhSvcSv,             & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,AmpVertexIRdrChiToFvcSv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFvcSv(MChaOS,MChiOS,MFeOS,MhhOS,MHpmOS,         & 
& MSeOS,MSvOS,MVWmOS,MVZOS,MCha2OS,MChi2OS,MFe2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,          & 
& MVWm2OS,MVZ2OS,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,            & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,ZcplChiFvcSvL,ZcplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,       & 
& cplcFvFvVZL,cplcFvFvVZR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,               & 
& AmpVertexIRosChiToFvcSv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFvcSv(MCha,MChi,MFe,Mhh,MHpm,MSe,               & 
& MSv,MVWm,MVZ,MCha2,MChi2,MFe2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,MVZ2,cplChiChacHpmL,          & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,ZcplChiFvcSvL,        & 
& ZcplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,    & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFeFvHpmL,   & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplhhSvcSv,             & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,AmpVertexIRosChiToFvcSv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFvcSv(MChaOS,MChiOS,MFeOS,MhhOS,MHpmOS,         & 
& MSeOS,MSvOS,MVWmOS,MVZOS,MCha2OS,MChi2OS,MFe2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,          & 
& MVWm2OS,MVZ2OS,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,            & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,       & 
& cplcFvFvVZL,cplcFvFvVZR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,               & 
& AmpVertexIRosChiToFvcSv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_MSSMBpV_ChiToFvcSv(MCha,MChi,MFe,Mhh,MHpm,MSe,               & 
& MSv,MVWm,MVZ,MCha2,MChi2,MFe2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,MVZ2,cplChiChacHpmL,          & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFeFvHpmL,   & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplhhSvcSv,             & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,AmpVertexIRosChiToFvcSv)

 End if 
 End if 
AmpVertexChiToFvcSv = AmpVertexChiToFvcSv -  AmpVertexIRdrChiToFvcSv! +  AmpVertexIRosChiToFvcSv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFvcSv=0._dp 
AmpVertexZChiToFvcSv=0._dp 
Do gt1=1,4
  Do gt2=1,4
AmpWaveZChiToFvcSv(1,gt2,:,:) = AmpWaveZChiToFvcSv(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFvcSv(1,gt1,:,:) 
AmpVertexZChiToFvcSv(1,gt2,:,:)= AmpVertexZChiToFvcSv(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFvcSv(1,gt1,:,:) 
AmpWaveZChiToFvcSv(2,gt2,:,:) = AmpWaveZChiToFvcSv(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFvcSv(2,gt1,:,:) 
AmpVertexZChiToFvcSv(2,gt2,:,:)= AmpVertexZChiToFvcSv(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFvcSv(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFvcSv=AmpWaveZChiToFvcSv 
AmpVertexChiToFvcSv= AmpVertexZChiToFvcSv
! Final State 2 
AmpWaveZChiToFvcSv=0._dp 
AmpVertexZChiToFvcSv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFvcSv(:,:,:,gt2) = AmpWaveZChiToFvcSv(:,:,:,gt2)+ZRUZVc(gt2,gt1)*AmpWaveChiToFvcSv(:,:,:,gt1) 
AmpVertexZChiToFvcSv(:,:,:,gt2)= AmpVertexZChiToFvcSv(:,:,:,gt2)+ZRUZVc(gt2,gt1)*AmpVertexChiToFvcSv(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFvcSv=AmpWaveZChiToFvcSv 
AmpVertexChiToFvcSv= AmpVertexZChiToFvcSv
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFvcSv = AmpVertexChiToFvcSv  +  AmpVertexIRosChiToFvcSv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fv conj[Sv] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFvcSv = AmpTreeChiToFvcSv 
 AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv + 2._dp*AmpWaveChiToFvcSv + 2._dp*AmpVertexChiToFvcSv  
Else 
 AmpSumChiToFvcSv = AmpTreeChiToFvcSv + AmpWaveChiToFvcSv + AmpVertexChiToFvcSv
 AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv + AmpWaveChiToFvcSv + AmpVertexChiToFvcSv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFvcSv = AmpTreeChiToFvcSv
 AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv 
End if 
Do gt1=1,4
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MChiOS(gt1).gt.(0.+MSvOS(gt3)))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(0.+MSv(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),0._dp,MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),0._dp,MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFvcSv(gt1, gt2, gt3) 
  AmpSum2ChiToFvcSv = 2._dp*AmpWaveChiToFvcSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),0._dp,MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),0._dp,MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFvcSv(gt1, gt2, gt3) 
  AmpSum2ChiToFvcSv = 2._dp*AmpVertexChiToFvcSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),0._dp,MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),0._dp,MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFvcSv(gt1, gt2, gt3) 
  AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv + 2._dp*AmpWaveChiToFvcSv + 2._dp*AmpVertexChiToFvcSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),0._dp,MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),0._dp,MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFvcSv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv
  Call SquareAmp_FtoFS(MChiOS(gt1),0._dp,MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
  AmpSqTreeChiToFvcSv(gt1, gt2, gt3) = AmpSqChiToFvcSv(gt1, gt2, gt3)  
  AmpSum2ChiToFvcSv = + 2._dp*AmpWaveChiToFvcSv + 2._dp*AmpVertexChiToFvcSv
  Call SquareAmp_FtoFS(MChiOS(gt1),0._dp,MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
  AmpSqChiToFvcSv(gt1, gt2, gt3) = AmpSqChiToFvcSv(gt1, gt2, gt3) + AmpSqTreeChiToFvcSv(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv
  Call SquareAmp_FtoFS(MChi(gt1),0._dp,MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
  AmpSqTreeChiToFvcSv(gt1, gt2, gt3) = AmpSqChiToFvcSv(gt1, gt2, gt3)  
  AmpSum2ChiToFvcSv = + 2._dp*AmpWaveChiToFvcSv + 2._dp*AmpVertexChiToFvcSv
  Call SquareAmp_FtoFS(MChi(gt1),0._dp,MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
  AmpSqChiToFvcSv(gt1, gt2, gt3) = AmpSqChiToFvcSv(gt1, gt2, gt3) + AmpSqTreeChiToFvcSv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFvcSv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFvcSv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),0._dp,MSvOS(gt3),helfactor*AmpSqChiToFvcSv(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),0._dp,MSv(gt3),helfactor*AmpSqChiToFvcSv(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFvcSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFvcSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFvcSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFvcSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFvcSv(gt1, gt2, gt3) + MRGChiToFvcSv(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFvcSv(gt1, gt2, gt3) + MRGChiToFvcSv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.4) isave = i4 
End do
End If 
!---------------- 
! Chi VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_MSSMBpV_ChiToChiVP(ZcplChiChiVZL,ZcplChiChiVZR,ctcplChiChiVZL,    & 
& ctcplChiChiVZR,MChiOS,MChi2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfL0,ZfVP,ZfVZVP,AmpWaveChiToChiVP)

 Else 
Call Amplitude_WAVE_MSSMBpV_ChiToChiVP(cplChiChiVZL,cplChiChiVZR,ctcplChiChiVZL,      & 
& ctcplChiChiVZR,MChiOS,MChi2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfL0,ZfVP,ZfVZVP,AmpWaveChiToChiVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMBpV_ChiToChiVP(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,              & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,ZcplChiChacHpmL,ZcplChiChacHpmR,             & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplChiFdcSdL,           & 
& ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplcChaChiHpmL, & 
& ZcplcChaChiHpmR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFeChiSeL,ZcplcFeChiSeR,               & 
& ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVPL,              & 
& ZcplcFdFdVPR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplHpmcHpmVP,        & 
& ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplSecSeVP,ZcplSucSuVP,ZcplcHpmVPVWm,ZcplcVWmVPVWm,         & 
& AmpVertexChiToChiVP)

 Else 
Call Amplitude_VERTEX_MSSMBpV_ChiToChiVP(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,              & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplChiFdcSdL,cplChiFdcSdR,   & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFuFuVPL,cplcFuFuVPR,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,               & 
& cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChiToChiVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_MSSMBpV_ChiToChiVP(cplChiChiVZL,cplChiChiVZR,ctcplChiChiVZL,      & 
& ctcplChiChiVZR,MChi,MChi2,MVP,MVP2,MVZ,MVZ2,ZfL0,ZfVP,ZfVZVP,AmpWaveChiToChiVP)



!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToChiVP(MCha,MChi,MFd,MFe,MFu,MHpm,MSd,              & 
& MSe,MSu,MVP,MVWm,MCha2,MChi2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,MVP2,MVWm2,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,             & 
& cplcChaChaVPR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplHpmcHpmVP,              & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& AmpVertexChiToChiVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiVP = 0._dp 
 AmpSum2ChiToChiVP = 0._dp  
Else 
 AmpSumChiToChiVP = AmpVertexChiToChiVP + AmpWaveChiToChiVP
 AmpSum2ChiToChiVP = AmpVertexChiToChiVP + AmpWaveChiToChiVP 
End If 
Do gt1=1,4
i4 = isave 
  Do gt2=1,4
If (((OSkinematics).and.(MChiOS(gt1).gt.(MChiOS(gt2)+0.))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MChi(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),0._dp,AmpSumChiToChiVP(:,gt1, gt2),AmpSum2ChiToChiVP(:,gt1, gt2),AmpSqChiToChiVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVP,AmpSumChiToChiVP(:,gt1, gt2),AmpSum2ChiToChiVP(:,gt1, gt2),AmpSqChiToChiVP(gt1, gt2)) 
End if  
Else  
  AmpSqChiToChiVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiVP(gt1, gt2).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),0._dp,helfactor*AmpSqChiToChiVP(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 1._dp*GammaTPS(MChi(gt1),MChi(gt2),MVP,helfactor*AmpSqChiToChiVP(gt1, gt2))
End if 
If ((Abs(MRPChiToChiVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.4) isave = i4 
End do
!---------------- 
! Glu VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_MSSMBpV_ChiToGluVG(MChiOS,MFdOS,MFuOS,MGluOS,MSdOS,             & 
& MSuOS,MVG,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,MVG2,ZcplChiFdcSdL,              & 
& ZcplChiFdcSdR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFuChiSuL,   & 
& ZcplcFuChiSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplGluFucSuL,     & 
& ZcplGluFucSuR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuGluSuL,     & 
& ZcplcFuGluSuR,ZcplSdcSdVG,ZcplSucSuVG,AmpVertexChiToGluVG)

 Else 
Call Amplitude_VERTEX_MSSMBpV_ChiToGluVG(MChiOS,MFdOS,MFuOS,MGluOS,MSdOS,             & 
& MSuOS,MVG,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,MVG2,cplChiFdcSdL,               & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplGluFucSuL,           & 
& cplGluFucSuR,cplcFuFuVGL,cplcFuFuVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,           & 
& cplcFuGluSuR,cplSdcSdVG,cplSucSuVG,AmpVertexChiToGluVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_MSSMBpV_ChiToGluVG(MChi,MFd,MFu,MGlu,MSd,MSu,MVG,               & 
& MChi2,MFd2,MFu2,MGlu2,MSd2,MSu2,MVG2,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,           & 
& cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplSdcSdVG,            & 
& cplSucSuVG,AmpVertexChiToGluVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Glu VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToGluVG = 0._dp 
 AmpSum2ChiToGluVG = 0._dp  
Else 
 AmpSumChiToGluVG = AmpVertexChiToGluVG + AmpWaveChiToGluVG
 AmpSum2ChiToGluVG = AmpVertexChiToGluVG + AmpWaveChiToGluVG 
End If 
Do gt1=1,4
i4 = isave 
If (((OSkinematics).and.(MChiOS(gt1).gt.(MGluOS+0.))).or.((.not.OSkinematics).and.(MChi(gt1).gt.(MGlu+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MGluOS,0._dp,AmpSumChiToGluVG(:,gt1),AmpSum2ChiToGluVG(:,gt1),AmpSqChiToGluVG(gt1)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MGlu,MVG,AmpSumChiToGluVG(:,gt1),AmpSum2ChiToGluVG(:,gt1),AmpSqChiToGluVG(gt1)) 
End if  
Else  
  AmpSqChiToGluVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToGluVG(gt1).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 8._dp*GammaTPS(MChiOS(gt1),MGluOS,0._dp,helfactor*AmpSqChiToGluVG(gt1))
Else 
  gP1LChi(gt1,i4) = 8._dp*GammaTPS(MChi(gt1),MGlu,MVG,helfactor*AmpSqChiToGluVG(gt1))
End if 
If ((Abs(MRPChiToGluVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGChiToGluVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.4) isave = i4 
End do
End Subroutine OneLoopDecay_Chi

End Module Wrapper_OneLoopDecay_Chi_MSSMBpV
