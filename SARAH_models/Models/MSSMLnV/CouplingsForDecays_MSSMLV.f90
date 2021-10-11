! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:11 on 24.8.2021   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_MSSMLV
 
Use Control 
Use Settings 
Use Model_Data_MSSMLV 
Use RGEs_MSSMLV 
Use Couplings_MSSMLV 
Use LoopCouplings_MSSMLV 
Use Tadpoles_MSSMLV 
 Use TreeLevelMasses_MSSMLV 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Sd_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,           & 
& cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVZ,cplSucSdVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSdcSd(5,6,6),cplChaFucSdL(5,3,6),cplChaFucSdR(5,3,6),cplChiFdcSdL(7,3,6),        & 
& cplChiFdcSdR(7,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplhhSdcSd(5,6,6),             & 
& cplHpmSucSd(8,6,6),cplSdcSdVZ(6,6),cplSucSdVWm(6,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Sd_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplAhSdcSd = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Mu,REps,Yd,Td,L2,T2,vd,vL,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Mu,REps,Yd,Td,L2,T2,vd,vu,vL,ZD,              & 
& ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSucSd = 0._dp 
Do gt1 = 1, 8
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSucSdT(gt1,gt2,gt3,g2,Mu,REps,Yd,Td,Ye,L1,L2,T2,Yu,Tu,vd,             & 
& vu,vL,ZD,ZU,ZP,cplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZT(gt1,gt2,g1,g2,ZD,TW,cplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


cplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSdVWmT(gt1,gt2,g2,ZD,ZU,cplSucSdVWm(gt1,gt2))

 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Sd_decays_2B
 
Subroutine CouplingsFor_Su_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplAhSucSu,cplChiFucSuL,cplChiFucSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSucSu(5,6,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcChaFdcSuL(5,3,6),       & 
& cplcChaFdcSuR(5,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(5,6,6),            & 
& cplSdcHpmcSu(6,8,6),cplSdcSucVWm(6,6),cplSucSuVZ(6,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Su_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplAhSucSu = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,Mu,REps,Yu,Tu,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,Mu,REps,Yu,Tu,vd,vu,vL,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 8
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Mu,REps,Yd,Td,Ye,L1,L2,T2,Yu,Tu,               & 
& vd,vu,vL,ZD,ZU,ZP,cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSucVWmT(gt1,gt2,g2,ZD,ZU,cplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


cplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZT(gt1,gt2,g1,g2,ZU,TW,cplSucSuVZ(gt1,gt2))

 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Su_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplAhAhhh,cplAhhhVZ,               & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,     & 
& cplhhcVWmVWm,cplhhVZVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplHiggsPP(5),cplHiggsGG(5),cplHiggsZZvirt(5),cplHiggsWWvirt(5),cplAhAhhh(5,5,5),     & 
& cplAhhhVZ(5,5),cplcChaChahhL(5,5,5),cplcChaChahhR(5,5,5),cplChiChihhL(7,7,5),          & 
& cplChiChihhR(7,7,5),cplcFdFdhhL(3,3,5),cplcFdFdhhR(3,3,5),cplcFuFuhhL(3,3,5),          & 
& cplcFuFuhhR(3,3,5),cplhhhhhh(5,5,5),cplhhHpmcHpm(5,8,8),cplhhHpmcVWm(5,8),             & 
& cplhhSdcSd(5,6,6),cplhhSucSu(5,6,6),cplhhcVWmVWm(5),cplhhVZVZ(5)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Complex(dp) :: ratCha(5),ratFd(3),ratFu(3),ratHpm(8),ratSd(6),ratSu(6),ratVWm

Complex(dp) :: ratPCha(5),ratPFd(3),ratPFu(3),ratPHpm(8),ratPSd(6),ratPSu(6),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,vd,vu,vL,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplinghhhhhhT(gt1,gt2,gt3,g1,g2,vd,vu,vL,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
  Do gt3 = 1, 8
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,Mu,REps,Ye,Te,L1,T1,vd,vu,vL,               & 
& ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Mu,REps,Yd,Td,L2,T2,vd,vu,vL,ZD,              & 
& ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,Mu,REps,Yu,Tu,vd,vu,vL,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
Call CouplinghhHpmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 5
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,vL,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 5
Call CouplinghhVZVZT(gt1,g1,g2,vd,vu,vL,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,Ye,L1,ZH,ZEL,ZER,cplcChaChahhL(gt1,gt2,gt3)    & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,ZH,UV,cplChiChihhL(gt1,gt2,gt3)              & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,L2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)           & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev = Sqrt(vd**2 + vu**2 + vL(1)**2 + vL(2)**2 + vL(3)**2)
cplHiggsWWvirt = cplhhcVWmVWm/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2) 
rHB_S_VWm(i1) = Abs(-0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2) 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 7
rHB_S_S_Chi(i1,i2) = Abs((cplChiChihhL(i2,i2,i1)+cplChiChihhR(i2,i2,i1))*vev/(2._dp*MChi(i2))) 
rHB_S_P_Chi(i1,i2) = Abs((cplChiChihhL(i2,i2,i1)-cplChiChihhR(i2,i2,i1))*vev/(2._dp*MChi(i2))) 
End Do 
Do i2=1, 5
rHB_S_S_Cha(i1,i2) = Abs((cplcChaChahhL(i2,i2,i1)+cplcChaChahhR(i2,i2,i1))*vev/(2._dp*MCha(i2))) 
rHB_S_P_Cha(i1,i2) = Abs((cplcChaChahhL(i2,i2,i1)-cplcChaChahhR(i2,i2,i1))*vev/(2._dp*MCha(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 5
ratCha(i2) = cplcChaChahhL(i2,i2,i1)*1._dp*vev/MCha(i2) 
End Do 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 8
ratHpm(i2) = 0.5_dp*cplhhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
Do i2=1, 6
ratSd(i2) = 0.5_dp*cplhhSdcSd(i1,i2,i2)*vev/MSd2(i2) 
End Do 
Do i2=1, 6
ratSu(i2) = 0.5_dp*cplhhSucSu(i1,i2,i2)*vev/MSu2(i2) 
End Do 
ratVWm = -0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratCha,ratFd,ratFu,ratHpm,ratSd,ratSu,ratVWm,          & 
& MCha,MFd,MFu,MHpm,MSd,MSu,MVWm,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MCha,MFd,MFu,MHpm,MSd,MSu,MVWm,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha)) 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,ratSd,ratSu,MFd,MFu,MSd,MSu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,MSd,MSu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ)) 
If (i1.eq.1) Then 
CPL_A_H_Z = Abs(cplAhhhVZ**2/(g2**2/(cos(TW)**2*4._dp)))
CPL_H_H_Z = 0._dp 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,vd,vu,vL,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplinghhhhhhT(gt1,gt2,gt3,g1,g2,vd,vu,vL,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
  Do gt3 = 1, 8
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,Mu,REps,Ye,Te,L1,T1,vd,vu,vL,               & 
& ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Mu,REps,Yd,Td,L2,T2,vd,vu,vL,ZD,              & 
& ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,Mu,REps,Yu,Tu,vd,vu,vL,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
Call CouplinghhHpmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 5
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,vL,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 5
Call CouplinghhVZVZT(gt1,g1,g2,vd,vu,vL,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,Ye,L1,ZH,ZEL,ZER,cplcChaChahhL(gt1,gt2,gt3)    & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,ZH,UV,cplChiChihhL(gt1,gt2,gt3)              & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,L2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)           & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_Ah_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplPseudoHiggsPP,cplPseudoHiggsGG,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,               & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplPseudoHiggsPP(5),cplPseudoHiggsGG(5),cplAhAhhh(5,5,5),cplcChaChaAhL(5,5,5),        & 
& cplcChaChaAhR(5,5,5),cplChiChiAhL(7,7,5),cplChiChiAhR(7,7,5),cplcFdFdAhL(3,3,5),       & 
& cplcFdFdAhR(3,3,5),cplcFuFuAhL(3,3,5),cplcFuFuAhR(3,3,5),cplAhhhVZ(5,5),               & 
& cplAhHpmcHpm(5,8,8),cplAhHpmcVWm(5,8),cplAhSdcSd(5,6,6),cplAhSucSu(5,6,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Complex(dp) :: ratCha(5),ratFd(3),ratFu(3),ratHpm(8),ratSd(6),ratSu(6),ratVWm

Complex(dp) :: ratPCha(5),ratPFd(3),ratPFu(3),ratPHpm(8),ratPSd(6),ratPSu(6),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Ah_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,vd,vu,vL,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
  Do gt3 = 1, 8
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,Mu,REps,Ye,Te,L1,T1,vd,vu,vL,ZA,               & 
& ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSdcSd = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Mu,REps,Yd,Td,L2,T2,vd,vL,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSucSu = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,Mu,REps,Yu,Tu,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
Call CouplingAhHpmcVWmT(gt1,gt2,g2,ZA,ZP,cplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,Ye,L1,ZA,ZEL,ZER,cplcChaChaAhL(gt1,gt2,gt3)    & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,ZA,UV,cplChiChiAhL(gt1,gt2,gt3)              & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,L2,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)           & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev = Sqrt(vd**2 + vu**2 + vL(1)**2 + vL(2)**2 + vL(3)**2)
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_P_S_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)+cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_P_P_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)-cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)+cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_P_P_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)-cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 7
rHB_P_S_Chi(i1,i2) = 1._dp*Abs((cplChiChiAhL(i2,i2,i1)+cplChiChiAhR(i2,i2,i1))*vev/(2._dp*MChi(i2))) 
rHB_P_P_Chi(i1,i2) = 1._dp*Abs((cplChiChiAhL(i2,i2,i1)-cplChiChiAhR(i2,i2,i1))*vev/(2._dp*MChi(i2))) 
End Do 
Do i2=1, 5
rHB_P_S_Cha(i1,i2) = 1._dp*Abs((cplcChaChaAhL(i2,i2,i1)+cplcChaChaAhR(i2,i2,i1))*vev/(2._dp*MCha(i2))) 
rHB_P_P_Cha(i1,i2) = 1._dp*Abs((cplcChaChaAhL(i2,i2,i1)-cplcChaChaAhR(i2,i2,i1))*vev/(2._dp*MCha(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
!----------------------------------------------------
! Pseudo Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 5
ratPCha(i2) = cplcChaChaAhL(i2,i2,i1)*1._dp*vev/MCha(i2) 
End Do 
Do i2=1, 3
ratPFd(i2) = cplcFdFdAhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratPFu(i2) = cplcFuFuAhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 8
ratPHpm(i2) = 0.5_dp*cplAhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
Do i2=1, 6
ratPSd(i2) = 0.5_dp*cplAhSdcSd(i1,i2,i2)*vev/MSd2(i2) 
End Do 
Do i2=1, 6
ratPSu(i2) = 0.5_dp*cplAhSucSu(i1,i2,i2)*vev/MSu2(i2) 
End Do 
ratPVWm = 0._dp 
If (HigherOrderDiboson) Then 
  gNLO = g3 
Else  
  gNLO = -1._dp 
End if 
Call CoupPseudoHiggsToPhoton(m_in,i1,ratPCha,ratPFd,ratPFu,ratPHpm,ratPSd,            & 
& ratPSu,ratPVWm,MCha,MFd,MFu,MHpm,MSd,MSu,MVWm,gNLO,coup)

cplPseudoHiggsPP(i1) = 2._dp*coup*Alpha 
CoupAPP(i1) = 2._dp*coup 
Call CoupHiggsToPhotonSM(m_in,MCha,MFd,MFu,MHpm,MSd,MSu,MVWm,gNLO,coup)

ratioPPP(i1) = Abs(cplPseudoHiggsPP(i1)/(coup*oo4pi*(1._dp-mW2/mZ2)*g2**2)) 
  gNLO = -1._dp 
Call CoupPseudoHiggsToGluon(m_in,i1,ratPFd,ratPFu,ratPSd,ratPSu,MFd,MFu,              & 
& MSd,MSu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(97._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = (171.544_dp +  5._dp*Log(m_in**2/mf_u(3)**2))*g3**4/(4._dp*Pi**2)**2 
  NNNLOqcd = 0._dp 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
cplPseudoHiggsGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupAGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,MSd,MSu,gNLO,coup)

coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
ratioPGG(i1) = Abs(cplPseudoHiggsGG(i1)/(coup*AlphaSQ)) 

If (i1.eq.2) Then 
CPL_A_A_Z = 0._dp 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,vd,vu,vL,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
  Do gt3 = 1, 8
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,Mu,REps,Ye,Te,L1,T1,vd,vu,vL,ZA,               & 
& ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSdcSd = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Mu,REps,Yd,Td,L2,T2,vd,vL,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSucSu = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,Mu,REps,Yu,Tu,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingAhhhVZT(gt1,gt2,g1,g2,ZH,ZA,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
Call CouplingAhHpmcVWmT(gt1,gt2,g2,ZA,ZP,cplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,Ye,L1,ZA,ZEL,ZER,cplcChaChaAhL(gt1,gt2,gt3)    & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,ZA,UV,cplChiChiAhL(gt1,gt2,gt3)              & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,L2,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)           & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Ah_decays_2B
 
Subroutine CouplingsFor_Hpm_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,   & 
& cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVZ,cplSdcHpmcSu,cplcHpmVWmVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhHpmcHpm(5,8,8),cplAhcHpmVWm(5,8),cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),    & 
& cplcFuFdcHpmL(3,3,8),cplcFuFdcHpmR(3,3,8),cplhhHpmcHpm(5,8,8),cplhhcHpmVWm(5,8),       & 
& cplHpmcHpmVZ(8,8),cplSdcHpmcSu(6,8,6),cplcHpmVWmVZ(8)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Hpm_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
  Do gt3 = 1, 8
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,Mu,REps,Ye,Te,L1,T1,vd,vu,vL,ZA,               & 
& ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
  Do gt3 = 1, 8
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,Mu,REps,Ye,Te,L1,T1,vd,vu,vL,               & 
& ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 8
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Mu,REps,Yd,Td,Ye,L1,L2,T2,Yu,Tu,               & 
& vd,vu,vL,ZD,ZU,ZP,cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHpmVWm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
Call CouplingAhcHpmVWmT(gt1,gt2,g2,ZA,ZP,cplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWm = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 8
Call CouplinghhcHpmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 8
 Do gt2 = 1, 8
Call CouplingHpmcHpmVZT(gt1,gt2,g1,g2,ZP,TW,cplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


cplcHpmVWmVZ = 0._dp 
Do gt1 = 1, 8
Call CouplingcHpmVWmVZT(gt1,g1,g2,vd,vu,vL,ZP,TW,cplcHpmVWmVZ(gt1))

End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
  Do gt3 = 1, 8
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 8
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,L2,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Hpm_decays_2B
 
Subroutine CouplingsFor_Glu_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Glu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Glu_decays_2B
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,         & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcFuFuAhL(3,3,5),cplcFuFuAhR(3,3,5),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),        & 
& cplcFuFdcHpmL(3,3,8),cplcFuFdcHpmR(3,3,8),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuhhL(3,3,5),cplcFuFuhhR(3,3,5),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplcChacFuSdL(5,3,6),cplcChacFuSdR(5,3,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 8
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,L2,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Cha_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChacFuSdL,cplcChacFuSdR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChaChaAhL(5,5,5),cplcChaChaAhR(5,5,5),cplcChaChahhL(5,5,5),cplcChaChahhR(5,5,5),  & 
& cplcChaChaVZL(5,5),cplcChaChaVZR(5,5),cplcChaChiHpmL(5,7,8),cplcChaChiHpmR(5,7,8),     & 
& cplcChaChiVWmL(5,7),cplcChaChiVWmR(5,7),cplcChaFdcSuL(5,3,6),cplcChaFdcSuR(5,3,6),     & 
& cplcChacFuSdL(5,3,6),cplcChacFuSdR(5,3,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Cha_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,Ye,L1,ZA,ZEL,ZER,cplcChaChaAhL(gt1,gt2,gt3)    & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,Ye,L1,ZH,ZEL,ZER,cplcChaChahhL(gt1,gt2,gt3)    & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
  Do gt3 = 1, 8
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcChaChaVZL(gt1,gt2)               & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
Call CouplingcChaChiVWmT(gt1,gt2,g2,UV,ZEL,ZER,cplcChaChiVWmL(gt1,gt2),               & 
& cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Cha_decays_2B
 
Subroutine CouplingsFor_Chi_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFucSuL,cplChiFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplChiChiAhL(7,7,5),cplChiChiAhR(7,7,5),cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),  & 
& cplChiChacVWmL(7,5),cplChiChacVWmR(7,5),cplChiChihhL(7,7,5),cplChiChihhR(7,7,5),       & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),           & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Chi_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,ZA,UV,cplChiChiAhL(gt1,gt2,gt3)              & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
  Do gt3 = 1, 8
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,ZH,UV,cplChiChihhL(gt1,gt2,gt3)              & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
Call CouplingChiChacVWmT(gt1,gt2,g2,UV,ZEL,ZER,cplChiChacVWmL(gt1,gt2),               & 
& cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
Call CouplingChiChiVZT(gt1,gt2,g1,g2,UV,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Chi_decays_2B
 
Subroutine CouplingsFor_Glu_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplcChacFuSdL,cplcChacFuSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChacFuSdL(5,3,6),cplcChacFuSdR(5,3,6),cplcChaFdcSuL(5,3,6),cplcChaFdcSuR(5,3,6),  & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),           & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),           & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Glu_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Glu_decays_3B
 
Subroutine CouplingsFor_Sd_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplAhSdcSd,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVZ,cplSucSdVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSdcSd(5,6,6),cplcChacFuSdL(5,3,6),cplcChacFuSdR(5,3,6),cplcChaChaAhL(5,5,5),     & 
& cplcChaChaAhR(5,5,5),cplcChaChahhL(5,5,5),cplcChaChahhR(5,5,5),cplcChaChaVZL(5,5),     & 
& cplcChaChaVZR(5,5),cplcChaChiHpmL(5,7,8),cplcChaChiHpmR(5,7,8),cplcChaFdcSuL(5,3,6),   & 
& cplcChaFdcSuR(5,3,6),cplcFdChaSuL(3,5,6),cplcFdChaSuR(3,5,6),cplcFdChiSdL(3,7,6),      & 
& cplcFdChiSdR(3,7,6),cplcFdFdAhL(3,3,5),cplcFdFdAhR(3,3,5),cplcFdFdhhL(3,3,5),          & 
& cplcFdFdhhR(3,3,5),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,8),              & 
& cplcFdFuHpmR(3,3,8),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuChiSuL(3,7,6),           & 
& cplcFuChiSuR(3,7,6),cplcFuFdcHpmL(3,3,8),cplcFuFdcHpmR(3,3,8),cplcFuFdcVWmL(3,3),      & 
& cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,5),cplcFuFuAhR(3,3,5),cplcFuFuhhL(3,3,5),           & 
& cplcFuFuhhR(3,3,5),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),& 
& cplChaFucSdL(5,3,6),cplChaFucSdR(5,3,6),cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),   & 
& cplChiChacVWmL(7,5),cplChiChacVWmR(7,5),cplChiChiAhL(7,7,5),cplChiChiAhR(7,7,5),       & 
& cplChiChihhL(7,7,5),cplChiChihhR(7,7,5),cplChiChiVZL(7,7),cplChiChiVZR(7,7),           & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),               & 
& cplhhSdcSd(5,6,6),cplHpmSucSd(8,6,6),cplSdcSdVZ(6,6),cplSucSdVWm(6,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Sd_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplAhSdcSd = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Mu,REps,Yd,Td,L2,T2,vd,vL,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,Mu,REps,Yd,Td,L2,T2,vd,vu,vL,ZD,              & 
& ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSucSd = 0._dp 
Do gt1 = 1, 8
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSucSdT(gt1,gt2,gt3,g2,Mu,REps,Yd,Td,Ye,L1,L2,T2,Yu,Tu,vd,             & 
& vu,vL,ZD,ZU,ZP,cplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZT(gt1,gt2,g1,g2,ZD,TW,cplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


cplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSdVWmT(gt1,gt2,g2,ZD,ZU,cplSucSdVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,Ye,L1,ZA,ZEL,ZER,cplcChaChaAhL(gt1,gt2,gt3)    & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,ZA,UV,cplChiChiAhL(gt1,gt2,gt3)              & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,L2,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)           & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
  Do gt3 = 1, 8
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,Ye,L1,ZH,ZEL,ZER,cplcChaChahhL(gt1,gt2,gt3)    & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,ZH,UV,cplChiChihhL(gt1,gt2,gt3)              & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
  Do gt3 = 1, 8
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,L2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)           & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 8
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,L2,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 8
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,L2,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
Call CouplingChiChacVWmT(gt1,gt2,g2,UV,ZEL,ZER,cplChiChacVWmL(gt1,gt2),               & 
& cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcChaChaVZL(gt1,gt2)               & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
Call CouplingChiChiVZT(gt1,gt2,g1,g2,UV,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Sd_decays_3B
 
Subroutine CouplingsFor_Su_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplAhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,   & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplAhSucSu(5,6,6),cplcChacFuSdL(5,3,6),cplcChacFuSdR(5,3,6),cplcChaChaAhL(5,5,5),     & 
& cplcChaChaAhR(5,5,5),cplcChaChahhL(5,5,5),cplcChaChahhR(5,5,5),cplcChaChaVZL(5,5),     & 
& cplcChaChaVZR(5,5),cplcChaChiHpmL(5,7,8),cplcChaChiHpmR(5,7,8),cplcChaChiVWmL(5,7),    & 
& cplcChaChiVWmR(5,7),cplcChaFdcSuL(5,3,6),cplcChaFdcSuR(5,3,6),cplcFdChaSuL(3,5,6),     & 
& cplcFdChaSuR(3,5,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFdFdAhL(3,3,5),        & 
& cplcFdFdAhR(3,3,5),cplcFdFdhhL(3,3,5),cplcFdFdhhR(3,3,5),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,8),cplcFdFuHpmR(3,3,8),cplcFdFuVWmL(3,3),            & 
& cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuChiSuL(3,7,6),             & 
& cplcFuChiSuR(3,7,6),cplcFuFdcHpmL(3,3,8),cplcFuFdcHpmR(3,3,8),cplcFuFuAhL(3,3,5),      & 
& cplcFuFuAhR(3,3,5),cplcFuFuhhL(3,3,5),cplcFuFuhhR(3,3,5),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(5,3,6),              & 
& cplChaFucSdR(5,3,6),cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),cplChiChiAhL(7,7,5),   & 
& cplChiChiAhR(7,7,5),cplChiChihhL(7,7,5),cplChiChihhR(7,7,5),cplChiChiVZL(7,7),         & 
& cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),         & 
& cplChiFucSuR(7,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),             & 
& cplGluFucSuR(3,6),cplhhSucSu(5,6,6),cplSdcHpmcSu(6,8,6),cplSdcSucVWm(6,6),             & 
& cplSucSuVZ(6,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Su_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplAhSucSu = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,Mu,REps,Yu,Tu,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,Mu,REps,Yu,Tu,vd,vu,vL,ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 8
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Mu,REps,Yd,Td,Ye,L1,L2,T2,Yu,Tu,               & 
& vd,vu,vL,ZD,ZU,ZP,cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSucVWmT(gt1,gt2,g2,ZD,ZU,cplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


cplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZT(gt1,gt2,g1,g2,ZU,TW,cplSucSuVZ(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,Ye,L1,ZA,ZEL,ZER,cplcChaChaAhL(gt1,gt2,gt3)    & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,ZA,UV,cplChiChiAhL(gt1,gt2,gt3)              & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,L2,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)           & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
  Do gt3 = 1, 8
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,Ye,L1,ZH,ZEL,ZER,cplcChaChahhL(gt1,gt2,gt3)    & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,ZH,UV,cplChiChihhL(gt1,gt2,gt3)              & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
  Do gt3 = 1, 8
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,L2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)           & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 8
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,L2,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 8
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,L2,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcChaChaVZL(gt1,gt2)               & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
Call CouplingChiChiVZT(gt1,gt2,g1,g2,UV,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
Call CouplingcChaChiVWmT(gt1,gt2,g2,UV,ZEL,ZER,cplcChaChiVWmL(gt1,gt2),               & 
& cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Su_decays_3B
 
Subroutine CouplingsFor_Cha_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFuChiSuL,              & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,              & 
& cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChacFuSdL(5,3,6),cplcChacFuSdR(5,3,6),cplcChaChaAhL(5,5,5),cplcChaChaAhR(5,5,5),  & 
& cplcChaChahhL(5,5,5),cplcChaChahhR(5,5,5),cplcChaChaVZL(5,5),cplcChaChaVZR(5,5),       & 
& cplcChaChiHpmL(5,7,8),cplcChaChiHpmR(5,7,8),cplcChaChiVWmL(5,7),cplcChaChiVWmR(5,7),   & 
& cplcChaFdcSuL(5,3,6),cplcChaFdcSuR(5,3,6),cplcFdChaSuL(3,5,6),cplcFdChaSuR(3,5,6),     & 
& cplcFdFdAhL(3,3,5),cplcFdFdAhR(3,3,5),cplcFdFdhhL(3,3,5),cplcFdFdhhR(3,3,5),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),             & 
& cplcFuFdcHpmL(3,3,8),cplcFuFdcHpmR(3,3,8),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuAhL(3,3,5),cplcFuFuAhR(3,3,5),cplcFuFuhhL(3,3,5),cplcFuFuhhR(3,3,5),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(5,3,6),& 
& cplChaFucSdR(5,3,6),cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),cplChiChacVWmL(7,5),   & 
& cplChiChacVWmR(7,5),cplChiChiAhL(7,7,5),cplChiChiAhR(7,7,5),cplChiChihhL(7,7,5),       & 
& cplChiChihhR(7,7,5),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Cha_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,Ye,L1,ZA,ZEL,ZER,cplcChaChaAhL(gt1,gt2,gt3)    & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,ZA,UV,cplChiChiAhL(gt1,gt2,gt3)              & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,L2,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)           & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
  Do gt3 = 1, 8
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,Ye,L1,ZH,ZEL,ZER,cplcChaChahhL(gt1,gt2,gt3)    & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,ZH,UV,cplChiChihhL(gt1,gt2,gt3)              & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
  Do gt3 = 1, 8
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,L2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)           & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 8
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,L2,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
Call CouplingChiChacVWmT(gt1,gt2,g2,UV,ZEL,ZER,cplChiChacVWmL(gt1,gt2),               & 
& cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcChaChaVZL(gt1,gt2)               & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
Call CouplingChiChiVZT(gt1,gt2,g1,g2,UV,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
Call CouplingcChaChiVWmT(gt1,gt2,g2,UV,ZEL,ZER,cplcChaChiVWmL(gt1,gt2),               & 
& cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Cha_decays_3B
 
Subroutine CouplingsFor_Chi_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFuinput,MFu2input,MGluinput,       & 
& MGlu2input,Mhhinput,Mhh2input,MHpminput,MHpm2input,MSdinput,MSd2input,MSuinput,        & 
& MSu2input,MVWminput,MVWm2input,MVZinput,MVZ2input,pGinput,TWinput,ZELinput,            & 
& ZERinput,ZAinput,ZDinput,ZDLinput,ZDRinput,ZHinput,UVinput,ZPinput,ZUinput,            & 
& ZULinput,ZURinput,ZWinput,ZZinput,g1input,g2input,g3input,Ydinput,Yeinput,             & 
& L1input,L2input,Yuinput,Muinput,REpsinput,Tdinput,Teinput,T1input,T2input,             & 
& Tuinput,Bmuinput,Bepsinput,mq2input,ml2input,mHd2input,mHu2input,md2input,             & 
& mu2input,me2input,mlHd2input,M1input,M2input,M3input,vdinput,vuinput,vLinput,          & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdChaSuL,              & 
& cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,            & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,              & 
& cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,mHd2input,mHu2input,mlHd2input(3),vdinput,vuinput,            & 
& vLinput(3)

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),L1input(3,3,3),L2input(3,3,3),Yuinput(3,3),Muinput,         & 
& REpsinput(3),Tdinput(3,3),Teinput(3,3),T1input(3,3,3),T2input(3,3,3),Tuinput(3,3),     & 
& Bmuinput,Bepsinput(3),mq2input(3,3),ml2input(3,3),md2input(3,3),mu2input(3,3),         & 
& me2input(3,3),M1input,M2input,M3input

Real(dp),Intent(in) :: MAhinput(5),MAh2input(5),MChainput(5),MCha2input(5),MChiinput(7),MChi2input(7),       & 
& MFdinput(3),MFd2input(3),MFuinput(3),MFu2input(3),MGluinput,MGlu2input,Mhhinput(5),    & 
& Mhh2input(5),MHpminput(8),MHpm2input(8),MSdinput(6),MSd2input(6),MSuinput(6),          & 
& MSu2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,TWinput,ZAinput(5,5),             & 
& ZHinput(5,5),ZPinput(8,8),ZZinput(2,2)

Complex(dp),Intent(in) :: pGinput,ZELinput(5,5),ZERinput(5,5),ZDinput(6,6),ZDLinput(3,3),ZDRinput(3,3),         & 
& UVinput(7,7),ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp),Intent(out) :: cplcChaChaAhL(5,5,5),cplcChaChaAhR(5,5,5),cplcChaChahhL(5,5,5),cplcChaChahhR(5,5,5),  & 
& cplcChaChaVZL(5,5),cplcChaChaVZR(5,5),cplcChaChiHpmL(5,7,8),cplcChaChiHpmR(5,7,8),     & 
& cplcChaChiVWmL(5,7),cplcChaChiVWmR(5,7),cplcFdChaSuL(3,5,6),cplcFdChaSuR(3,5,6),       & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFdFdAhL(3,3,5),cplcFdFdAhR(3,3,5),         & 
& cplcFdFdhhL(3,3,5),cplcFdFdhhR(3,3,5),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFdFuHpmL(3,3,8),cplcFdFuHpmR(3,3,8),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),           & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),           & 
& cplcFuFuAhL(3,3,5),cplcFuFuAhR(3,3,5),cplcFuFuhhL(3,3,5),cplcFuFuhhR(3,3,5),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(5,3,6),& 
& cplChaFucSdR(5,3,6),cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),cplChiChacVWmL(7,5),   & 
& cplChiChacVWmR(7,5),cplChiChiAhL(7,7,5),cplChiChiAhR(7,7,5),cplChiChihhL(7,7,5),       & 
& cplChiChihhR(7,7,5),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp) ::  g1D(449) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Chi_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
Yd = Ydinput 
Ye = Yeinput 
L1 = L1input 
L2 = L2input 
Yu = Yuinput 
Mu = Muinput 
REps = REpsinput 
Td = Tdinput 
Te = Teinput 
T1 = T1input 
T2 = T2input 
Tu = Tuinput 
Bmu = Bmuinput 
Beps = Bepsinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
mlHd2 = mlHd2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
vd = vdinput 
vu = vuinput 
vL = vLinput 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,             & 
& Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,449,0._dp,tz,deltaM,dt,0._dp,rge449,kont)

End if 
Call GToParameters449(g1D,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,             & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,               & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,          & 
& Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,ZER,               & 
& ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,              & 
& Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,             & 
& M3,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZA = ZAinput 
ZD = ZDinput 
ZH = ZHinput 
UV = UVinput 
ZP = ZPinput 
ZU = ZUinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFu = MFuinput 
MFu2 = MFu2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSu = MSuinput 
MSu2 = MSu2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,Ye,L1,ZA,ZEL,ZER,cplcChaChaAhL(gt1,gt2,gt3)    & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,ZA,UV,cplChiChiAhL(gt1,gt2,gt3)              & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,L2,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)           & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
  Do gt3 = 1, 8
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZD,ZEL,ZER,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
  Do gt3 = 1, 5
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,Ye,L1,ZH,ZEL,ZER,cplcChaChahhL(gt1,gt2,gt3)    & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 5
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,L2,Yu,ZU,ZEL,ZER,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
  Do gt3 = 1, 5
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,ZH,UV,cplChiChihhL(gt1,gt2,gt3)              & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)   & 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
  Do gt3 = 1, 8
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,Ye,L1,ZP,UV,ZEL,ZER,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,Yd,L2,ZD,UV,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,Yu,ZU,UV,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)   & 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,L2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)           & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 5
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 8
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,L2,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 5
Call CouplingChiChacVWmT(gt1,gt2,g2,UV,ZEL,ZER,cplChiChacVWmL(gt1,gt2),               & 
& cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 5
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcChaChaVZL(gt1,gt2)               & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 7
Call CouplingChiChiVZT(gt1,gt2,g1,g2,UV,TW,cplChiChiVZL(gt1,gt2),cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 5
 Do gt2 = 1, 7
Call CouplingcChaChiVWmT(gt1,gt2,g2,UV,ZEL,ZER,cplcChaChiVWmL(gt1,gt2),               & 
& cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Chi_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_MSSMLV
