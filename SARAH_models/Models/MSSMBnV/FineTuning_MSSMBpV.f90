! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 12:56 on 25.1.2018   
! ----------------------------------------------------------------------  
 
 
Module FineTuning_MSSMBpV 
 
Use Control 
Use Settings 
Use LoopFunctions 
Use Mathematics 
Use Model_Data_MSSMBpV 
Use RGEs_MSSMBpV 
Use LoopMasses_MSSMBpV 
Use TreeLevelMasses_MSSMBpV 
Use Couplings_MSSMBpV 
Use Tadpoles_MSSMBpV 
 Use StandardModel 
 
Contains 

Subroutine FineTuning(g1input,g2input,g3input,Ydinput,Yeinput,L3input,Yuinput,        & 
& Muinput,Tdinput,Teinput,T3input,Tuinput,Bmuinput,mq2input,ml2input,mHd2input,          & 
& mHu2input,md2input,mu2input,me2input,M1input,M2input,M3input,vdinput,vuinput,          & 
& mGut,kont)

Implicit None 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,vdinput,vuinput

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L3input(3,3,3),Yuinput(3,3),Muinput,Tdinput(3,3),           & 
& Teinput(3,3),T3input(3,3,3),Tuinput(3,3),Bmuinput,mq2input(3,3),ml2input(3,3),         & 
& md2input(3,3),mu2input(3,3),me2input(3,3),M1input,M2input,M3input

Real(dp), Intent(in) :: mGUT 
Integer, Intent(inout) :: kont 
Integer :: i1, j, Fpar 
Real(dp) :: delta0,gA(321), gB(321), gC(323), gRef(321), gDiff(321)
Real(dp) :: MZ2ref, MZ2current, variation, stepsize, dt, tz, factor 
Real(dp) :: vdref, vuref, maxdiff 
Real(dp) :: m_lo, m_hi 
Logical :: NumericalProblem, GenerationMixingSave 
Real(dp) :: g1,g2,g3,mHd2,mHu2,vd,vu

Complex(dp) :: Yd(3,3),Ye(3,3),L3(3,3,3),Yu(3,3),Mu,Td(3,3),Te(3,3),T3(3,3,3),Tu(3,3),               & 
& Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),M1,M2,M3

Complex(dp) :: Tad1Loop(2), Tadpoles_Save(2), dmz2, mudim 

Real(dp) :: MAh(2),MAh2(2),MCha(2),MCha2(2),MChi(4),MChi2(4),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MGlu,MGlu2,Mhh(2),Mhh2(2),MHpm(2),MHpm2(2),MSd(6),              & 
& MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(3),MSv2(3),MVWm,MVWm2,MVZ,MVZ2,              & 
& TW,v,ZA(2,2),ZH(2,2),ZP(2,2),ZZ(2,2),alphaH,betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),               & 
& ZN(4,4),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(3,3),ZW(2,2)

Complex(dp) :: cplAhAhcVWmVWm(2,2),cplAhAhUhh(2,2,2),cplAhAhUhhUhh(2,2,2,2),cplAhAhUHpmcUHpm(2,2,2,2),& 
& cplAhAhUSdcUSd(2,2,6,6),cplAhAhUSecUSe(2,2,6,6),cplAhAhUSucUSu(2,2,6,6),               & 
& cplAhAhUSvcUSv(2,2,3,3),cplAhAhVZVZ(2,2),cplAhcUHpmVWm(2,2),cplAhhhVZ(2,2),            & 
& cplAhHpmcUHpm(2,2,2),cplAhHpmcVWm(2,2),cplAhSdcUSd(2,6,6),cplAhSecUSe(2,6,6),          & 
& cplAhSucUSu(2,6,6),cplAhUhhVZ(2,2),cplcChaChaUAhL(2,2,2),cplcChaChaUAhR(2,2,2),        & 
& cplcChaChaUhhL(2,2,2),cplcChaChaUhhR(2,2,2),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6),     & 
& cplcChacUFvSeL(2,3,6),cplcChacUFvSeR(2,3,6),cplcChaFdcUSuL(2,3,6),cplcChaFdcUSuR(2,3,6),& 
& cplcChaFecUSvL(2,3,3),cplcChaFecUSvR(2,3,3),cplcChaUChiHpmL(2,4,2),cplcChaUChiHpmR(2,4,2),& 
& cplcChaUChiVWmL(2,4),cplcChaUChiVWmR(2,4),cplcFdcFdcUSuL(3,3,6),cplcFdcFdcUSuR(3,3,6), & 
& cplcFdcFucUSdL(3,3,6),cplcFdcFucUSdR(3,3,6),cplcFdcUFucSdL(3,3,6),cplcFdcUFucSdR(3,3,6),& 
& cplcFdFdUAhL(3,3,2),cplcFdFdUAhR(3,3,2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),       & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFdUChiSdL(3,4,6),             & 
& cplcFdUChiSdR(3,4,6),cplcFeFeUAhL(3,3,2),cplcFeFeUAhR(3,3,2),cplcFeFeUhhL(3,3,2),      & 
& cplcFeFeUhhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeUChiSeL(3,4,6),cplcFeUChiSeR(3,4,6),cplcFuFdcUHpmL(3,3,2),cplcFuFdcUHpmR(3,3,2), & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuUAhL(3,3,2),cplcFuFuUAhR(3,3,2),         & 
& cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),             & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6), & 
& cplcFuGluSuR(3,6),cplcFuUChiSuL(3,4,6),cplcFuUChiSuR(3,4,6),cplcFvFecUHpmL(3,3,2),     & 
& cplcFvFecUHpmR(3,3,2),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFvFvVZL(3,3),          & 
& cplcFvFvVZR(3,3),cplcFvUChiSvL(3,4,3),cplcFvUChiSvR(3,4,3),cplcgAgWmcVWm,              & 
& cplcgGgGVG,cplcgWmgWmUAh(2),cplcgWmgWmUhh(2),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgZUHpm(2),& 
& cplcgWpCgAcVWm,cplcgWpCgWpCUAh(2),cplcgWpCgWpCUhh(2),cplcgWpCgWpCVP,cplcgWpCgWpCVZ,    & 
& cplcgWpCgZcUHpm(2),cplcgWpCgZcVWm,cplcgZgWmcUHpm(2),cplcgZgWmcVWm,cplcgZgWpCUHpm(2),   & 
& cplcgZgZUhh(2),cplChaFucUSdL(2,3,6),cplChaFucUSdR(2,3,6),cplChaFvcUSeL(2,3,6),         & 
& cplChaFvcUSeR(2,3,6),cplChiChacUHpmL(4,2,2),cplChiChacUHpmR(4,2,2),cplChiChacVWmL(4,2),& 
& cplChiChacVWmR(4,2),cplChiChiUAhL(4,4,2),cplChiChiUAhR(4,4,2),cplChiChiUhhL(4,4,2),    & 
& cplChiChiUhhR(4,4,2),cplChiChiVZL(4,4),cplChiChiVZR(4,4),cplChiFdcUSdL(4,3,6),         & 
& cplChiFdcUSdR(4,3,6),cplChiFecUSeL(4,3,6),cplChiFecUSeR(4,3,6),cplChiFucUSuL(4,3,6),   & 
& cplChiFucUSuR(4,3,6),cplChiFvcUSvL(4,3,3),cplChiFvcUSvR(4,3,3),cplcSdcSdcUSu(6,6,6),   & 
& cplcUChacFuSdL(2,3,6),cplcUChacFuSdR(2,3,6),cplcUChacFvSeL(2,3,6),cplcUChacFvSeR(2,3,6),& 
& cplcUChaChaAhL(2,2,2),cplcUChaChaAhR(2,2,2),cplcUChaChahhL(2,2,2),cplcUChaChahhR(2,2,2),& 
& cplcUChaChaVPL(2,2),cplcUChaChaVPR(2,2),cplcUChaChaVZL(2,2),cplcUChaChaVZR(2,2),       & 
& cplcUChaChiHpmL(2,4,2),cplcUChaChiHpmR(2,4,2),cplcUChaChiVWmL(2,4),cplcUChaChiVWmR(2,4),& 
& cplcUChaFdcSuL(2,3,6),cplcUChaFdcSuR(2,3,6),cplcUChaFecSvL(2,3,3),cplcUChaFecSvR(2,3,3)

Complex(dp) :: cplcUFdcFdcSuL(3,3,6),cplcUFdcFdcSuR(3,3,6),cplcUFdcFucSdL(3,3,6),cplcUFdcFucSdR(3,3,6),& 
& cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),cplcUFdChiSdL(3,4,6),cplcUFdChiSdR(3,4,6),   & 
& cplcUFdFdAhL(3,3,2),cplcUFdFdAhR(3,3,2),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),       & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),         & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6),           & 
& cplcUFeChaSvL(3,2,3),cplcUFeChaSvR(3,2,3),cplcUFeChiSeL(3,4,6),cplcUFeChiSeR(3,4,6),   & 
& cplcUFeFeAhL(3,3,2),cplcUFeFeAhR(3,3,2),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),       & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFvHpmL(3,3,2),cplcUFeFvHpmR(3,3,2),cplcUFeFvVWmL(3,3),cplcUFeFvVWmR(3,3),       & 
& cplcUFuChiSuL(3,4,6),cplcUFuChiSuR(3,4,6),cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2), & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuAhL(3,3,2),cplcUFuFuAhR(3,3,2),       & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),cplcUFvChiSvL(3,4,3),cplcUFvChiSvR(3,4,3),       & 
& cplcUFvFecHpmL(3,3,2),cplcUFvFecHpmR(3,3,2),cplcUFvFecVWmL(3,3),cplcUFvFecVWmR(3,3),   & 
& cplcUFvFvVZL(3,3),cplcUFvFvVZR(3,3),cplcUHpmVPVWm(2),cplcUHpmVWmVZ(2),cplcUSdcSdcSu(6,6,6),& 
& cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmVPVPVWm1,              & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplcVWmVPVWm,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,          & 
& cplcVWmVPVWmVZ3,cplcVWmVWmVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,          & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFdcUSdL(3,6),cplGluFdcUSdR(3,6),             & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplGluFucUSuL(3,6),cplGluFucUSuR(3,6),             & 
& cplGluGluVGL,cplGluGluVGR,cplhhcUHpmVWm(2,2),cplhhcVWmVWm(2),cplhhhhcVWmVWm(2,2),      & 
& cplhhhhUHpmcUHpm(2,2,2,2),cplhhhhUSdcUSd(2,2,6,6),cplhhhhUSecUSe(2,2,6,6),             & 
& cplhhhhUSucUSu(2,2,6,6),cplhhhhUSvcUSv(2,2,3,3),cplhhhhVZVZ(2,2),cplhhHpmcUHpm(2,2,2), & 
& cplhhHpmcVWm(2,2),cplhhSdcUSd(2,6,6),cplhhSecUSe(2,6,6),cplhhSucUSu(2,6,6),            & 
& cplhhSvcUSv(2,3,3),cplhhVZVZ(2),cplHpmcHpmcVWmVWm(2,2),cplHpmcHpmVP(2,2),              & 
& cplHpmcHpmVPVP(2,2),cplHpmcHpmVPVZ(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZVZ(2,2),         & 
& cplHpmcUHpmVP(2,2),cplHpmcUHpmVZ(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmSucUSd(2,6,6),& 
& cplHpmSvcUSe(2,3,6),cplHpmUSdcHpmcUSd(2,6,2,6),cplHpmUSecHpmcUSe(2,6,2,6),             & 
& cplHpmUSucHpmcUSu(2,6,2,6),cplHpmUSvcHpmcUSv(2,3,2,3),cplSdcHpmcUSu(6,2,6),            & 
& cplSdcSdcVWmVWm(6,6),cplSdcSdVG(6,6),cplSdcSdVGVG(6,6),cplSdcSdVP(6,6),cplSdcSdVPVP(6,6),& 
& cplSdcSdVPVZ(6,6),cplSdcSdVZ(6,6),cplSdcSdVZVZ(6,6),cplSdcSucVWm(6,6),cplSdcUHpmcSu(6,2,6),& 
& cplSdcUSdVG(6,6),cplSdcUSdVP(6,6),cplSdcUSdVZ(6,6),cplSdcUSucVWm(6,6),cplSdUSecSdcUSe(6,6,6,6),& 
& cplSdUSucSdcUSu(6,6,6,6),cplSdUSvcSdcUSv(6,3,6,3),cplSecHpmcUSv(6,2,3),cplSecSecVWmVWm(6,6),& 
& cplSecSeVP(6,6),cplSecSeVPVP(6,6),cplSecSeVPVZ(6,6),cplSecSeVZ(6,6),cplSecSeVZVZ(6,6), & 
& cplSecSvcVWm(6,3),cplSecUHpmcSv(6,2,3),cplSecUSeVP(6,6),cplSecUSeVZ(6,6)

Complex(dp) :: cplSecUSvcVWm(6,3),cplSeUSucSecUSu(6,6,6,6),cplSeUSvcSecUSv(6,3,6,3),cplSucSucVWmVWm(6,6),& 
& cplSucSuVG(6,6),cplSucSuVGVG(6,6),cplSucSuVP(6,6),cplSucSuVPVP(6,6),cplSucSuVPVZ(6,6), & 
& cplSucSuVZ(6,6),cplSucSuVZVZ(6,6),cplSucUSdVWm(6,6),cplSucUSuVG(6,6),cplSucUSuVP(6,6), & 
& cplSucUSuVZ(6,6),cplSuUSvcSucUSv(6,3,6,3),cplSvcSvcVWmVWm(3,3),cplSvcSvVZ(3,3),        & 
& cplSvcSvVZVZ(3,3),cplSvcUSeVWm(3,6),cplSvcUSvVZ(3,3),cplUAhAhhh(2,2,2),cplUAhhhVZ(2,2),& 
& cplUAhHpmcHpm(2,2,2),cplUAhHpmcVWm(2,2),cplUAhSdcSd(2,6,6),cplUAhSecSe(2,6,6),         & 
& cplUAhSucSu(2,6,6),cplUAhUAhAhAh(2,2,2,2),cplUAhUAhcVWmVWm(2,2),cplUAhUAhhhhh(2,2,2,2),& 
& cplUAhUAhHpmcHpm(2,2,2,2),cplUAhUAhSdcSd(2,2,6,6),cplUAhUAhSecSe(2,2,6,6),             & 
& cplUAhUAhSucSu(2,2,6,6),cplUAhUAhSvcSv(2,2,3,3),cplUAhUAhVZVZ(2,2),cplUChiChacHpmL(4,2,2),& 
& cplUChiChacHpmR(4,2,2),cplUChiChacVWmL(4,2),cplUChiChacVWmR(4,2),cplUChiChiAhL(4,4,2), & 
& cplUChiChiAhR(4,4,2),cplUChiChihhL(4,4,2),cplUChiChihhR(4,4,2),cplUChiChiVZL(4,4),     & 
& cplUChiChiVZR(4,4),cplUChiFdcSdL(4,3,6),cplUChiFdcSdR(4,3,6),cplUChiFecSeL(4,3,6),     & 
& cplUChiFecSeR(4,3,6),cplUChiFucSuL(4,3,6),cplUChiFucSuR(4,3,6),cplUChiFvcSvL(4,3,3),   & 
& cplUChiFvcSvR(4,3,3),cplUhhcVWmVWm(2),cplUhhhhhh(2,2,2),cplUhhHpmcHpm(2,2,2),          & 
& cplUhhHpmcVWm(2,2),cplUhhSdcSd(2,6,6),cplUhhSecSe(2,6,6),cplUhhSucSu(2,6,6),           & 
& cplUhhSvcSv(2,3,3),cplUhhUhhcVWmVWm(2,2),cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpmcHpm(2,2,2,2),& 
& cplUhhUhhSdcSd(2,2,6,6),cplUhhUhhSecSe(2,2,6,6),cplUhhUhhSucSu(2,2,6,6),               & 
& cplUhhUhhSvcSv(2,2,3,3),cplUhhUhhVZVZ(2,2),cplUhhVZVZ(2),cplUHpmcUHpmcVWmVWm(2,2),     & 
& cplUHpmcUHpmVPVP(2,2),cplUHpmcUHpmVZVZ(2,2),cplUHpmHpmcUHpmcHpm(2,2,2,2),              & 
& cplUHpmSdcUHpmcSd(2,6,2,6),cplUHpmSecUHpmcSe(2,6,2,6),cplUHpmSucUHpmcSu(2,6,2,6),      & 
& cplUHpmSvcUHpmcSv(2,3,2,3),cplUSdcUSdcVWmVWm(6,6),cplUSdcUSdVGVG(6,6),cplUSdcUSdVPVP(6,6),& 
& cplUSdcUSdVZVZ(6,6),cplUSdSdcUSdcSd(6,6,6,6),cplUSdSecUSdcSe(6,6,6,6),cplUSdSucUSdcSu(6,6,6,6),& 
& cplUSdSvcUSdcSv(6,3,6,3),cplUSecUSecVWmVWm(6,6),cplUSecUSeVPVP(6,6),cplUSecUSeVZVZ(6,6),& 
& cplUSeSecUSecSe(6,6,6,6),cplUSeSucUSecSu(6,6,6,6),cplUSeSvcUSecSv(6,3,6,3),            & 
& cplUSucUSucVWmVWm(6,6),cplUSucUSuVGVG(6,6),cplUSucUSuVPVP(6,6),cplUSucUSuVZVZ(6,6),    & 
& cplUSuSucUSucSu(6,6,6,6),cplUSuSvcUSucSv(6,3,6,3),cplUSvcUSvcVWmVWm(3,3),              & 
& cplUSvcUSvVZVZ(3,3),cplUSvSvcUSvcSv(3,3,3,3),cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,      & 
& cplVGVGVGVG3

Write(*,*) "Calculate FineTuning" 
NumericalProblem = .False. 
GenerationMixingSave=GenerationMixing 
GenerationMixing= .false. 
Tad1Loop = 0._dp 
stepsize = 1.0E-5_dp 
 
delta0 = stepsize/1000._dp
 
variation = 1._dp + stepsize 
 
mudim = GetRenormalizationScale() 
 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L3 = L3input 
Yu = Yuinput 
Mu = Muinput 
Td = Tdinput 
Te = Teinput 
T3 = T3input 
Tu = Tuinput 
Bmu = Bmuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
! ------------------------- 
! Initialization 
! ----------------------- 
 
Fpar = 0 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG323(g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,ml2,mHd2,           & 
& mHu2,md2,mu2,me2,M1,M2,M3,vd,vu,gC)

Call GToParameters323(gC,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,ml2,             & 
& mHd2,mHu2,md2,mu2,me2,M1,M2,M3,vd,vu)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
If (OneLoopFT) Then 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,               & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,             & 
& ZV,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,               & 
& ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,GenerationMixing,kont)

Call CouplingsForLoopMasses(Mu,Yd,Td,ZD,ZA,g2,Yu,UM,UP,ZUL,ZUR,g1,ZN,ZDL,             & 
& ZDR,g3,pG,vd,vu,ZH,Tu,ZU,ZP,TW,L3,T3,Ye,ZE,ZEL,ZER,ZV,Te,cplAhSdcUSd,cplChaFucUSdL,    & 
& cplChaFucUSdR,cplChiFdcUSdL,cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,     & 
& cplHpmSucUSd,cplSdcUSdVG,cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplcFdcFucUSdL,          & 
& cplcFdcFucUSdR,cplcUSdcSdcSu,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,          & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvcUSdcSv,cplUSdcUSdVGVG,        & 
& cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,cplChiFvcUSvL,cplChiFvcUSvR,           & 
& cplcChaFecUSvL,cplcChaFecUSvR,cplhhSvcUSv,cplSecHpmcUSv,cplSecUSvcVWm,cplSvcUSvVZ,     & 
& cplAhAhUSvcUSv,cplhhhhUSvcUSv,cplHpmUSvcHpmcUSv,cplSdUSvcSdcUSv,cplSeUSvcSecUSv,       & 
& cplSuUSvcSucUSv,cplUSvSvcUSvcSv,cplUSvcUSvcVWmVWm,cplUSvcUSvVZVZ,cplAhSucUSu,          & 
& cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,               & 
& cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,         & 
& cplSucUSuVZ,cplcFdcFdcUSuL,cplcFdcFdcUSuR,cplcSdcSdcUSu,cplAhAhUSucUSu,cplhhhhUSucUSu, & 
& cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvcUSucSv,     & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,cplAhSecUSe,            & 
& cplChaFvcUSeL,cplChaFvcUSeR,cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,cplHpmSvcUSe,      & 
& cplSecUSeVP,cplSecUSeVZ,cplSvcUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,  & 
& cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvcUSecSv,cplUSecUSeVPVP,        & 
& cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplAhAhUhh,cplAhUhhVZ,cplcChaChaUhhL,cplcChaChaUhhR,  & 
& cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,       & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,        & 
& cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,cplUhhSvcSv,           & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,  & 
& cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvcSv,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,           & 
& cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,     & 
& cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplcgWmgWmUAh,        & 
& cplcgWpCgWpCUAh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,cplUAhSecSe,        & 
& cplUAhSucSu,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,               & 
& cplUAhUAhSecSe,cplUAhUAhSucSu,cplUAhUAhSvcSv,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,           & 
& cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,            & 
& cplcFuFdcUHpmR,cplcFvFecUHpmL,cplcFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,              & 
& cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSecUHpmcSv,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,& 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvcUHpmcSv,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,              & 
& cplUHpmcUHpmVZVZ,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,cplUChiChacHpmR,          & 
& cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,cplUChiChiVZL,             & 
& cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,   & 
& cplUChiFucSuR,cplUChiFvcSvL,cplUChiFvcSvR,cplcChaUChiHpmL,cplcChaUChiHpmR,             & 
& cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,   & 
& cplcFvUChiSvL,cplcFvUChiSvR,cplcChaUChiVWmL,cplcChaUChiVWmR,cplcUChaChaAhL,            & 
& cplcUChaChaAhR,cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,            & 
& cplcUChaChaVZL,cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,         & 
& cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFecSvL,cplcUChaFecSvR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,cplcUChacFvSeL,cplcUChacFvSeR,cplcUFeFeAhL,              & 
& cplcUFeFeAhR,cplcUFeChaSvL,cplcUFeChaSvR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,     & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,        & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,     & 
& cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,      & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFuHpmL,        & 
& cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,cplcUFdcFdcSuL,  & 
& cplcUFdcFdcSuR,cplcUFdcFucSdL,cplcUFdcFucSdR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,  & 
& cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,             & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,   & 
& cplcFdcUFucSdL,cplcFdcUFucSdR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcUFvChiSvL,cplcUFvChiSvR,cplcUFvFecHpmL,cplcUFvFecHpmR,cplcUFvFecVWmL,              & 
& cplcUFvFecVWmR,cplcUFvFvVZL,cplcUFvFvVZR,cplcChacUFvSeL,cplcChacUFvSeR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplSdcSdVG,cplSucSuVG,cplVGVGVG,        & 
& cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcChaChaVPL,        & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,           & 
& cplSucSuVPVP,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,              & 
& cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,              & 
& cplSucSuVZ,cplSvcSvVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,             & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,   & 
& cplcVWmVWmVZVZ3,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,              & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2, & 
& cplcVWmVPVWmVZ3)

Call OneLoopTadpoleshh(vd,vu,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,            & 
& MVWm2,MVZ,MVZ2,cplAhAhUhh,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,   & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvcSv,cplUhhcVWmVWm,cplUhhVZVZ,Tad1Loop(1:2))

Else 
  Tad1Loop(:) = 0._dp 
End If 

Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,               & 
& ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,vd,vu,Tad1Loop)

! First Run to GUT scale and back to get reference 
Do i1=1,100 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG321(g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,ml2,mHd2,           & 
& mHu2,md2,mu2,me2,M1,M2,M3,gA)

tz=Log(sqrt(mudim)/mGUT)
dt=-tz/50._dp
Call odeint(gA,321,tz,0._dp,0.001_dp*delta0,dt,0._dp,rge321,kont)
Call BoundaryFT(gA,gB,0,variation)
tz=Log(sqrt(mudim)/mGUT)
dt=tz/50._dp
Call odeint(gB,321,0._dp,tz,0.001_dp*delta0,dt,0._dp,rge321,kont)
Call GToParameters321(gB,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,ml2,             & 
& mHd2,mHu2,md2,mu2,me2,M1,M2,M3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
If (OneLoopFT) Then 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,               & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,             & 
& ZV,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,               & 
& ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,GenerationMixing,kont)

Call CouplingsForLoopMasses(Mu,Yd,Td,ZD,ZA,g2,Yu,UM,UP,ZUL,ZUR,g1,ZN,ZDL,             & 
& ZDR,g3,pG,vd,vu,ZH,Tu,ZU,ZP,TW,L3,T3,Ye,ZE,ZEL,ZER,ZV,Te,cplAhSdcUSd,cplChaFucUSdL,    & 
& cplChaFucUSdR,cplChiFdcUSdL,cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,     & 
& cplHpmSucUSd,cplSdcUSdVG,cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplcFdcFucUSdL,          & 
& cplcFdcFucUSdR,cplcUSdcSdcSu,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,          & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvcUSdcSv,cplUSdcUSdVGVG,        & 
& cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,cplChiFvcUSvL,cplChiFvcUSvR,           & 
& cplcChaFecUSvL,cplcChaFecUSvR,cplhhSvcUSv,cplSecHpmcUSv,cplSecUSvcVWm,cplSvcUSvVZ,     & 
& cplAhAhUSvcUSv,cplhhhhUSvcUSv,cplHpmUSvcHpmcUSv,cplSdUSvcSdcUSv,cplSeUSvcSecUSv,       & 
& cplSuUSvcSucUSv,cplUSvSvcUSvcSv,cplUSvcUSvcVWmVWm,cplUSvcUSvVZVZ,cplAhSucUSu,          & 
& cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,               & 
& cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,         & 
& cplSucUSuVZ,cplcFdcFdcUSuL,cplcFdcFdcUSuR,cplcSdcSdcUSu,cplAhAhUSucUSu,cplhhhhUSucUSu, & 
& cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvcUSucSv,     & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,cplAhSecUSe,            & 
& cplChaFvcUSeL,cplChaFvcUSeR,cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,cplHpmSvcUSe,      & 
& cplSecUSeVP,cplSecUSeVZ,cplSvcUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,  & 
& cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvcUSecSv,cplUSecUSeVPVP,        & 
& cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplAhAhUhh,cplAhUhhVZ,cplcChaChaUhhL,cplcChaChaUhhR,  & 
& cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,       & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,        & 
& cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,cplUhhSvcSv,           & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,  & 
& cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvcSv,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,           & 
& cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,     & 
& cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplcgWmgWmUAh,        & 
& cplcgWpCgWpCUAh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,cplUAhSecSe,        & 
& cplUAhSucSu,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,               & 
& cplUAhUAhSecSe,cplUAhUAhSucSu,cplUAhUAhSvcSv,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,           & 
& cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,            & 
& cplcFuFdcUHpmR,cplcFvFecUHpmL,cplcFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,              & 
& cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSecUHpmcSv,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,& 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvcUHpmcSv,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,              & 
& cplUHpmcUHpmVZVZ,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,cplUChiChacHpmR,          & 
& cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,cplUChiChiVZL,             & 
& cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,   & 
& cplUChiFucSuR,cplUChiFvcSvL,cplUChiFvcSvR,cplcChaUChiHpmL,cplcChaUChiHpmR,             & 
& cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,   & 
& cplcFvUChiSvL,cplcFvUChiSvR,cplcChaUChiVWmL,cplcChaUChiVWmR,cplcUChaChaAhL,            & 
& cplcUChaChaAhR,cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,            & 
& cplcUChaChaVZL,cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,         & 
& cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFecSvL,cplcUChaFecSvR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,cplcUChacFvSeL,cplcUChacFvSeR,cplcUFeFeAhL,              & 
& cplcUFeFeAhR,cplcUFeChaSvL,cplcUFeChaSvR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,     & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,        & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,     & 
& cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,      & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFuHpmL,        & 
& cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,cplcUFdcFdcSuL,  & 
& cplcUFdcFdcSuR,cplcUFdcFucSdL,cplcUFdcFucSdR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,  & 
& cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,             & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,   & 
& cplcFdcUFucSdL,cplcFdcUFucSdR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcUFvChiSvL,cplcUFvChiSvR,cplcUFvFecHpmL,cplcUFvFecHpmR,cplcUFvFecVWmL,              & 
& cplcUFvFecVWmR,cplcUFvFvVZL,cplcUFvFvVZR,cplcChacUFvSeL,cplcChacUFvSeR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplSdcSdVG,cplSucSuVG,cplVGVGVG,        & 
& cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcChaChaVPL,        & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,           & 
& cplSucSuVPVP,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,              & 
& cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,              & 
& cplSucSuVZ,cplSvcSvVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,             & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,   & 
& cplcVWmVWmVZVZ3,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,              & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2, & 
& cplcVWmVPVWmVZ3)

Call OneLoopTadpoleshh(vd,vu,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,            & 
& MVWm2,MVZ,MVZ2,cplAhAhUhh,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,   & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvcSv,cplUhhcVWmVWm,cplUhhVZVZ,Tad1Loop(1:2))

Else 
  Tad1Loop(:) = 0._dp 
End If 

gDiff=Abs(gB-gRef) 
Where (Abs(gDiff).lt.1E-12_dp) gDiff=0._dp 
Where (Abs(gRef).Gt.0._dp) gDiff=gDiff/Abs(gRef) 
maxdiff=Maxval(gDiff) 
If (Abs(maxdiff).gt.delta0) Then 
gRef = gB 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,               & 
& ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,vd,vu,Tad1Loop)

Else 
Exit 
End if 
End Do 
If (OneLoopFT) Then 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,               & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,             & 
& ZV,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,               & 
& ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,GenerationMixing,kont)

Call CouplingsForLoopMasses(Mu,Yd,Td,ZD,ZA,g2,Yu,UM,UP,ZUL,ZUR,g1,ZN,ZDL,             & 
& ZDR,g3,pG,vd,vu,ZH,Tu,ZU,ZP,TW,L3,T3,Ye,ZE,ZEL,ZER,ZV,Te,cplAhSdcUSd,cplChaFucUSdL,    & 
& cplChaFucUSdR,cplChiFdcUSdL,cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,     & 
& cplHpmSucUSd,cplSdcUSdVG,cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplcFdcFucUSdL,          & 
& cplcFdcFucUSdR,cplcUSdcSdcSu,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,          & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvcUSdcSv,cplUSdcUSdVGVG,        & 
& cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,cplChiFvcUSvL,cplChiFvcUSvR,           & 
& cplcChaFecUSvL,cplcChaFecUSvR,cplhhSvcUSv,cplSecHpmcUSv,cplSecUSvcVWm,cplSvcUSvVZ,     & 
& cplAhAhUSvcUSv,cplhhhhUSvcUSv,cplHpmUSvcHpmcUSv,cplSdUSvcSdcUSv,cplSeUSvcSecUSv,       & 
& cplSuUSvcSucUSv,cplUSvSvcUSvcSv,cplUSvcUSvcVWmVWm,cplUSvcUSvVZVZ,cplAhSucUSu,          & 
& cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,               & 
& cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,         & 
& cplSucUSuVZ,cplcFdcFdcUSuL,cplcFdcFdcUSuR,cplcSdcSdcUSu,cplAhAhUSucUSu,cplhhhhUSucUSu, & 
& cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvcUSucSv,     & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,cplAhSecUSe,            & 
& cplChaFvcUSeL,cplChaFvcUSeR,cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,cplHpmSvcUSe,      & 
& cplSecUSeVP,cplSecUSeVZ,cplSvcUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,  & 
& cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvcUSecSv,cplUSecUSeVPVP,        & 
& cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplAhAhUhh,cplAhUhhVZ,cplcChaChaUhhL,cplcChaChaUhhR,  & 
& cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,       & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,        & 
& cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,cplUhhSvcSv,           & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,  & 
& cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvcSv,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,           & 
& cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,     & 
& cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplcgWmgWmUAh,        & 
& cplcgWpCgWpCUAh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,cplUAhSecSe,        & 
& cplUAhSucSu,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,               & 
& cplUAhUAhSecSe,cplUAhUAhSucSu,cplUAhUAhSvcSv,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,           & 
& cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,            & 
& cplcFuFdcUHpmR,cplcFvFecUHpmL,cplcFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,              & 
& cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSecUHpmcSv,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,& 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvcUHpmcSv,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,              & 
& cplUHpmcUHpmVZVZ,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,cplUChiChacHpmR,          & 
& cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,cplUChiChiVZL,             & 
& cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,   & 
& cplUChiFucSuR,cplUChiFvcSvL,cplUChiFvcSvR,cplcChaUChiHpmL,cplcChaUChiHpmR,             & 
& cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,   & 
& cplcFvUChiSvL,cplcFvUChiSvR,cplcChaUChiVWmL,cplcChaUChiVWmR,cplcUChaChaAhL,            & 
& cplcUChaChaAhR,cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,            & 
& cplcUChaChaVZL,cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,         & 
& cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFecSvL,cplcUChaFecSvR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,cplcUChacFvSeL,cplcUChacFvSeR,cplcUFeFeAhL,              & 
& cplcUFeFeAhR,cplcUFeChaSvL,cplcUFeChaSvR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,     & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,        & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,     & 
& cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,      & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFuHpmL,        & 
& cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,cplcUFdcFdcSuL,  & 
& cplcUFdcFdcSuR,cplcUFdcFucSdL,cplcUFdcFucSdR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,  & 
& cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,             & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,   & 
& cplcFdcUFucSdL,cplcFdcUFucSdR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcUFvChiSvL,cplcUFvChiSvR,cplcUFvFecHpmL,cplcUFvFecHpmR,cplcUFvFecVWmL,              & 
& cplcUFvFecVWmR,cplcUFvFvVZL,cplcUFvFvVZR,cplcChacUFvSeL,cplcChacUFvSeR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplSdcSdVG,cplSucSuVG,cplVGVGVG,        & 
& cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcChaChaVPL,        & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,           & 
& cplSucSuVPVP,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,              & 
& cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,              & 
& cplSucSuVZ,cplSvcSvVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,             & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,   & 
& cplcVWmVWmVZVZ3,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,              & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2, & 
& cplcVWmVPVWmVZ3)

Call OneLoopTadpoleshh(vd,vu,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,            & 
& MVWm2,MVZ,MVZ2,cplAhAhUhh,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,   & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvcSv,cplUhhcVWmVWm,cplUhhVZVZ,Tad1Loop(1:2))

Else 
  Tad1Loop(:) = 0._dp 
End If 


 ! Calculate VEVs 
Call SolveTadpoleEquationsVEVs(g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,               & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,vd,vu,Tad1Loop)



 ! Calculate reference value for MZ  
MZ2ref = 1._dp/4._dp*(g1**2 + g2**2)*( vd**2 + vu**2) 
vdref = vd
vuref = vu
If (OneLoopFT) Then 

 ! One-Loop correction 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,               & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,             & 
& ZV,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,               & 
& ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,.False.,kont)

Call CouplingsForVectorBosons(g1,g2,vd,vu,ZP,TW,ZH,ZA,UM,UP,ZN,ZD,ZE,ZU,              & 
& ZDL,ZUL,ZEL,ZV,cplHpmcVWmVP,cplcVWmVPVWm,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,              & 
& cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcVWmVWmVZ,cplAhAhVZVZ,     & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvcSvVZVZ,        & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplAhHpmcVWm,cplChiChacVWmL,           & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm, & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,     & 
& cplSecSvcVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,          & 
& cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,              & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)

Call Pi1LoopVZ(MZ2ref,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcVWmVWmVZ,cplAhAhVZVZ,     & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvcSvVZVZ,        & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,dmZ2)

MZ2ref = MZ2ref+Real(dmz2,dp) 
End if 
If (i1.gt.99) Then 
 NumericalProblem = .true. 
Write(*,*) "RGEs haven't converged with needed precission" 
End if 
If (MZ2ref.lt.1000._dp) Then 
 NumericalProblem = .true. 
Write(*,*) "Numerical problem in solving tadpole equations with respect to VEVs." 
End if 


! ----------------------------- 
! Calculate Fine-Tuning 
! -------------------------- 
 
Do i1=1,7 
 
! RGE running 
Fpar = i1 
vd = vdinput 
vu = vuinput 
Call BoundaryFT(gA,gB,i1,variation)
tz=Log(sqrt(mudim)/mGUT)
dt=tz/50._dp
Call odeint(gB,321,0._dp,tz,0.001_dp*delta0,dt,0._dp,rge321,kont)
Call GToParameters321(gB,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,ml2,             & 
& mHd2,mHu2,md2,mu2,me2,M1,M2,M3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Select Case(i1) 
  Case(1) 
    factor = 1._dp/2._dp 
  Case(2) 
    factor = 1._dp/2._dp 
  Case(3) 
    factor = 1._dp/2._dp 
  Case(4) 
    factor = 1._dp/2._dp 
  Case(5) 
    factor = 1._dp/2._dp 
  Case(6) 
    factor = 1._dp/2._dp 
  Case(7) 
    factor = 1._dp/2._dp 
End Select 
Do j=1,1000 
If (OneLoopFT) Then 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,               & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,             & 
& ZV,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,               & 
& ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,GenerationMixing,kont)

Call CouplingsForLoopMasses(Mu,Yd,Td,ZD,ZA,g2,Yu,UM,UP,ZUL,ZUR,g1,ZN,ZDL,             & 
& ZDR,g3,pG,vd,vu,ZH,Tu,ZU,ZP,TW,L3,T3,Ye,ZE,ZEL,ZER,ZV,Te,cplAhSdcUSd,cplChaFucUSdL,    & 
& cplChaFucUSdR,cplChiFdcUSdL,cplChiFdcUSdR,cplGluFdcUSdL,cplGluFdcUSdR,cplhhSdcUSd,     & 
& cplHpmSucUSd,cplSdcUSdVG,cplSdcUSdVP,cplSdcUSdVZ,cplSucUSdVWm,cplcFdcFucUSdL,          & 
& cplcFdcFucUSdR,cplcUSdcSdcSu,cplAhAhUSdcUSd,cplhhhhUSdcUSd,cplHpmUSdcHpmcUSd,          & 
& cplUSdSdcUSdcSd,cplUSdSecUSdcSe,cplUSdSucUSdcSu,cplUSdSvcUSdcSv,cplUSdcUSdVGVG,        & 
& cplUSdcUSdVPVP,cplUSdcUSdcVWmVWm,cplUSdcUSdVZVZ,cplChiFvcUSvL,cplChiFvcUSvR,           & 
& cplcChaFecUSvL,cplcChaFecUSvR,cplhhSvcUSv,cplSecHpmcUSv,cplSecUSvcVWm,cplSvcUSvVZ,     & 
& cplAhAhUSvcUSv,cplhhhhUSvcUSv,cplHpmUSvcHpmcUSv,cplSdUSvcSdcUSv,cplSeUSvcSecUSv,       & 
& cplSuUSvcSucUSv,cplUSvSvcUSvcSv,cplUSvcUSvcVWmVWm,cplUSvcUSvVZVZ,cplAhSucUSu,          & 
& cplChiFucUSuL,cplChiFucUSuR,cplcChaFdcUSuL,cplcChaFdcUSuR,cplGluFucUSuL,               & 
& cplGluFucUSuR,cplhhSucUSu,cplSdcHpmcUSu,cplSdcUSucVWm,cplSucUSuVG,cplSucUSuVP,         & 
& cplSucUSuVZ,cplcFdcFdcUSuL,cplcFdcFdcUSuR,cplcSdcSdcUSu,cplAhAhUSucUSu,cplhhhhUSucUSu, & 
& cplHpmUSucHpmcUSu,cplSdUSucSdcUSu,cplSeUSucSecUSu,cplUSuSucUSucSu,cplUSuSvcUSucSv,     & 
& cplUSucUSuVGVG,cplUSucUSuVPVP,cplUSucUSucVWmVWm,cplUSucUSuVZVZ,cplAhSecUSe,            & 
& cplChaFvcUSeL,cplChaFvcUSeR,cplChiFecUSeL,cplChiFecUSeR,cplhhSecUSe,cplHpmSvcUSe,      & 
& cplSecUSeVP,cplSecUSeVZ,cplSvcUSeVWm,cplAhAhUSecUSe,cplhhhhUSecUSe,cplHpmUSecHpmcUSe,  & 
& cplSdUSecSdcUSe,cplUSeSecUSecSe,cplUSeSucUSecSu,cplUSeSvcUSecSv,cplUSecUSeVPVP,        & 
& cplUSecUSecVWmVWm,cplUSecUSeVZVZ,cplAhAhUhh,cplAhUhhVZ,cplcChaChaUhhL,cplcChaChaUhhR,  & 
& cplChiChiUhhL,cplChiChiUhhR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,       & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,        & 
& cplUhhHpmcHpm,cplUhhHpmcVWm,cplUhhSdcSd,cplUhhSecSe,cplUhhSucSu,cplUhhSvcSv,           & 
& cplUhhcVWmVWm,cplUhhVZVZ,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhSdcSd,  & 
& cplUhhUhhSecSe,cplUhhUhhSucSu,cplUhhUhhSvcSv,cplUhhUhhcVWmVWm,cplUhhUhhVZVZ,           & 
& cplUAhAhhh,cplcChaChaUAhL,cplcChaChaUAhR,cplChiChiUAhL,cplChiChiUAhR,cplcFdFdUAhL,     & 
& cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplcgWmgWmUAh,        & 
& cplcgWpCgWpCUAh,cplUAhhhVZ,cplUAhHpmcHpm,cplUAhHpmcVWm,cplUAhSdcSd,cplUAhSecSe,        & 
& cplUAhSucSu,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhSdcSd,               & 
& cplUAhUAhSecSe,cplUAhUAhSucSu,cplUAhUAhSvcSv,cplUAhUAhcVWmVWm,cplUAhUAhVZVZ,           & 
& cplAhHpmcUHpm,cplAhcUHpmVWm,cplChiChacUHpmL,cplChiChacUHpmR,cplcFuFdcUHpmL,            & 
& cplcFuFdcUHpmR,cplcFvFecUHpmL,cplcFvFecUHpmR,cplcgZgWmcUHpm,cplcgWmgZUHpm,             & 
& cplcgWpCgZcUHpm,cplcgZgWpCUHpm,cplhhHpmcUHpm,cplhhcUHpmVWm,cplHpmcUHpmVP,              & 
& cplHpmcUHpmVZ,cplSdcUHpmcSu,cplSecUHpmcSv,cplcUHpmVPVWm,cplcUHpmVWmVZ,cplAhAhUHpmcUHpm,& 
& cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmSdcUHpmcSd,cplUHpmSecUHpmcSe,              & 
& cplUHpmSucUHpmcSu,cplUHpmSvcUHpmcSv,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWmVWm,              & 
& cplUHpmcUHpmVZVZ,cplUChiChiAhL,cplUChiChiAhR,cplUChiChacHpmL,cplUChiChacHpmR,          & 
& cplUChiChacVWmL,cplUChiChacVWmR,cplUChiChihhL,cplUChiChihhR,cplUChiChiVZL,             & 
& cplUChiChiVZR,cplUChiFdcSdL,cplUChiFdcSdR,cplUChiFecSeL,cplUChiFecSeR,cplUChiFucSuL,   & 
& cplUChiFucSuR,cplUChiFvcSvL,cplUChiFvcSvR,cplcChaUChiHpmL,cplcChaUChiHpmR,             & 
& cplcFdUChiSdL,cplcFdUChiSdR,cplcFeUChiSeL,cplcFeUChiSeR,cplcFuUChiSuL,cplcFuUChiSuR,   & 
& cplcFvUChiSvL,cplcFvUChiSvR,cplcChaUChiVWmL,cplcChaUChiVWmR,cplcUChaChaAhL,            & 
& cplcUChaChaAhR,cplcUChaChahhL,cplcUChaChahhR,cplcUChaChaVPL,cplcUChaChaVPR,            & 
& cplcUChaChaVZL,cplcUChaChaVZR,cplcUChaChiHpmL,cplcUChaChiHpmR,cplcUChaChiVWmL,         & 
& cplcUChaChiVWmR,cplcUChaFdcSuL,cplcUChaFdcSuR,cplcUChaFecSvL,cplcUChaFecSvR,           & 
& cplcUChacFuSdL,cplcUChacFuSdR,cplcUChacFvSeL,cplcUChacFvSeR,cplcUFeFeAhL,              & 
& cplcUFeFeAhR,cplcUFeChaSvL,cplcUFeChaSvR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,     & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvHpmL,        & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,     & 
& cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,      & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFuHpmL,        & 
& cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,cplcUFdcFdcSuL,  & 
& cplcUFdcFdcSuR,cplcUFdcFucSdL,cplcUFdcFucSdR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,  & 
& cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,             & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,   & 
& cplcFdcUFucSdL,cplcFdcUFucSdR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,     & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcUFvChiSvL,cplcUFvChiSvR,cplcUFvFecHpmL,cplcUFvFecHpmR,cplcUFvFecVWmL,              & 
& cplcUFvFecVWmR,cplcUFvFvVZL,cplcUFvFvVZR,cplcChacUFvSeL,cplcChacUFvSeR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplSdcSdVG,cplSucSuVG,cplVGVGVG,        & 
& cplSdcSdVGVG,cplSucSuVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcChaChaVPL,        & 
& cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,          & 
& cplSecSeVP,cplSucSuVP,cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,           & 
& cplSucSuVPVP,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,              & 
& cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,              & 
& cplSucSuVZ,cplSvcSvVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,             & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,   & 
& cplcVWmVWmVZVZ3,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,              & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,cplAhAhcVWmVWm,     & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,              & 
& cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2, & 
& cplcVWmVPVWmVZ3)

Call OneLoopTadpoleshh(vd,vu,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,            & 
& MVWm2,MVZ,MVZ2,cplAhAhUhh,cplcChaChaUhhL,cplcChaChaUhhR,cplChiChiUhhL,cplChiChiUhhR,   & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplcgWmgWmUhh,cplcgWpCgWpCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhSdcSd,        & 
& cplUhhSecSe,cplUhhSucSu,cplUhhSvcSv,cplUhhcVWmVWm,cplUhhVZVZ,Tad1Loop(1:2))

Else 
  Tad1Loop(:) = 0._dp 
End If 



 ! Calculate VEVs 
Call SolveTadpoleEquationsVEVs(g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,               & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,vd,vu,Tad1Loop)

If (MaxVal(Abs(Tad1Loop-Tadpoles_Save)).lt.1._dp) Then 
  Exit 
Else 
  Tadpoles_Save=Tad1Loop 
End if 
End Do 


 ! Calculate FineTuning 
MZ2current = 1._dp/4._dp*(g1**2 + g2**2)*( vd**2 + vu**2) 
If (OneLoopFT) Then 

 ! One-Loop correction 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,               & 
& MVWm2,MVZ,MVZ2,pG,TW,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,             & 
& ZV,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,               & 
& ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,.False.,kont)

Call CouplingsForVectorBosons(g1,g2,vd,vu,ZP,TW,ZH,ZA,UM,UP,ZN,ZD,ZE,ZU,              & 
& ZDL,ZUL,ZEL,ZV,cplHpmcVWmVP,cplcVWmVPVWm,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,              & 
& cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcVWmVWmVZ,cplAhAhVZVZ,     & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvcSvVZVZ,        & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplAhHpmcVWm,cplChiChacVWmL,           & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm, & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgWpCgZcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,     & 
& cplSecSvcVWm,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,          & 
& cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2, & 
& cplcVWmcVWmVWmVWm3,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,              & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3)

Call Pi1LoopVZ(MZ2current,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,           & 
& MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcVWmVWmVZ,cplAhAhVZVZ,     & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvcSvVZVZ,        & 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,dmZ2)

MZ2current = MZ2current + Real(dmz2,dp) 
End if 
If ((MZ2Current.lt.500._dp).or.(MZ2Current.gt.100000._dp)) Then 
Write(*,*) " Large deviation in Z mass in fine-tuning routine: ", sqrt(MZ2Current) 
Write(*,*) " That's most likely a numerical problem! " 
 NumericalProblem = .true. 
End If 
If (NumericalProblem) Then 
 FineTuningResultsAllVEVs(i1) = -1._dp 
Else 
 FineTuningResultsAllVEVs(i1) = 0.5_dp*Abs((MZ2current-MZ2ref)/(MZ2ref))/stepsize*factor 
End If 
! Write(*,*) sqrt((Real(vu-vuref,dp)**2+Real(vd-vdref,dp)**2)/(vdref**2+vuref**2))/stepsize*factor 
End Do 
GenerationMixing = GenerationMixingSave 
End Subroutine FineTuning 
Subroutine BoundaryFT(gA,gB,FTpar,variation) 
Implicit None 
Real(dp),Intent(in)::gA(:)
Real(dp),Intent(out)::gB(:)
Integer, Intent(in) :: FTpar
Real(dp), Intent(in) :: variation 
Complex(dp) :: savePar 
Integer::i1,i2
Real(dp) :: g1,g2,g3

Complex(dp) :: Yd(3,3),Ye(3,3),L3(3,3,3),Yu(3,3)

Real(dp) :: mHd2,mHu2

Complex(dp) :: Mu,Td(3,3),Te(3,3),T3(3,3,3),Tu(3,3),Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),         & 
& me2(3,3),M1,M2,M3

Iname=Iname+1
NameOfUnit(Iname)='BoundaryFT'
Call GToParameters321(gA,g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,ml2,             & 
& mHd2,mHu2,md2,mu2,me2,M1,M2,M3)

Select Case(FTpar) 
Case (1) 
   savePar = m0 
   m0 = variation*m0 
Case (2) 
   savePar = m12 
   m12 = variation*m12 
Case (3) 
   savePar = Azero 
   Azero = variation*Azero 
End Select 
If (InputValueforg1) Then 
g1 = g1IN 
Else 
End If 
If (InputValueforg2) Then 
g2 = g2IN 
Else 
End If 
If (InputValueforTe) Then 
Te = TeIN 
Else 
Te = Azero*Ye
End If 
If (InputValueforTd) Then 
Td = TdIN 
Else 
Td = Azero*Yd
End If 
If (InputValueforTu) Then 
Tu = TuIN 
Else 
Tu = Azero*Yu
End If 
If (InputValueforL3) Then 
L3 = L3IN 
Else 
L3 = L3IN
End If 
If (InputValueforT3) Then 
T3 = T3IN 
Else 
T3 = Azero*L3
End If 
If (InputValueformq2) Then 
mq2 = mq2IN 
Else 
mq2 = 0._dp 
Do i1=1,3
mq2(i1,i1) = m0**2
End Do
End If 
If (InputValueforml2) Then 
ml2 = ml2IN 
Else 
ml2 = 0._dp 
Do i1=1,3
ml2(i1,i1) = m0**2
End Do
End If 
If (InputValueformd2) Then 
md2 = md2IN 
Else 
md2 = 0._dp 
Do i1=1,3
md2(i1,i1) = m0**2
End Do
End If 
If (InputValueformu2) Then 
mu2 = mu2IN 
Else 
mu2 = 0._dp 
Do i1=1,3
mu2(i1,i1) = m0**2
End Do
End If 
If (InputValueforme2) Then 
me2 = me2IN 
Else 
me2 = 0._dp 
Do i1=1,3
me2(i1,i1) = m0**2
End Do
End If 
If (InputValueformHd2) Then 
mHd2 = mHd2IN 
Else 
mHd2 = m0**2
End If 
If (InputValueformHu2) Then 
mHu2 = mHu2IN 
Else 
mHu2 = m0**2
End If 
If (InputValueforM1) Then 
M1 = M1IN 
Else 
M1 = m12
End If 
If (InputValueforM2) Then 
M2 = M2IN 
Else 
M2 = m12
End If 
If (InputValueforM3) Then 
M3 = M3IN 
Else 
M3 = m12
End If 
mlHd2 = 0
If (InputValueforMu) Then 
Mu = MuIN 
Else 
End If 
If (InputValueforBmu) Then 
Bmu = BmuIN 
Else 
End If 
Select Case(FTpar) 
Case (1) 
   m0 = savePar 
Case (2) 
   m12 = savePar 
Case (3) 
   Azero = savePar 
Case (4) 
   Mu = variation*Mu 
Case (5) 
   Bmu = variation*Bmu 
Case (6) 
   Yu = variation*Yu 
Case (7) 
   L3 = variation*L3 
End Select 
Call ParametersToG321(g1,g2,g3,Yd,Ye,L3,Yu,Mu,Td,Te,T3,Tu,Bmu,mq2,ml2,mHd2,           & 
& mHu2,md2,mu2,me2,M1,M2,M3,gB)

Iname=Iname-1
End Subroutine BoundaryFT 
 
End Module FineTuning_MSSMBpV 
