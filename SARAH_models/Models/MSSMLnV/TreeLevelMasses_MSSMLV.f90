! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:50 on 24.8.2021   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelMasses_MSSMLV 
 
Use Control 
Use Mathematics 
Use MathematicsQP 
Use Settings 
Use Model_Data_MSSMLV 
!Use StandardModel 
 
 
Logical :: SignOfMassChanged =.False.  
Logical :: SignOfMuChanged =.False.  
Contains 
 
Subroutine TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,               & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,               & 
& Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,             & 
& mlHd2,M1,M2,M3,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Real(dp),Intent(out) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp),Intent(out) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp),Intent(in) :: vd,vu,vL(3)

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Complex(dp) :: MGluC 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesMSSM-RpV/LnV'
 
kont = 0 
Call CalculateVPVZ(g1,g2,vd,vu,vL,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWm(g2,vd,vu,vL,ZW,MVWm,MVWm2,kont)

! ------------------------------- 
! Mass of Glu 
MGluC = M3 
If (RotateNegativeFermionMasses) Then 
pG = Abs(MGluC)/MGluC
pG = Sqrt(pG)
MGlu = Abs(MGluC) 
MGlu2 = MGlu**2 
Else 
pG = 1._dp
MGlu = Real(MGluC,dp) 
MGlu2 = MGlu**2 
End if
! ------------------------------- 
Call CalculateMSd(g1,g2,Mu,REps,Yd,Td,L2,T2,mq2,md2,vd,vu,vL,ZD,MSd,MSd2,kont)

Call CalculateMSu(g1,g2,Mu,REps,Yu,Tu,mq2,mu2,vd,vu,vL,ZU,MSu,MSu2,kont)

Call CalculateMhh(g1,g2,Mu,Bmu,REps,Beps,ml2,mlHd2,mHd2,mHu2,vd,vu,vL,ZH,             & 
& Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMAh(g1,g2,Mu,Bmu,REps,Beps,ml2,mlHd2,mHd2,mHu2,vd,vu,vL,TW,             & 
& ZA,MAh,MAh2,kont)

kont = kontSave 
kontSave = kont 
Call CalculateMHpm(g1,g2,Mu,Bmu,REps,Beps,Ye,Te,L1,T1,ml2,mlHd2,mHd2,mHu2,            & 
& me2,vd,vu,vL,ZP,MHpm,MHpm2,kont)

kont = kontSave 
Call CalculateMChi(g1,g2,Mu,REps,M1,M2,vd,vu,vL,UV,MChi,kont)

MChi2 = MChi**2 
Call CalculateMCha(g2,Mu,REps,Ye,L1,M2,vd,vu,vL,ZEL,ZER,MCha,kont)

MCha2 = MCha**2 
Call CalculateMFd(Yd,L2,vd,vL,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 

 
 Call SortGoldstones(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MGlu,            & 
& MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,TW,ZEL,             & 
& ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,kont)

If ((HighScaleModel.Eq."LOW").and.(.not.SUSYrunningFromMZ)) Then 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
End if 
 
 ! -------------------------------- 
! Setting Goldstone masses 
! -------------------------------- 
 
MAh(1)=MVZ*sqrt(RXiZ)
MAh2(1)=MVZ2*RXiZ
MHpm(1)=MVWm*sqrt(RXiWm)
MHpm2(1)=MVWm2*RXiWm
TW = ACos(Abs(ZZ(1,1)))
Iname = Iname - 1 
 
End Subroutine  TreeMasses 
 
 
Subroutine RunningFermionMasses(MChaIN,MCha2IN,MFdIN,MFd2IN,MFuIN,MFu2IN,             & 
& vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,              & 
& mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,kont)

Implicit None 
 
Integer, Intent(inout) :: kont 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vL(3)

Real(dp),Intent(inout) :: MChaIN(5),MCha2IN(5),MFdIN(3),MFd2IN(3),MFuIN(3),MFu2IN(3)

Real(dp) :: MCha(5),MCha2(5),MFd(3),MFd2(3),MFu(3),MFu2(3)

Call CalculateMCha(g2,Mu,REps,Ye,L1,M2,vd,vu,vL,ZEL,ZER,MCha,kont)

MCha2 = MCha**2 
MChaIN(1:2) = MCha(1:2) 
MCha2IN(1:2) = MCha2(1:2) 
Call CalculateMFd(Yd,L2,vd,vL,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
MFdIN(1:2) = MFd(1:2) 
MFd2IN(1:2) = MFd2(1:2) 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
MFuIN(1:2) = MFu(1:2) 
MFu2IN(1:2) = MFu2(1:2) 
End Subroutine RunningFermionMasses 

Subroutine TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,              & 
& MFu2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,             & 
& pG,TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,               & 
& Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,              & 
& me2,mlHd2,M1,M2,M3,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Real(dp),Intent(out) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp),Intent(out) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Real(dp),Intent(in) :: vd,vu,vL(3)

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Complex(dp) :: MGluC 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesMSSM-RpV/LnV'
 
kont = 0 
Call CalculateVPVZEffPot(g1,g2,vd,vu,vL,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWmEffPot(g2,vd,vu,vL,ZW,MVWm,MVWm2,kont)

! ------------------------------- 
! Mass of Glu 
MGluC = M3 
If (RotateNegativeFermionMasses) Then 
pG = Abs(MGluC)/MGluC
pG = Sqrt(pG)
MGlu = Abs(MGluC) 
MGlu2 = MGlu**2 
Else 
pG = 1._dp
MGlu = Real(MGluC,dp) 
MGlu2 = MGlu**2 
End if
! ------------------------------- 
Call CalculateMSdEffPot(g1,g2,Mu,REps,Yd,Td,L2,T2,mq2,md2,vd,vu,vL,ZD,MSd,            & 
& MSd2,kont)

Call CalculateMSuEffPot(g1,g2,Mu,REps,Yu,Tu,mq2,mu2,vd,vu,vL,ZU,MSu,MSu2,kont)

Call CalculateMhhEffPot(g1,g2,Mu,Bmu,REps,Beps,ml2,mlHd2,mHd2,mHu2,vd,vu,             & 
& vL,ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMAhEffPot(g1,g2,Mu,Bmu,REps,Beps,ml2,mlHd2,mHd2,mHu2,vd,vu,             & 
& vL,TW,ZA,MAh,MAh2,kont)

kont = kontSave 
kontSave = kont 
Call CalculateMHpmEffPot(g1,g2,Mu,Bmu,REps,Beps,Ye,Te,L1,T1,ml2,mlHd2,mHd2,           & 
& mHu2,me2,vd,vu,vL,ZP,MHpm,MHpm2,kont)

kont = kontSave 
Call CalculateMChiEffPot(g1,g2,Mu,REps,M1,M2,vd,vu,vL,UV,MChi,kont)

MChi2 = MChi**2 
Call CalculateMChaEffPot(g2,Mu,REps,Ye,L1,M2,vd,vu,vL,ZEL,ZER,MCha,kont)

MCha2 = MCha**2 
Call CalculateMFdEffPot(Yd,L2,vd,vL,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFuEffPot(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 

 
 If ((HighScaleModel.Eq."LOW").and.(.not.SUSYrunningFromMZ)) Then 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
End if 
 Iname = Iname - 1 
 
End Subroutine  TreeMassesEffPot 
 
 
Subroutine CalculateMSd(g1,g2,Mu,REps,Yd,Td,L2,T2,mq2,md2,vd,vu,vL,ZD,MSd,            & 
& MSd2,kont)

Real(dp), Intent(in) :: g1,g2,vd,vu,vL(3)

Complex(dp), Intent(in) :: Mu,REps(3),Yd(3,3),Td(3,3),L2(3,3,3),T2(3,3,3),mq2(3,3),md2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSd(6), MSd2(6) 
Complex(dp), Intent(out) :: ZD(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSd'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(g1**2*vd**2)/24._dp
mat(1,1) = mat(1,1)-(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(g1**2*vu**2)/24._dp
mat(1,1) = mat(1,1)+(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+mq2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd*Conjg(Yd(j1,1))*L2(j2,1,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd*Conjg(L2(j2,1,j1))*vL(j2)*Yd(j1,1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,1) = mat(1,1)+(Conjg(L2(j3,1,j1))*L2(j2,1,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+mq2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd*Conjg(Yd(j1,1))*L2(j2,2,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd*Conjg(L2(j2,1,j1))*vL(j2)*Yd(j1,2))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,2) = mat(1,2)+(Conjg(L2(j3,1,j1))*L2(j2,2,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mq2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd*Conjg(Yd(j1,1))*L2(j2,3,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd*Conjg(L2(j2,1,j1))*vL(j2)*Yd(j1,3))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)+(Conjg(L2(j3,1,j1))*L2(j2,3,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-((vu*Mu*Conjg(Yd(1,1)))/sqrt(2._dp))
mat(1,4) = mat(1,4)+(vd*Conjg(Td(1,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,4) = mat(1,4)+(Conjg(T2(j1,1,1))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(1,4) = mat(1,4)+(vu*Conjg(L2(j1,1,1))*REps(j1))/sqrt(2._dp)
End Do 
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-((vu*Mu*Conjg(Yd(2,1)))/sqrt(2._dp))
mat(1,5) = mat(1,5)+(vd*Conjg(Td(2,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,5) = mat(1,5)+(Conjg(T2(j1,1,2))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(1,5) = mat(1,5)+(vu*Conjg(L2(j1,1,2))*REps(j1))/sqrt(2._dp)
End Do 
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-((vu*Mu*Conjg(Yd(3,1)))/sqrt(2._dp))
mat(1,6) = mat(1,6)+(vd*Conjg(Td(3,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,6) = mat(1,6)+(Conjg(T2(j1,1,3))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(1,6) = mat(1,6)+(vu*Conjg(L2(j1,1,3))*REps(j1))/sqrt(2._dp)
End Do 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(g1**2*vd**2)/24._dp
mat(2,2) = mat(2,2)-(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2)/24._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+mq2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd*Conjg(Yd(j1,2))*L2(j2,2,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd*Conjg(L2(j2,2,j1))*vL(j2)*Yd(j1,2))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(2,2) = mat(2,2)+(Conjg(L2(j3,2,j1))*L2(j2,2,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+mq2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd*Conjg(Yd(j1,2))*L2(j2,3,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd*Conjg(L2(j2,2,j1))*vL(j2)*Yd(j1,3))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(2,3) = mat(2,3)+(Conjg(L2(j3,2,j1))*L2(j2,3,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-((vu*Mu*Conjg(Yd(1,2)))/sqrt(2._dp))
mat(2,4) = mat(2,4)+(vd*Conjg(Td(1,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,4) = mat(2,4)+(Conjg(T2(j1,2,1))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(2,4) = mat(2,4)+(vu*Conjg(L2(j1,2,1))*REps(j1))/sqrt(2._dp)
End Do 
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-((vu*Mu*Conjg(Yd(2,2)))/sqrt(2._dp))
mat(2,5) = mat(2,5)+(vd*Conjg(Td(2,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,5) = mat(2,5)+(Conjg(T2(j1,2,2))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(2,5) = mat(2,5)+(vu*Conjg(L2(j1,2,2))*REps(j1))/sqrt(2._dp)
End Do 
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-((vu*Mu*Conjg(Yd(3,2)))/sqrt(2._dp))
mat(2,6) = mat(2,6)+(vd*Conjg(Td(3,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,6) = mat(2,6)+(Conjg(T2(j1,2,3))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(2,6) = mat(2,6)+(vu*Conjg(L2(j1,2,3))*REps(j1))/sqrt(2._dp)
End Do 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-(g1**2*vd**2)/24._dp
mat(3,3) = mat(3,3)-(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(g1**2*vu**2)/24._dp
mat(3,3) = mat(3,3)+(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+mq2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd**2*Conjg(Yd(j1,3))*Yd(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd*Conjg(Yd(j1,3))*L2(j2,3,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd*Conjg(L2(j2,3,j1))*vL(j2)*Yd(j1,3))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(Conjg(L2(j3,3,j1))*L2(j2,3,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-((vu*Mu*Conjg(Yd(1,3)))/sqrt(2._dp))
mat(3,4) = mat(3,4)+(vd*Conjg(Td(1,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,4) = mat(3,4)+(Conjg(T2(j1,3,1))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(3,4) = mat(3,4)+(vu*Conjg(L2(j1,3,1))*REps(j1))/sqrt(2._dp)
End Do 
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-((vu*Mu*Conjg(Yd(2,3)))/sqrt(2._dp))
mat(3,5) = mat(3,5)+(vd*Conjg(Td(2,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,5) = mat(3,5)+(Conjg(T2(j1,3,2))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(3,5) = mat(3,5)+(vu*Conjg(L2(j1,3,2))*REps(j1))/sqrt(2._dp)
End Do 
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-((vu*Mu*Conjg(Yd(3,3)))/sqrt(2._dp))
mat(3,6) = mat(3,6)+(vd*Conjg(Td(3,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,6) = mat(3,6)+(Conjg(T2(j1,3,3))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(3,6) = mat(3,6)+(vu*Conjg(L2(j1,3,3))*REps(j1))/sqrt(2._dp)
End Do 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-(g1**2*vd**2)/12._dp
mat(4,4) = mat(4,4)+(g1**2*vu**2)/12._dp
mat(4,4) = mat(4,4)+md2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)-(g1**2*vL(j1)**2)/12._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd**2*Conjg(Yd(1,j1))*Yd(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd*Conjg(Yd(1,j1))*L2(j2,j1,1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd*Conjg(L2(j2,j1,1))*vL(j2)*Yd(1,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(Conjg(L2(j3,j1,1))*L2(j2,j1,1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+md2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd**2*Conjg(Yd(2,j1))*Yd(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd*Conjg(Yd(2,j1))*L2(j2,j1,1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd*Conjg(L2(j2,j1,2))*vL(j2)*Yd(1,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(Conjg(L2(j3,j1,2))*L2(j2,j1,1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+md2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd**2*Conjg(Yd(3,j1))*Yd(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd*Conjg(Yd(3,j1))*L2(j2,j1,1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd*Conjg(L2(j2,j1,3))*vL(j2)*Yd(1,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,6) = mat(4,6)+(Conjg(L2(j3,j1,3))*L2(j2,j1,1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)-(g1**2*vd**2)/12._dp
mat(5,5) = mat(5,5)+(g1**2*vu**2)/12._dp
mat(5,5) = mat(5,5)+md2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)-(g1**2*vL(j1)**2)/12._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd**2*Conjg(Yd(2,j1))*Yd(2,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd*Conjg(Yd(2,j1))*L2(j2,j1,2)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd*Conjg(L2(j2,j1,2))*vL(j2)*Yd(2,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(Conjg(L2(j3,j1,2))*L2(j2,j1,2)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+md2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd**2*Conjg(Yd(3,j1))*Yd(2,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd*Conjg(Yd(3,j1))*L2(j2,j1,2)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd*Conjg(L2(j2,j1,3))*vL(j2)*Yd(2,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,6) = mat(5,6)+(Conjg(L2(j3,j1,3))*L2(j2,j1,2)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)-(g1**2*vd**2)/12._dp
mat(6,6) = mat(6,6)+(g1**2*vu**2)/12._dp
mat(6,6) = mat(6,6)+md2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)-(g1**2*vL(j1)**2)/12._dp
End Do 
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd**2*Conjg(Yd(3,j1))*Yd(3,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd*Conjg(Yd(3,j1))*L2(j2,j1,3)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd*Conjg(L2(j2,j1,3))*vL(j2)*Yd(3,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(Conjg(L2(j3,j1,3))*L2(j2,j1,3)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSd2,ZD,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Abs(MSd2(i1)).Le.MaxMassNumericalZero) MSd2(i1) = 1.E-10_dp 
  If (MSd2(i1).ne.MSd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSd2(i1).Ge.0._dp) Then 
  MSd(i1)=Sqrt(MSd2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MSd2(i1) 
    End If 
  MSd(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MSd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MSd2(i1) 
  MSd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSd 

Subroutine CalculateMSu(g1,g2,Mu,REps,Yu,Tu,mq2,mu2,vd,vu,vL,ZU,MSu,MSu2,kont)

Real(dp), Intent(in) :: g1,g2,vd,vu,vL(3)

Complex(dp), Intent(in) :: Mu,REps(3),Yu(3,3),Tu(3,3),mq2(3,3),mu2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSu(6), MSu2(6) 
Complex(dp), Intent(out) :: ZU(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSu'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(g1**2*vd**2)/24._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(g1**2*vu**2)/24._dp
mat(1,1) = mat(1,1)-(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+mq2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+mq2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,2))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mq2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,3))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-((vd*Mu*Conjg(Yu(1,1)))/sqrt(2._dp))
mat(1,4) = mat(1,4)+(vu*Conjg(Tu(1,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,4) = mat(1,4)+(Conjg(Yu(1,1))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-((vd*Mu*Conjg(Yu(2,1)))/sqrt(2._dp))
mat(1,5) = mat(1,5)+(vu*Conjg(Tu(2,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,5) = mat(1,5)+(Conjg(Yu(2,1))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-((vd*Mu*Conjg(Yu(3,1)))/sqrt(2._dp))
mat(1,6) = mat(1,6)+(vu*Conjg(Tu(3,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,6) = mat(1,6)+(Conjg(Yu(3,1))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(g1**2*vd**2)/24._dp
mat(2,2) = mat(2,2)+(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2)/24._dp
mat(2,2) = mat(2,2)-(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+mq2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,2))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+mq2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,3))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-((vd*Mu*Conjg(Yu(1,2)))/sqrt(2._dp))
mat(2,4) = mat(2,4)+(vu*Conjg(Tu(1,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,4) = mat(2,4)+(Conjg(Yu(1,2))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-((vd*Mu*Conjg(Yu(2,2)))/sqrt(2._dp))
mat(2,5) = mat(2,5)+(vu*Conjg(Tu(2,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,5) = mat(2,5)+(Conjg(Yu(2,2))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-((vd*Mu*Conjg(Yu(3,2)))/sqrt(2._dp))
mat(2,6) = mat(2,6)+(vu*Conjg(Tu(3,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,6) = mat(2,6)+(Conjg(Yu(3,2))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-(g1**2*vd**2)/24._dp
mat(3,3) = mat(3,3)+(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(g1**2*vu**2)/24._dp
mat(3,3) = mat(3,3)-(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+mq2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vu**2*Conjg(Yu(j1,3))*Yu(j1,3))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-((vd*Mu*Conjg(Yu(1,3)))/sqrt(2._dp))
mat(3,4) = mat(3,4)+(vu*Conjg(Tu(1,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,4) = mat(3,4)+(Conjg(Yu(1,3))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-((vd*Mu*Conjg(Yu(2,3)))/sqrt(2._dp))
mat(3,5) = mat(3,5)+(vu*Conjg(Tu(2,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,5) = mat(3,5)+(Conjg(Yu(2,3))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-((vd*Mu*Conjg(Yu(3,3)))/sqrt(2._dp))
mat(3,6) = mat(3,6)+(vu*Conjg(Tu(3,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,6) = mat(3,6)+(Conjg(Yu(3,3))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vd**2)/6._dp
mat(4,4) = mat(4,4)-(g1**2*vu**2)/6._dp
mat(4,4) = mat(4,4)+mu2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g1**2*vL(j1)**2)/6._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vu**2*Conjg(Yu(1,j1))*Yu(1,j1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mu2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vu**2*Conjg(Yu(2,j1))*Yu(1,j1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mu2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vu**2*Conjg(Yu(3,j1))*Yu(1,j1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vd**2)/6._dp
mat(5,5) = mat(5,5)-(g1**2*vu**2)/6._dp
mat(5,5) = mat(5,5)+mu2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g1**2*vL(j1)**2)/6._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vu**2*Conjg(Yu(2,j1))*Yu(2,j1))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mu2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vu**2*Conjg(Yu(3,j1))*Yu(2,j1))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+(g1**2*vd**2)/6._dp
mat(6,6) = mat(6,6)-(g1**2*vu**2)/6._dp
mat(6,6) = mat(6,6)+mu2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(g1**2*vL(j1)**2)/6._dp
End Do 
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vu**2*Conjg(Yu(3,j1))*Yu(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSu2,ZU,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Abs(MSu2(i1)).Le.MaxMassNumericalZero) MSu2(i1) = 1.E-10_dp 
  If (MSu2(i1).ne.MSu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSu2(i1).Ge.0._dp) Then 
  MSu(i1)=Sqrt(MSu2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MSu2(i1) 
    End If 
  MSu(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MSu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MSu2(i1) 
  MSu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSu 

Subroutine CalculateMhh(g1,g2,Mu,Bmu,REps,Beps,ml2,mlHd2,mHd2,mHu2,vd,vu,             & 
& vL,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: g1,g2,mlHd2(3),mHd2,mHu2,vd,vu,vL(3)

Complex(dp), Intent(in) :: Mu,Bmu,REps(3),Beps(3),ml2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(5), Mhh2(5) 
Real(dp), Intent(out) :: ZH(5,5) 
 
Real(dp) :: mat(5,5)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(3*g1**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(3*g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)-(g1**2*vu**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+Mu*Conjg(Mu)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1**2*vd*vu)/4._dp
mat(1,2) = mat(1,2)-(g2**2*vd*vu)/4._dp
mat(1,2) = mat(1,2)-Bmu/2._dp
mat(1,2) = mat(1,2)-Conjg(Bmu)/2._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(Mu*Conjg(REps(1)))/2._dp
mat(1,3) = mat(1,3)+mlHd2(1)
mat(1,3) = mat(1,3)+(g1**2*vd*vL(1))/4._dp
mat(1,3) = mat(1,3)+(g2**2*vd*vL(1))/4._dp
mat(1,3) = mat(1,3)-(Conjg(Mu)*REps(1))/2._dp
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(Mu*Conjg(REps(2)))/2._dp
mat(1,4) = mat(1,4)+mlHd2(2)
mat(1,4) = mat(1,4)+(g1**2*vd*vL(2))/4._dp
mat(1,4) = mat(1,4)+(g2**2*vd*vL(2))/4._dp
mat(1,4) = mat(1,4)-(Conjg(Mu)*REps(2))/2._dp
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(Mu*Conjg(REps(3)))/2._dp
mat(1,5) = mat(1,5)+mlHd2(3)
mat(1,5) = mat(1,5)+(g1**2*vd*vL(3))/4._dp
mat(1,5) = mat(1,5)+(g2**2*vd*vL(3))/4._dp
mat(1,5) = mat(1,5)-(Conjg(Mu)*REps(3))/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vd**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(3*g1**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(3*g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+Mu*Conjg(Mu)
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+Conjg(REps(j1))*REps(j1)
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+Conjg(Beps(1))/2._dp
mat(2,3) = mat(2,3)-(g1**2*vu*vL(1))/4._dp
mat(2,3) = mat(2,3)-(g2**2*vu*vL(1))/4._dp
mat(2,3) = mat(2,3)+Beps(1)/2._dp
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+Conjg(Beps(2))/2._dp
mat(2,4) = mat(2,4)-(g1**2*vu*vL(2))/4._dp
mat(2,4) = mat(2,4)-(g2**2*vu*vL(2))/4._dp
mat(2,4) = mat(2,4)+Beps(2)/2._dp
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+Conjg(Beps(3))/2._dp
mat(2,5) = mat(2,5)-(g1**2*vu*vL(3))/4._dp
mat(2,5) = mat(2,5)-(g2**2*vu*vL(3))/4._dp
mat(2,5) = mat(2,5)+Beps(3)/2._dp
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)-(g1**2*vu**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+ml2(1,1)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(3,3) = mat(3,3)+(g1**2*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+Conjg(REps(1))*REps(1)
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+ml2(1,2)/2._dp
mat(3,4) = mat(3,4)+ml2(2,1)/2._dp
mat(3,4) = mat(3,4)+(g1**2*vL(1)*vL(2))/4._dp
mat(3,4) = mat(3,4)+(g2**2*vL(1)*vL(2))/4._dp
mat(3,4) = mat(3,4)+(Conjg(REps(2))*REps(1))/2._dp
mat(3,4) = mat(3,4)+(Conjg(REps(1))*REps(2))/2._dp
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+ml2(1,3)/2._dp
mat(3,5) = mat(3,5)+ml2(3,1)/2._dp
mat(3,5) = mat(3,5)+(g1**2*vL(1)*vL(3))/4._dp
mat(3,5) = mat(3,5)+(g2**2*vL(1)*vL(3))/4._dp
mat(3,5) = mat(3,5)+(Conjg(REps(3))*REps(1))/2._dp
mat(3,5) = mat(3,5)+(Conjg(REps(1))*REps(3))/2._dp
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vd**2)/8._dp
mat(4,4) = mat(4,4)+(g2**2*vd**2)/8._dp
mat(4,4) = mat(4,4)-(g1**2*vu**2)/8._dp
mat(4,4) = mat(4,4)-(g2**2*vu**2)/8._dp
mat(4,4) = mat(4,4)+ml2(2,2)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(4,4) = mat(4,4)+(g1**2*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+(g2**2*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+Conjg(REps(2))*REps(2)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+ml2(2,3)/2._dp
mat(4,5) = mat(4,5)+ml2(3,2)/2._dp
mat(4,5) = mat(4,5)+(g1**2*vL(2)*vL(3))/4._dp
mat(4,5) = mat(4,5)+(g2**2*vL(2)*vL(3))/4._dp
mat(4,5) = mat(4,5)+(Conjg(REps(3))*REps(2))/2._dp
mat(4,5) = mat(4,5)+(Conjg(REps(2))*REps(3))/2._dp
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vd**2)/8._dp
mat(5,5) = mat(5,5)+(g2**2*vd**2)/8._dp
mat(5,5) = mat(5,5)-(g1**2*vu**2)/8._dp
mat(5,5) = mat(5,5)-(g2**2*vu**2)/8._dp
mat(5,5) = mat(5,5)+ml2(3,3)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(5,5) = mat(5,5)+(g1**2*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+(g2**2*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+Conjg(REps(3))*REps(3)

 
 Do i1=2,5
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,5
  If (Abs(Mhh2(i1)).Le.MaxMassNumericalZero) Mhh2(i1) = 1.E-10_dp 
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Mhh2(i1) 
    End If 
  Mhh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Mhh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Mhh2(i1) 
  Mhh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhh 

Subroutine CalculateMAh(g1,g2,Mu,Bmu,REps,Beps,ml2,mlHd2,mHd2,mHu2,vd,vu,             & 
& vL,TW,ZA,MAh,MAh2,kont)

Real(dp), Intent(in) :: g1,g2,mlHd2(3),mHd2,mHu2,vd,vu,vL(3),TW

Complex(dp), Intent(in) :: Mu,Bmu,REps(3),Beps(3),ml2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MAh(5), MAh2(5) 
Real(dp), Intent(out) :: ZA(5,5) 
 
Real(dp) :: mat(5,5)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMAh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(g1**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)-(g1**2*vu**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+Mu*Conjg(Mu)
mat(1,1) = mat(1,1)+(g2**2*vd**2*Cos(TW)**2*RXiZ)/4._dp
mat(1,1) = mat(1,1)+(g1*g2*vd**2*Cos(TW)*RXiZ*Sin(TW))/2._dp
mat(1,1) = mat(1,1)+(g1**2*vd**2*RXiZ*Sin(TW)**2)/4._dp
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+Bmu/2._dp
mat(1,2) = mat(1,2)+Conjg(Bmu)/2._dp
mat(1,2) = mat(1,2)-(g2**2*vd*vu*Cos(TW)**2*RXiZ)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vd*vu*Cos(TW)*RXiZ*Sin(TW))/2._dp
mat(1,2) = mat(1,2)-(g1**2*vd*vu*RXiZ*Sin(TW)**2)/4._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(Mu*Conjg(REps(1)))/2._dp
mat(1,3) = mat(1,3)+mlHd2(1)
mat(1,3) = mat(1,3)+(g2**2*vd*Cos(TW)**2*RXiZ*vL(1))/4._dp
mat(1,3) = mat(1,3)+(g1*g2*vd*Cos(TW)*RXiZ*Sin(TW)*vL(1))/2._dp
mat(1,3) = mat(1,3)+(g1**2*vd*RXiZ*Sin(TW)**2*vL(1))/4._dp
mat(1,3) = mat(1,3)-(Conjg(Mu)*REps(1))/2._dp
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(Mu*Conjg(REps(2)))/2._dp
mat(1,4) = mat(1,4)+mlHd2(2)
mat(1,4) = mat(1,4)+(g2**2*vd*Cos(TW)**2*RXiZ*vL(2))/4._dp
mat(1,4) = mat(1,4)+(g1*g2*vd*Cos(TW)*RXiZ*Sin(TW)*vL(2))/2._dp
mat(1,4) = mat(1,4)+(g1**2*vd*RXiZ*Sin(TW)**2*vL(2))/4._dp
mat(1,4) = mat(1,4)-(Conjg(Mu)*REps(2))/2._dp
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(Mu*Conjg(REps(3)))/2._dp
mat(1,5) = mat(1,5)+mlHd2(3)
mat(1,5) = mat(1,5)+(g2**2*vd*Cos(TW)**2*RXiZ*vL(3))/4._dp
mat(1,5) = mat(1,5)+(g1*g2*vd*Cos(TW)*RXiZ*Sin(TW)*vL(3))/2._dp
mat(1,5) = mat(1,5)+(g1**2*vd*RXiZ*Sin(TW)**2*vL(3))/4._dp
mat(1,5) = mat(1,5)-(Conjg(Mu)*REps(3))/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vd**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+Mu*Conjg(Mu)
mat(2,2) = mat(2,2)+(g2**2*vu**2*Cos(TW)**2*RXiZ)/4._dp
mat(2,2) = mat(2,2)+(g1*g2*vu**2*Cos(TW)*RXiZ*Sin(TW))/2._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2*RXiZ*Sin(TW)**2)/4._dp
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+Conjg(REps(j1))*REps(j1)
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-Conjg(Beps(1))/2._dp
mat(2,3) = mat(2,3)-(g2**2*vu*Cos(TW)**2*RXiZ*vL(1))/4._dp
mat(2,3) = mat(2,3)-(g1*g2*vu*Cos(TW)*RXiZ*Sin(TW)*vL(1))/2._dp
mat(2,3) = mat(2,3)-(g1**2*vu*RXiZ*Sin(TW)**2*vL(1))/4._dp
mat(2,3) = mat(2,3)-Beps(1)/2._dp
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-Conjg(Beps(2))/2._dp
mat(2,4) = mat(2,4)-(g2**2*vu*Cos(TW)**2*RXiZ*vL(2))/4._dp
mat(2,4) = mat(2,4)-(g1*g2*vu*Cos(TW)*RXiZ*Sin(TW)*vL(2))/2._dp
mat(2,4) = mat(2,4)-(g1**2*vu*RXiZ*Sin(TW)**2*vL(2))/4._dp
mat(2,4) = mat(2,4)-Beps(2)/2._dp
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-Conjg(Beps(3))/2._dp
mat(2,5) = mat(2,5)-(g2**2*vu*Cos(TW)**2*RXiZ*vL(3))/4._dp
mat(2,5) = mat(2,5)-(g1*g2*vu*Cos(TW)*RXiZ*Sin(TW)*vL(3))/2._dp
mat(2,5) = mat(2,5)-(g1**2*vu*RXiZ*Sin(TW)**2*vL(3))/4._dp
mat(2,5) = mat(2,5)-Beps(3)/2._dp
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)-(g1**2*vu**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+ml2(1,1)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(3,3) = mat(3,3)+(g2**2*Cos(TW)**2*RXiZ*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+(g1*g2*Cos(TW)*RXiZ*Sin(TW)*vL(1)**2)/2._dp
mat(3,3) = mat(3,3)+(g1**2*RXiZ*Sin(TW)**2*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+Conjg(REps(1))*REps(1)
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+ml2(1,2)/2._dp
mat(3,4) = mat(3,4)+ml2(2,1)/2._dp
mat(3,4) = mat(3,4)+(Conjg(REps(2))*REps(1))/2._dp
mat(3,4) = mat(3,4)+(Conjg(REps(1))*REps(2))/2._dp
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+ml2(1,3)/2._dp
mat(3,5) = mat(3,5)+ml2(3,1)/2._dp
mat(3,5) = mat(3,5)+(Conjg(REps(3))*REps(1))/2._dp
mat(3,5) = mat(3,5)+(Conjg(REps(1))*REps(3))/2._dp
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vd**2)/8._dp
mat(4,4) = mat(4,4)+(g2**2*vd**2)/8._dp
mat(4,4) = mat(4,4)-(g1**2*vu**2)/8._dp
mat(4,4) = mat(4,4)-(g2**2*vu**2)/8._dp
mat(4,4) = mat(4,4)+ml2(2,2)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(4,4) = mat(4,4)+(g2**2*Cos(TW)**2*RXiZ*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+(g1*g2*Cos(TW)*RXiZ*Sin(TW)*vL(2)**2)/2._dp
mat(4,4) = mat(4,4)+(g1**2*RXiZ*Sin(TW)**2*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+Conjg(REps(2))*REps(2)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+ml2(2,3)/2._dp
mat(4,5) = mat(4,5)+ml2(3,2)/2._dp
mat(4,5) = mat(4,5)+(Conjg(REps(3))*REps(2))/2._dp
mat(4,5) = mat(4,5)+(Conjg(REps(2))*REps(3))/2._dp
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vd**2)/8._dp
mat(5,5) = mat(5,5)+(g2**2*vd**2)/8._dp
mat(5,5) = mat(5,5)-(g1**2*vu**2)/8._dp
mat(5,5) = mat(5,5)-(g2**2*vu**2)/8._dp
mat(5,5) = mat(5,5)+ml2(3,3)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(5,5) = mat(5,5)+(g2**2*Cos(TW)**2*RXiZ*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+(g1*g2*Cos(TW)*RXiZ*Sin(TW)*vL(3)**2)/2._dp
mat(5,5) = mat(5,5)+(g1**2*RXiZ*Sin(TW)**2*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+Conjg(REps(3))*REps(3)

 
 Do i1=2,5
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MAh2,ZA,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,5
  If (Abs(MAh2(i1)).Le.MaxMassNumericalZero) MAh2(i1) = 1.E-10_dp 
  If (MAh2(i1).ne.MAh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MAh2(i1).Ge.0._dp) Then 
  MAh(i1)=Sqrt(MAh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MAh2(i1) 
    End If 
  MAh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MAh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MAh2(i1) 
  MAh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMAh 

Subroutine CalculateMHpm(g1,g2,Mu,Bmu,REps,Beps,Ye,Te,L1,T1,ml2,mlHd2,mHd2,           & 
& mHu2,me2,vd,vu,vL,ZP,MHpm,MHpm2,kont)

Real(dp), Intent(in) :: g1,g2,mlHd2(3),mHd2,mHu2,vd,vu,vL(3)

Complex(dp), Intent(in) :: Mu,Bmu,REps(3),Beps(3),Ye(3,3),Te(3,3),L1(3,3,3),T1(3,3,3),ml2(3,3),me2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MHpm(8), MHpm2(8) 
Real(dp), Intent(out) :: ZP(8,8) 
 
Real(dp) :: mat(8,8)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHpm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(g1**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)-(g1**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+Mu*Conjg(Mu)
mat(1,1) = mat(1,1)+(g2**2*vd**2*RXiWm)/4._dp
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,1) = mat(1,1)+(Conjg(Ye(j1,j3))*vL(j2)*vL(j3)*Ye(j1,j2))/2._dp
End Do 
End Do 
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(g2**2*vd*vu)/4._dp
mat(1,2) = mat(1,2)+Conjg(Bmu)
mat(1,2) = mat(1,2)-(g2**2*vd*vu*RXiWm)/4._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mlHd2(1)
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)-(vd*Conjg(Ye(j1,j2))*vL(j2)*Ye(j1,1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)+(Conjg(Ye(j1,j3))*L1(1,j2,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)-(Conjg(Ye(j1,j3))*L1(j2,1,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
mat(1,3) = mat(1,3)+(g2**2*vd*vL(1))/4._dp
mat(1,3) = mat(1,3)+(g2**2*vd*RXiWm*vL(1))/4._dp
mat(1,3) = mat(1,3)-(Conjg(Mu)*REps(1))
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+mlHd2(2)
Do j2 = 1,3
Do j1 = 1,3
mat(1,4) = mat(1,4)-(vd*Conjg(Ye(j1,j2))*vL(j2)*Ye(j1,2))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,4) = mat(1,4)+(Conjg(Ye(j1,j3))*L1(2,j2,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,4) = mat(1,4)-(Conjg(Ye(j1,j3))*L1(j2,2,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
mat(1,4) = mat(1,4)+(g2**2*vd*vL(2))/4._dp
mat(1,4) = mat(1,4)+(g2**2*vd*RXiWm*vL(2))/4._dp
mat(1,4) = mat(1,4)-(Conjg(Mu)*REps(2))
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+mlHd2(3)
Do j2 = 1,3
Do j1 = 1,3
mat(1,5) = mat(1,5)-(vd*Conjg(Ye(j1,j2))*vL(j2)*Ye(j1,3))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,5) = mat(1,5)+(Conjg(Ye(j1,j3))*L1(3,j2,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,5) = mat(1,5)-(Conjg(Ye(j1,j3))*L1(j2,3,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
mat(1,5) = mat(1,5)+(g2**2*vd*vL(3))/4._dp
mat(1,5) = mat(1,5)+(g2**2*vd*RXiWm*vL(3))/4._dp
mat(1,5) = mat(1,5)-(Conjg(Mu)*REps(3))
mat(1,6) = 0._dp 
Do j1 = 1,3
mat(1,6) = mat(1,6)-((Conjg(Te(1,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,6) = mat(1,6)-((vu*Conjg(Ye(1,j1))*REps(j1))/sqrt(2._dp))
End Do 
mat(1,7) = 0._dp 
Do j1 = 1,3
mat(1,7) = mat(1,7)-((Conjg(Te(2,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,7) = mat(1,7)-((vu*Conjg(Ye(2,j1))*REps(j1))/sqrt(2._dp))
End Do 
mat(1,8) = 0._dp 
Do j1 = 1,3
mat(1,8) = mat(1,8)-((Conjg(Te(3,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,8) = mat(1,8)-((vu*Conjg(Ye(3,j1))*REps(j1))/sqrt(2._dp))
End Do 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+Mu*Conjg(Mu)
mat(2,2) = mat(2,2)+(g2**2*vu**2*RXiWm)/4._dp
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+Conjg(REps(j1))*REps(j1)
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(g2**2*vu*vL(1))/4._dp
mat(2,3) = mat(2,3)-(g2**2*vu*RXiWm*vL(1))/4._dp
mat(2,3) = mat(2,3)-Beps(1)
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(g2**2*vu*vL(2))/4._dp
mat(2,4) = mat(2,4)-(g2**2*vu*RXiWm*vL(2))/4._dp
mat(2,4) = mat(2,4)-Beps(2)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(g2**2*vu*vL(3))/4._dp
mat(2,5) = mat(2,5)-(g2**2*vu*RXiWm*vL(3))/4._dp
mat(2,5) = mat(2,5)-Beps(3)
mat(2,6) = 0._dp 
Do j1 = 1,3
mat(2,6) = mat(2,6)-((Mu*Conjg(Ye(1,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,6) = mat(2,6)-((vd*Conjg(Ye(1,j1))*REps(j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,6) = mat(2,6)+(Conjg(L1(j1,j2,1))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,6) = mat(2,6)-(Conjg(L1(j2,j1,1))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
mat(2,7) = 0._dp 
Do j1 = 1,3
mat(2,7) = mat(2,7)-((Mu*Conjg(Ye(2,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,7) = mat(2,7)-((vd*Conjg(Ye(2,j1))*REps(j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,7) = mat(2,7)+(Conjg(L1(j1,j2,2))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,7) = mat(2,7)-(Conjg(L1(j2,j1,2))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
mat(2,8) = 0._dp 
Do j1 = 1,3
mat(2,8) = mat(2,8)-((Mu*Conjg(Ye(3,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,8) = mat(2,8)-((vd*Conjg(Ye(3,j1))*REps(j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,8) = mat(2,8)+(Conjg(L1(j1,j2,3))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,8) = mat(2,8)-(Conjg(L1(j2,j1,3))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vd**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)-(g1**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+ml2(1,1)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)-(vd*Conjg(Ye(j1,1))*L1(1,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd*Conjg(Ye(j1,1))*L1(j2,1,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)-(vd*Conjg(L1(1,j2,j1))*vL(j2)*Ye(j1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd*Conjg(L1(j2,1,j1))*vL(j2)*Ye(j1,1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(Conjg(L1(1,j3,j1))*L1(1,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)-(Conjg(L1(j3,1,j1))*L1(1,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)-(Conjg(L1(1,j3,j1))*L1(j2,1,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(Conjg(L1(j3,1,j1))*L1(j2,1,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(3,3) = mat(3,3)+(g2**2*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*RXiWm*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+Conjg(REps(1))*REps(1)
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+ml2(1,2)
Do j1 = 1,3
mat(3,4) = mat(3,4)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)-(vd*Conjg(Ye(j1,1))*L1(2,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)+(vd*Conjg(Ye(j1,1))*L1(j2,2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)-(vd*Conjg(L1(1,j2,j1))*vL(j2)*Ye(j1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)+(vd*Conjg(L1(j2,1,j1))*vL(j2)*Ye(j1,2))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)+(Conjg(L1(1,j3,j1))*L1(2,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)-(Conjg(L1(j3,1,j1))*L1(2,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)-(Conjg(L1(1,j3,j1))*L1(j2,2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)+(Conjg(L1(j3,1,j1))*L1(j2,2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(3,4) = mat(3,4)+(g2**2*vL(1)*vL(2))/4._dp
mat(3,4) = mat(3,4)+Conjg(REps(1))*REps(2)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+ml2(1,3)
Do j1 = 1,3
mat(3,5) = mat(3,5)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)-(vd*Conjg(Ye(j1,1))*L1(3,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)+(vd*Conjg(Ye(j1,1))*L1(j2,3,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)-(vd*Conjg(L1(1,j2,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)+(vd*Conjg(L1(j2,1,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)+(Conjg(L1(1,j3,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)-(Conjg(L1(j3,1,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)-(Conjg(L1(1,j3,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)+(Conjg(L1(j3,1,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(3,5) = mat(3,5)+(g2**2*vL(1)*vL(3))/4._dp
mat(3,5) = mat(3,5)+Conjg(REps(1))*REps(3)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-((vu*Mu*Conjg(Ye(1,1)))/sqrt(2._dp))
mat(3,6) = mat(3,6)+(vd*Conjg(Te(1,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,6) = mat(3,6)-(Conjg(T1(1,j1,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,6) = mat(3,6)+(Conjg(T1(j1,1,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,6) = mat(3,6)-(vu*Conjg(L1(1,j1,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,6) = mat(3,6)+(vu*Conjg(L1(j1,1,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,7) = 0._dp 
mat(3,7) = mat(3,7)-((vu*Mu*Conjg(Ye(2,1)))/sqrt(2._dp))
mat(3,7) = mat(3,7)+(vd*Conjg(Te(2,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,7) = mat(3,7)-(Conjg(T1(1,j1,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,7) = mat(3,7)+(Conjg(T1(j1,1,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,7) = mat(3,7)-(vu*Conjg(L1(1,j1,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,7) = mat(3,7)+(vu*Conjg(L1(j1,1,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,8) = 0._dp 
mat(3,8) = mat(3,8)-((vu*Mu*Conjg(Ye(3,1)))/sqrt(2._dp))
mat(3,8) = mat(3,8)+(vd*Conjg(Te(3,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,8) = mat(3,8)-(Conjg(T1(1,j1,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,8) = mat(3,8)+(Conjg(T1(j1,1,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,8) = mat(3,8)-(vu*Conjg(L1(1,j1,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,8) = mat(3,8)+(vu*Conjg(L1(j1,1,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vd**2)/8._dp
mat(4,4) = mat(4,4)-(g2**2*vd**2)/8._dp
mat(4,4) = mat(4,4)-(g1**2*vu**2)/8._dp
mat(4,4) = mat(4,4)+(g2**2*vu**2)/8._dp
mat(4,4) = mat(4,4)+ml2(2,2)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)-(vd*Conjg(Ye(j1,2))*L1(2,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd*Conjg(Ye(j1,2))*L1(j2,2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)-(vd*Conjg(L1(2,j2,j1))*vL(j2)*Ye(j1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd*Conjg(L1(j2,2,j1))*vL(j2)*Ye(j1,2))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(Conjg(L1(2,j3,j1))*L1(2,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)-(Conjg(L1(j3,2,j1))*L1(2,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)-(Conjg(L1(2,j3,j1))*L1(j2,2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(Conjg(L1(j3,2,j1))*L1(j2,2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(4,4) = mat(4,4)+(g2**2*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+(g2**2*RXiWm*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+Conjg(REps(2))*REps(2)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+ml2(2,3)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)-(vd*Conjg(Ye(j1,2))*L1(3,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd*Conjg(Ye(j1,2))*L1(j2,3,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)-(vd*Conjg(L1(2,j2,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd*Conjg(L1(j2,2,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(Conjg(L1(2,j3,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)-(Conjg(L1(j3,2,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)-(Conjg(L1(2,j3,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(Conjg(L1(j3,2,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(4,5) = mat(4,5)+(g2**2*vL(2)*vL(3))/4._dp
mat(4,5) = mat(4,5)+Conjg(REps(2))*REps(3)
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)-((vu*Mu*Conjg(Ye(1,2)))/sqrt(2._dp))
mat(4,6) = mat(4,6)+(vd*Conjg(Te(1,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(4,6) = mat(4,6)-(Conjg(T1(2,j1,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,6) = mat(4,6)+(Conjg(T1(j1,2,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,6) = mat(4,6)-(vu*Conjg(L1(2,j1,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vu*Conjg(L1(j1,2,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(4,7) = 0._dp 
mat(4,7) = mat(4,7)-((vu*Mu*Conjg(Ye(2,2)))/sqrt(2._dp))
mat(4,7) = mat(4,7)+(vd*Conjg(Te(2,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(4,7) = mat(4,7)-(Conjg(T1(2,j1,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,7) = mat(4,7)+(Conjg(T1(j1,2,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,7) = mat(4,7)-(vu*Conjg(L1(2,j1,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,7) = mat(4,7)+(vu*Conjg(L1(j1,2,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(4,8) = 0._dp 
mat(4,8) = mat(4,8)-((vu*Mu*Conjg(Ye(3,2)))/sqrt(2._dp))
mat(4,8) = mat(4,8)+(vd*Conjg(Te(3,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(4,8) = mat(4,8)-(Conjg(T1(2,j1,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,8) = mat(4,8)+(Conjg(T1(j1,2,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,8) = mat(4,8)-(vu*Conjg(L1(2,j1,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,8) = mat(4,8)+(vu*Conjg(L1(j1,2,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vd**2)/8._dp
mat(5,5) = mat(5,5)-(g2**2*vd**2)/8._dp
mat(5,5) = mat(5,5)-(g1**2*vu**2)/8._dp
mat(5,5) = mat(5,5)+(g2**2*vu**2)/8._dp
mat(5,5) = mat(5,5)+ml2(3,3)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd**2*Conjg(Ye(j1,3))*Ye(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)-(vd*Conjg(Ye(j1,3))*L1(3,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd*Conjg(Ye(j1,3))*L1(j2,3,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)-(vd*Conjg(L1(3,j2,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd*Conjg(L1(j2,3,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(Conjg(L1(3,j3,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)-(Conjg(L1(j3,3,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)-(Conjg(L1(3,j3,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(Conjg(L1(j3,3,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(5,5) = mat(5,5)+(g2**2*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+(g2**2*RXiWm*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+Conjg(REps(3))*REps(3)
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)-((vu*Mu*Conjg(Ye(1,3)))/sqrt(2._dp))
mat(5,6) = mat(5,6)+(vd*Conjg(Te(1,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(5,6) = mat(5,6)-(Conjg(T1(3,j1,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,6) = mat(5,6)+(Conjg(T1(j1,3,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,6) = mat(5,6)-(vu*Conjg(L1(3,j1,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vu*Conjg(L1(j1,3,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(5,7) = 0._dp 
mat(5,7) = mat(5,7)-((vu*Mu*Conjg(Ye(2,3)))/sqrt(2._dp))
mat(5,7) = mat(5,7)+(vd*Conjg(Te(2,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(5,7) = mat(5,7)-(Conjg(T1(3,j1,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,7) = mat(5,7)+(Conjg(T1(j1,3,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,7) = mat(5,7)-(vu*Conjg(L1(3,j1,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,7) = mat(5,7)+(vu*Conjg(L1(j1,3,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(5,8) = 0._dp 
mat(5,8) = mat(5,8)-((vu*Mu*Conjg(Ye(3,3)))/sqrt(2._dp))
mat(5,8) = mat(5,8)+(vd*Conjg(Te(3,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(5,8) = mat(5,8)-(Conjg(T1(3,j1,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,8) = mat(5,8)+(Conjg(T1(j1,3,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,8) = mat(5,8)-(vu*Conjg(L1(3,j1,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,8) = mat(5,8)+(vu*Conjg(L1(j1,3,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)-(g1**2*vd**2)/4._dp
mat(6,6) = mat(6,6)+(g1**2*vu**2)/4._dp
mat(6,6) = mat(6,6)+me2(1,1)
Do j1 = 1,3
Do j2 = 1,3
mat(6,6) = mat(6,6)+(Conjg(Ye(1,j2))*vL(j1)*vL(j2)*Ye(1,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(6,6) = mat(6,6)-(g1**2*vL(j1)**2)/4._dp
End Do 
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd**2*Conjg(Ye(1,j1))*Ye(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)-(vd*Conjg(Ye(1,j1))*L1(j1,j2,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd*Conjg(Ye(1,j1))*L1(j2,j1,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)-(vd*Conjg(L1(j1,j2,1))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd*Conjg(L1(j2,j1,1))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(Conjg(L1(j1,j3,1))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)-(Conjg(L1(j3,j1,1))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)-(Conjg(L1(j1,j3,1))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(Conjg(L1(j3,j1,1))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(6,7) = 0._dp 
mat(6,7) = mat(6,7)+me2(1,2)
Do j1 = 1,3
Do j2 = 1,3
mat(6,7) = mat(6,7)+(Conjg(Ye(2,j2))*vL(j1)*vL(j2)*Ye(1,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(6,7) = mat(6,7)+(vd**2*Conjg(Ye(2,j1))*Ye(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)-(vd*Conjg(Ye(2,j1))*L1(j1,j2,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)+(vd*Conjg(Ye(2,j1))*L1(j2,j1,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)-(vd*Conjg(L1(j1,j2,2))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)+(vd*Conjg(L1(j2,j1,2))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)+(Conjg(L1(j1,j3,2))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)-(Conjg(L1(j3,j1,2))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)-(Conjg(L1(j1,j3,2))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)+(Conjg(L1(j3,j1,2))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(6,8) = 0._dp 
mat(6,8) = mat(6,8)+me2(1,3)
Do j1 = 1,3
Do j2 = 1,3
mat(6,8) = mat(6,8)+(Conjg(Ye(3,j2))*vL(j1)*vL(j2)*Ye(1,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(6,8) = mat(6,8)+(vd**2*Conjg(Ye(3,j1))*Ye(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)-(vd*Conjg(Ye(3,j1))*L1(j1,j2,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)+(vd*Conjg(Ye(3,j1))*L1(j2,j1,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)-(vd*Conjg(L1(j1,j2,3))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)+(vd*Conjg(L1(j2,j1,3))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)+(Conjg(L1(j1,j3,3))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)-(Conjg(L1(j3,j1,3))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)-(Conjg(L1(j1,j3,3))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)+(Conjg(L1(j3,j1,3))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(7,7) = 0._dp 
mat(7,7) = mat(7,7)-(g1**2*vd**2)/4._dp
mat(7,7) = mat(7,7)+(g1**2*vu**2)/4._dp
mat(7,7) = mat(7,7)+me2(2,2)
Do j1 = 1,3
Do j2 = 1,3
mat(7,7) = mat(7,7)+(Conjg(Ye(2,j2))*vL(j1)*vL(j2)*Ye(2,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(7,7) = mat(7,7)-(g1**2*vL(j1)**2)/4._dp
End Do 
Do j1 = 1,3
mat(7,7) = mat(7,7)+(vd**2*Conjg(Ye(2,j1))*Ye(2,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)-(vd*Conjg(Ye(2,j1))*L1(j1,j2,2)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)+(vd*Conjg(Ye(2,j1))*L1(j2,j1,2)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)-(vd*Conjg(L1(j1,j2,2))*vL(j2)*Ye(2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)+(vd*Conjg(L1(j2,j1,2))*vL(j2)*Ye(2,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)+(Conjg(L1(j1,j3,2))*L1(j1,j2,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)-(Conjg(L1(j3,j1,2))*L1(j1,j2,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)-(Conjg(L1(j1,j3,2))*L1(j2,j1,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)+(Conjg(L1(j3,j1,2))*L1(j2,j1,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(7,8) = 0._dp 
mat(7,8) = mat(7,8)+me2(2,3)
Do j1 = 1,3
Do j2 = 1,3
mat(7,8) = mat(7,8)+(Conjg(Ye(3,j2))*vL(j1)*vL(j2)*Ye(2,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(7,8) = mat(7,8)+(vd**2*Conjg(Ye(3,j1))*Ye(2,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)-(vd*Conjg(Ye(3,j1))*L1(j1,j2,2)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)+(vd*Conjg(Ye(3,j1))*L1(j2,j1,2)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)-(vd*Conjg(L1(j1,j2,3))*vL(j2)*Ye(2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)+(vd*Conjg(L1(j2,j1,3))*vL(j2)*Ye(2,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)+(Conjg(L1(j1,j3,3))*L1(j1,j2,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)-(Conjg(L1(j3,j1,3))*L1(j1,j2,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)-(Conjg(L1(j1,j3,3))*L1(j2,j1,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)+(Conjg(L1(j3,j1,3))*L1(j2,j1,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(8,8) = 0._dp 
mat(8,8) = mat(8,8)-(g1**2*vd**2)/4._dp
mat(8,8) = mat(8,8)+(g1**2*vu**2)/4._dp
mat(8,8) = mat(8,8)+me2(3,3)
Do j1 = 1,3
Do j2 = 1,3
mat(8,8) = mat(8,8)+(Conjg(Ye(3,j2))*vL(j1)*vL(j2)*Ye(3,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(8,8) = mat(8,8)-(g1**2*vL(j1)**2)/4._dp
End Do 
Do j1 = 1,3
mat(8,8) = mat(8,8)+(vd**2*Conjg(Ye(3,j1))*Ye(3,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)-(vd*Conjg(Ye(3,j1))*L1(j1,j2,3)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)+(vd*Conjg(Ye(3,j1))*L1(j2,j1,3)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)-(vd*Conjg(L1(j1,j2,3))*vL(j2)*Ye(3,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)+(vd*Conjg(L1(j2,j1,3))*vL(j2)*Ye(3,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)+(Conjg(L1(j1,j3,3))*L1(j1,j2,3)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)-(Conjg(L1(j3,j1,3))*L1(j1,j2,3)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)-(Conjg(L1(j1,j3,3))*L1(j2,j1,3)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)+(Conjg(L1(j3,j1,3))*L1(j2,j1,3)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 

 
 Do i1=2,8
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHpm2,ZP,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,8
  If (Abs(MHpm2(i1)).Le.MaxMassNumericalZero) MHpm2(i1) = 1.E-10_dp 
  If (MHpm2(i1).ne.MHpm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHpm2(i1).Ge.0._dp) Then 
  MHpm(i1)=Sqrt(MHpm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MHpm2(i1) 
    End If 
  MHpm(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MHpm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MHpm2(i1) 
  MHpm2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHpm 

Subroutine CalculateMChi(g1,g2,Mu,REps,M1,M2,vd,vu,vL,UV,MChi,kont)

Real(dp) ,Intent(in) :: g1,g2,vd,vu,vL(3)

Complex(dp) ,Intent(in) :: Mu,REps(3),M1,M2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MChi(7) 
Complex(dp), Intent(out) ::  UV(7,7) 
                              
Complex(dp) :: mat(7,7), mat2(7,7), phaseM, E7(7) 

Real(dp) :: UVa(7,7), test(2), eig(7) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMChi'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(g1*vL(1))/2._dp
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(g2*vL(1))/2._dp
mat(1,6) = 0._dp 
mat(1,7) = 0._dp 
mat(1,7) = mat(1,7)+REps(1)
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(g1*vL(2))/2._dp
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(g2*vL(2))/2._dp
mat(2,6) = 0._dp 
mat(2,7) = 0._dp 
mat(2,7) = mat(2,7)+REps(2)
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(g1*vL(3))/2._dp
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(g2*vL(3))/2._dp
mat(3,6) = 0._dp 
mat(3,7) = 0._dp 
mat(3,7) = mat(3,7)+REps(3)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+M1
mat(4,5) = 0._dp 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)-(g1*vd)/2._dp
mat(4,7) = 0._dp 
mat(4,7) = mat(4,7)+(g1*vu)/2._dp
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+M2
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+(g2*vd)/2._dp
mat(5,7) = 0._dp 
mat(5,7) = mat(5,7)-(g2*vu)/2._dp
mat(6,6) = 0._dp 
mat(6,7) = 0._dp 
mat(6,7) = mat(6,7)-1._dp*(Mu)
mat(7,7) = 0._dp 

 
 Do i1=2,7
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,7
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MChi(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MChi(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,6
  Do i2=i1+1,7
    If (MChi(i1).Gt.MChi(i2)) Then 
      Eig(1) = MChi(i1) 
      MChi(i1) = MChi(i2) 
      MChi(i2) =  Eig(1) 
      E7 = UV(i1,:) 
      UV(i1,:) = UV(i2,:) 
      UV(i2,:) = E7
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call EigensystemQP(mat2, Eig, UV, ierr, test) 
mat2 = Matmul( Conjg(UV), Matmul( mat, Transpose( Conjg(UV)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,7-1
If (MaxVal(Abs(mat2(i1,(i1+1):7))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystemQP(Real(mat2,dp),Eig,UVa,ierr,test) 
 
     UV = MatMul(UV,UVa)
  Do i1=1,7
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MChi(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MChi(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,7
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV(i1,:)= phaseM * UV(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
MChi = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMChi, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMChi 

Subroutine CalculateMCha(g2,Mu,REps,Ye,L1,M2,vd,vu,vL,ZEL,ZER,MCha,kont)

Real(dp),Intent(in) :: g2,vd,vu,vL(3)

Complex(dp),Intent(in) :: Mu,REps(3),Ye(3,3),L1(3,3,3),M2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MCha(5) 
 Complex(dp), Intent(out) :: ZEL(5,5), ZER(5,5) 
 
 Complex(dp) :: mat(5,5)=0._dp, mat2(5,5)=0._dp, phaseM 

Complex(dp) :: ZEL2(5,5), ZER2(5,5) 
 
 Real(dp) :: ZEL1(5,5), ZER1(5,5), test(2), MCha2(5) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMCha'
 
MCha = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
Do j1 = 1,3
mat(1,1) = mat(1,1)-(L1(1,j1,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(L1(j1,1,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(1,1) = mat(1,1)+(vd*Ye(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
Do j1 = 1,3
mat(1,2) = mat(1,2)-(L1(1,j1,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,2) = mat(1,2)+(L1(j1,1,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(1,2) = mat(1,2)+(vd*Ye(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
Do j1 = 1,3
mat(1,3) = mat(1,3)-(L1(1,j1,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,3) = mat(1,3)+(L1(j1,1,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(1,3) = mat(1,3)+(vd*Ye(3,1))/sqrt(2._dp)
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(g2*vL(1))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-REps(1)
mat(2,1) = 0._dp 
Do j1 = 1,3
mat(2,1) = mat(2,1)-(L1(2,j1,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,1) = mat(2,1)+(L1(j1,2,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(2,1) = mat(2,1)+(vd*Ye(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
Do j1 = 1,3
mat(2,2) = mat(2,2)-(L1(2,j1,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(L1(j1,2,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(2,2) = mat(2,2)+(vd*Ye(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
Do j1 = 1,3
mat(2,3) = mat(2,3)-(L1(2,j1,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,3) = mat(2,3)+(L1(j1,2,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(2,3) = mat(2,3)+(vd*Ye(3,2))/sqrt(2._dp)
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(g2*vL(2))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-REps(2)
mat(3,1) = 0._dp 
Do j1 = 1,3
mat(3,1) = mat(3,1)-(L1(3,j1,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,1) = mat(3,1)+(L1(j1,3,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,1) = mat(3,1)+(vd*Ye(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
Do j1 = 1,3
mat(3,2) = mat(3,2)-(L1(3,j1,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,2) = mat(3,2)+(L1(j1,3,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,2) = mat(3,2)+(vd*Ye(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
Do j1 = 1,3
mat(3,3) = mat(3,3)-(L1(3,j1,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(L1(j1,3,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,3) = mat(3,3)+(vd*Ye(3,3))/sqrt(2._dp)
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(g2*vL(3))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-REps(3)
mat(4,1) = 0._dp 
mat(4,2) = 0._dp 
mat(4,3) = 0._dp 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+M2
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+(g2*vu)/sqrt(2._dp)
mat(5,1) = 0._dp 
Do j1 = 1,3
mat(5,1) = mat(5,1)-((vL(j1)*Ye(1,j1))/sqrt(2._dp))
End Do 
mat(5,2) = 0._dp 
Do j1 = 1,3
mat(5,2) = mat(5,2)-((vL(j1)*Ye(2,j1))/sqrt(2._dp))
End Do 
mat(5,3) = 0._dp 
Do j1 = 1,3
mat(5,3) = mat(5,3)-((vL(j1)*Ye(3,j1))/sqrt(2._dp))
End Do 
mat(5,4) = 0._dp 
mat(5,4) = mat(5,4)+(g2*vd)/sqrt(2._dp)
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+Mu

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MCha2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MCha2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MCha2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,5
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,5
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MCha2(i1).ne.MCha2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MCha2(i1)).Le.MaxMassNumericalZero) MCha2(i1) = Abs(MCha2(i1))+1.E-10_dp 
  If (MCha2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MCha2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MCha2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MCha2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MCha2(i1) 
  MCha2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMCha, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MCha = Sqrt( MCha2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMCha 

Subroutine CalculateMFd(Yd,L2,vd,vL,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: vd,vL(3)

Complex(dp),Intent(in) :: Yd(3,3),L2(3,3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(L2(j1,1,1)*vL(j1))/sqrt(2._dp)
End Do 
mat(1,1) = mat(1,1)+(vd*Yd(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
Do j1 = 1,3
mat(1,2) = mat(1,2)+(L2(j1,1,2)*vL(j1))/sqrt(2._dp)
End Do 
mat(1,2) = mat(1,2)+(vd*Yd(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
Do j1 = 1,3
mat(1,3) = mat(1,3)+(L2(j1,1,3)*vL(j1))/sqrt(2._dp)
End Do 
mat(1,3) = mat(1,3)+(vd*Yd(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
Do j1 = 1,3
mat(2,1) = mat(2,1)+(L2(j1,2,1)*vL(j1))/sqrt(2._dp)
End Do 
mat(2,1) = mat(2,1)+(vd*Yd(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(L2(j1,2,2)*vL(j1))/sqrt(2._dp)
End Do 
mat(2,2) = mat(2,2)+(vd*Yd(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
Do j1 = 1,3
mat(2,3) = mat(2,3)+(L2(j1,2,3)*vL(j1))/sqrt(2._dp)
End Do 
mat(2,3) = mat(2,3)+(vd*Yd(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
Do j1 = 1,3
mat(3,1) = mat(3,1)+(L2(j1,3,1)*vL(j1))/sqrt(2._dp)
End Do 
mat(3,1) = mat(3,1)+(vd*Yd(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
Do j1 = 1,3
mat(3,2) = mat(3,2)+(L2(j1,3,2)*vL(j1))/sqrt(2._dp)
End Do 
mat(3,2) = mat(3,2)+(vd*Yd(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(L2(j1,3,3)*vL(j1))/sqrt(2._dp)
End Do 
mat(3,3) = mat(3,3)+(vd*Yd(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFd2(i1) 
  MFd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFd 

Subroutine CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: vu

Complex(dp),Intent(in) :: Yu(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vu*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vu*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vu*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vu*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vu*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vu*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vu*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vu*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vu*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFu2(i1) 
  MFu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFu 

Subroutine CalculateVPVZ(g1,g2,vd,vu,vL,ZZ,MVZ,MVZ2,TW,kont)

Real(dp), Intent(in) :: g1,g2,vd,vu,vL(3)

Real(dp), Intent(out) :: TW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp) :: VPVZ2(2),VPVZ(2)  

Real(dp), Intent(out) :: ZZ(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZ'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vd**2)/4._dp
mat(1,1) = mat(1,1)+(g1**2*vu**2)/4._dp
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g1**2*vL(j1)**2)/4._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*vd**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vu**2)/4._dp
Do j1 = 1,3
mat(1,2) = mat(1,2)-(g1*g2*vL(j1)**2)/4._dp
End Do 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vd**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/4._dp
Do j1 = 1,3
mat(2,2) = mat(2,2)+(g2**2*vL(j1)**2)/4._dp
End Do 

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZ2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VPVZ2(i1)).Le.1.E-10_dp*(Maxval(VPVZ2))) VPVZ2(i1) = 1.E-10_dp 
  If (VPVZ2(i1).ne.VPVZ2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZ2(i1).Ge.0._dp) Then 
  VPVZ(i1) =Sqrt(VPVZ2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VPVZ2(i1) 
    End If 
  VPVZ(i1)= 1._dp 
  VPVZ2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VPVZ2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VPVZ2(i1) 
  VPVZ(i1)= 1._dp 
  VPVZ2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZ(2) 
MVZ2 = VPVZ2(2) 
TW = ACos(Abs(ZZ(1,1)))

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZ 

Subroutine CalculateVWm(g2,vd,vu,vL,ZW,MVWm,MVWm2,kont)

Real(dp), Intent(in) :: g2,vd,vu,vL(3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWm, MVWm2
Real(dp) :: VWm2(2),VWm(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*vd**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vu**2)/4._dp
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g2**2*vL(j1)**2)/4._dp
End Do 
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vd**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/4._dp
Do j1 = 1,3
mat(2,2) = mat(2,2)+(g2**2*vL(j1)**2)/4._dp
End Do 

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWm2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWm2(i1)).Le.1.E-10_dp*(Maxval(VWm2))) VWm2(i1) = 1.E-10_dp 
  If (VWm2(i1).ne.VWm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWm2(i1).Ge.0._dp) Then 
  VWm(i1) =Sqrt(VWm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VWm2(i1) 
    End If 
  VWm(i1)= 1._dp 
  VWm2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VWm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VWm2(i1) 
  VWm(i1)= 1._dp 
  VWm2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVWm = VWm(1) 
MVWm2 = VWm2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWm 

Subroutine CalculateMSdEffPot(g1,g2,Mu,REps,Yd,Td,L2,T2,mq2,md2,vd,vu,vL,             & 
& ZD,MSd,MSd2,kont)

Real(dp), Intent(in) :: g1,g2,vd,vu,vL(3)

Complex(dp), Intent(in) :: Mu,REps(3),Yd(3,3),Td(3,3),L2(3,3,3),T2(3,3,3),mq2(3,3),md2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSd(6), MSd2(6) 
Complex(dp), Intent(out) :: ZD(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) :: MSd2temp(6), Q2 
Complex(dp) :: ZDtemp(6,6), ZDtemp2(6,6) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSd'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(g1**2*vdFix**2)/24._dp
mat(1,1) = mat(1,1)-(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(g1**2*vuFix**2)/24._dp
mat(1,1) = mat(1,1)+(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+mq2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd*Conjg(Yd(j1,1))*L2(j2,1,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd*Conjg(L2(j2,1,j1))*vL(j2)*Yd(j1,1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,1) = mat(1,1)+(Conjg(L2(j3,1,j1))*L2(j2,1,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+mq2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd*Conjg(Yd(j1,1))*L2(j2,2,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd*Conjg(L2(j2,1,j1))*vL(j2)*Yd(j1,2))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,2) = mat(1,2)+(Conjg(L2(j3,1,j1))*L2(j2,2,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mq2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd*Conjg(Yd(j1,1))*L2(j2,3,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd*Conjg(L2(j2,1,j1))*vL(j2)*Yd(j1,3))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)+(Conjg(L2(j3,1,j1))*L2(j2,3,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-((vu*Mu*Conjg(Yd(1,1)))/sqrt(2._dp))
mat(1,4) = mat(1,4)+(vd*Conjg(Td(1,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,4) = mat(1,4)+(Conjg(T2(j1,1,1))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(1,4) = mat(1,4)+(vu*Conjg(L2(j1,1,1))*REps(j1))/sqrt(2._dp)
End Do 
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-((vu*Mu*Conjg(Yd(2,1)))/sqrt(2._dp))
mat(1,5) = mat(1,5)+(vd*Conjg(Td(2,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,5) = mat(1,5)+(Conjg(T2(j1,1,2))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(1,5) = mat(1,5)+(vu*Conjg(L2(j1,1,2))*REps(j1))/sqrt(2._dp)
End Do 
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-((vu*Mu*Conjg(Yd(3,1)))/sqrt(2._dp))
mat(1,6) = mat(1,6)+(vd*Conjg(Td(3,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,6) = mat(1,6)+(Conjg(T2(j1,1,3))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(1,6) = mat(1,6)+(vu*Conjg(L2(j1,1,3))*REps(j1))/sqrt(2._dp)
End Do 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/24._dp
mat(2,2) = mat(2,2)-(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(g1**2*vuFix**2)/24._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+mq2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd*Conjg(Yd(j1,2))*L2(j2,2,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd*Conjg(L2(j2,2,j1))*vL(j2)*Yd(j1,2))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(2,2) = mat(2,2)+(Conjg(L2(j3,2,j1))*L2(j2,2,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+mq2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd*Conjg(Yd(j1,2))*L2(j2,3,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd*Conjg(L2(j2,2,j1))*vL(j2)*Yd(j1,3))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(2,3) = mat(2,3)+(Conjg(L2(j3,2,j1))*L2(j2,3,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-((vu*Mu*Conjg(Yd(1,2)))/sqrt(2._dp))
mat(2,4) = mat(2,4)+(vd*Conjg(Td(1,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,4) = mat(2,4)+(Conjg(T2(j1,2,1))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(2,4) = mat(2,4)+(vu*Conjg(L2(j1,2,1))*REps(j1))/sqrt(2._dp)
End Do 
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-((vu*Mu*Conjg(Yd(2,2)))/sqrt(2._dp))
mat(2,5) = mat(2,5)+(vd*Conjg(Td(2,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,5) = mat(2,5)+(Conjg(T2(j1,2,2))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(2,5) = mat(2,5)+(vu*Conjg(L2(j1,2,2))*REps(j1))/sqrt(2._dp)
End Do 
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-((vu*Mu*Conjg(Yd(3,2)))/sqrt(2._dp))
mat(2,6) = mat(2,6)+(vd*Conjg(Td(3,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,6) = mat(2,6)+(Conjg(T2(j1,2,3))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(2,6) = mat(2,6)+(vu*Conjg(L2(j1,2,3))*REps(j1))/sqrt(2._dp)
End Do 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-(g1**2*vdFix**2)/24._dp
mat(3,3) = mat(3,3)-(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(g1**2*vuFix**2)/24._dp
mat(3,3) = mat(3,3)+(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+mq2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd**2*Conjg(Yd(j1,3))*Yd(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd*Conjg(Yd(j1,3))*L2(j2,3,j1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd*Conjg(L2(j2,3,j1))*vL(j2)*Yd(j1,3))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(Conjg(L2(j3,3,j1))*L2(j2,3,j1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-((vu*Mu*Conjg(Yd(1,3)))/sqrt(2._dp))
mat(3,4) = mat(3,4)+(vd*Conjg(Td(1,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,4) = mat(3,4)+(Conjg(T2(j1,3,1))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(3,4) = mat(3,4)+(vu*Conjg(L2(j1,3,1))*REps(j1))/sqrt(2._dp)
End Do 
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-((vu*Mu*Conjg(Yd(2,3)))/sqrt(2._dp))
mat(3,5) = mat(3,5)+(vd*Conjg(Td(2,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,5) = mat(3,5)+(Conjg(T2(j1,3,2))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(3,5) = mat(3,5)+(vu*Conjg(L2(j1,3,2))*REps(j1))/sqrt(2._dp)
End Do 
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-((vu*Mu*Conjg(Yd(3,3)))/sqrt(2._dp))
mat(3,6) = mat(3,6)+(vd*Conjg(Td(3,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,6) = mat(3,6)+(Conjg(T2(j1,3,3))*vL(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
mat(3,6) = mat(3,6)+(vu*Conjg(L2(j1,3,3))*REps(j1))/sqrt(2._dp)
End Do 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-(g1**2*vdFix**2)/12._dp
mat(4,4) = mat(4,4)+(g1**2*vuFix**2)/12._dp
mat(4,4) = mat(4,4)+md2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)-(g1**2*vL(j1)**2)/12._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd**2*Conjg(Yd(1,j1))*Yd(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd*Conjg(Yd(1,j1))*L2(j2,j1,1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd*Conjg(L2(j2,j1,1))*vL(j2)*Yd(1,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(Conjg(L2(j3,j1,1))*L2(j2,j1,1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+md2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd**2*Conjg(Yd(2,j1))*Yd(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd*Conjg(Yd(2,j1))*L2(j2,j1,1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd*Conjg(L2(j2,j1,2))*vL(j2)*Yd(1,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(Conjg(L2(j3,j1,2))*L2(j2,j1,1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+md2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd**2*Conjg(Yd(3,j1))*Yd(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd*Conjg(Yd(3,j1))*L2(j2,j1,1)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd*Conjg(L2(j2,j1,3))*vL(j2)*Yd(1,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,6) = mat(4,6)+(Conjg(L2(j3,j1,3))*L2(j2,j1,1)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)-(g1**2*vdFix**2)/12._dp
mat(5,5) = mat(5,5)+(g1**2*vuFix**2)/12._dp
mat(5,5) = mat(5,5)+md2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)-(g1**2*vL(j1)**2)/12._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd**2*Conjg(Yd(2,j1))*Yd(2,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd*Conjg(Yd(2,j1))*L2(j2,j1,2)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd*Conjg(L2(j2,j1,2))*vL(j2)*Yd(2,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(Conjg(L2(j3,j1,2))*L2(j2,j1,2)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+md2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd**2*Conjg(Yd(3,j1))*Yd(2,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd*Conjg(Yd(3,j1))*L2(j2,j1,2)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd*Conjg(L2(j2,j1,3))*vL(j2)*Yd(2,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,6) = mat(5,6)+(Conjg(L2(j3,j1,3))*L2(j2,j1,2)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)-(g1**2*vdFix**2)/12._dp
mat(6,6) = mat(6,6)+(g1**2*vuFix**2)/12._dp
mat(6,6) = mat(6,6)+md2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)-(g1**2*vL(j1)**2)/12._dp
End Do 
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd**2*Conjg(Yd(3,j1))*Yd(3,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd*Conjg(Yd(3,j1))*L2(j2,j1,3)*vL(j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd*Conjg(L2(j2,j1,3))*vL(j2)*Yd(3,j1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(Conjg(L2(j3,j1,3))*L2(j2,j1,3)*vL(j2)*vL(j3))/2._dp
End Do 
End Do 
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSd2,ZD,ierr,test) 
 
 
! Fix order
  ZDtemp2=ZD
Do i1=1,6
  pos=Maxloc(Abs(ZDtemp2(i1,:)),1)
  ZDtemp(pos,:)=ZD(i1,:)
  MSd2temp(pos)=MSd2(i1)
  ZDtemp2(:,pos)=0._dp
End do
  MSd2 = MSd2temp
  ZD = ZDtemp
! Fix phases
Do i1=1,6
  pos=Maxloc(Abs(ZD(i1,:)),1)
  If (Real(ZD(i1,pos),dp).lt.0._dp) Then
    ZD(i1,:)=-ZD(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (MSd2(i1).ne.MSd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSd2(i1).Ge.0._dp) Then 
  MSd(i1)=Sqrt(MSd2(i1) ) 
  Else 
  MSd(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSdEffPot 

Subroutine CalculateMSuEffPot(g1,g2,Mu,REps,Yu,Tu,mq2,mu2,vd,vu,vL,ZU,MSu,            & 
& MSu2,kont)

Real(dp), Intent(in) :: g1,g2,vd,vu,vL(3)

Complex(dp), Intent(in) :: Mu,REps(3),Yu(3,3),Tu(3,3),mq2(3,3),mu2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSu(6), MSu2(6) 
Complex(dp), Intent(out) :: ZU(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) :: MSu2temp(6), Q2 
Complex(dp) :: ZUtemp(6,6), ZUtemp2(6,6) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSu'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(g1**2*vdFix**2)/24._dp
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(g1**2*vuFix**2)/24._dp
mat(1,1) = mat(1,1)-(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+mq2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+mq2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,2))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mq2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,3))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-((vd*Mu*Conjg(Yu(1,1)))/sqrt(2._dp))
mat(1,4) = mat(1,4)+(vu*Conjg(Tu(1,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,4) = mat(1,4)+(Conjg(Yu(1,1))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-((vd*Mu*Conjg(Yu(2,1)))/sqrt(2._dp))
mat(1,5) = mat(1,5)+(vu*Conjg(Tu(2,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,5) = mat(1,5)+(Conjg(Yu(2,1))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-((vd*Mu*Conjg(Yu(3,1)))/sqrt(2._dp))
mat(1,6) = mat(1,6)+(vu*Conjg(Tu(3,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(1,6) = mat(1,6)+(Conjg(Yu(3,1))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/24._dp
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(g1**2*vuFix**2)/24._dp
mat(2,2) = mat(2,2)-(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+mq2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,2))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+mq2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,3))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-((vd*Mu*Conjg(Yu(1,2)))/sqrt(2._dp))
mat(2,4) = mat(2,4)+(vu*Conjg(Tu(1,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,4) = mat(2,4)+(Conjg(Yu(1,2))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-((vd*Mu*Conjg(Yu(2,2)))/sqrt(2._dp))
mat(2,5) = mat(2,5)+(vu*Conjg(Tu(2,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,5) = mat(2,5)+(Conjg(Yu(2,2))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-((vd*Mu*Conjg(Yu(3,2)))/sqrt(2._dp))
mat(2,6) = mat(2,6)+(vu*Conjg(Tu(3,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(2,6) = mat(2,6)+(Conjg(Yu(3,2))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-(g1**2*vdFix**2)/24._dp
mat(3,3) = mat(3,3)+(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(g1**2*vuFix**2)/24._dp
mat(3,3) = mat(3,3)-(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+mq2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)-(g1**2*vL(j1)**2)/24._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vu**2*Conjg(Yu(j1,3))*Yu(j1,3))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-((vd*Mu*Conjg(Yu(1,3)))/sqrt(2._dp))
mat(3,4) = mat(3,4)+(vu*Conjg(Tu(1,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,4) = mat(3,4)+(Conjg(Yu(1,3))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-((vd*Mu*Conjg(Yu(2,3)))/sqrt(2._dp))
mat(3,5) = mat(3,5)+(vu*Conjg(Tu(2,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,5) = mat(3,5)+(Conjg(Yu(2,3))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-((vd*Mu*Conjg(Yu(3,3)))/sqrt(2._dp))
mat(3,6) = mat(3,6)+(vu*Conjg(Tu(3,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,6) = mat(3,6)+(Conjg(Yu(3,3))*vL(j1)*REps(j1))/sqrt(2._dp)
End Do 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vdFix**2)/6._dp
mat(4,4) = mat(4,4)-(g1**2*vuFix**2)/6._dp
mat(4,4) = mat(4,4)+mu2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g1**2*vL(j1)**2)/6._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vu**2*Conjg(Yu(1,j1))*Yu(1,j1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mu2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vu**2*Conjg(Yu(2,j1))*Yu(1,j1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mu2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vu**2*Conjg(Yu(3,j1))*Yu(1,j1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vdFix**2)/6._dp
mat(5,5) = mat(5,5)-(g1**2*vuFix**2)/6._dp
mat(5,5) = mat(5,5)+mu2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g1**2*vL(j1)**2)/6._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vu**2*Conjg(Yu(2,j1))*Yu(2,j1))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mu2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vu**2*Conjg(Yu(3,j1))*Yu(2,j1))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+(g1**2*vdFix**2)/6._dp
mat(6,6) = mat(6,6)-(g1**2*vuFix**2)/6._dp
mat(6,6) = mat(6,6)+mu2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(g1**2*vL(j1)**2)/6._dp
End Do 
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vu**2*Conjg(Yu(3,j1))*Yu(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSu2,ZU,ierr,test) 
 
 
! Fix order
  ZUtemp2=ZU
Do i1=1,6
  pos=Maxloc(Abs(ZUtemp2(i1,:)),1)
  ZUtemp(pos,:)=ZU(i1,:)
  MSu2temp(pos)=MSu2(i1)
  ZUtemp2(:,pos)=0._dp
End do
  MSu2 = MSu2temp
  ZU = ZUtemp
! Fix phases
Do i1=1,6
  pos=Maxloc(Abs(ZU(i1,:)),1)
  If (Real(ZU(i1,pos),dp).lt.0._dp) Then
    ZU(i1,:)=-ZU(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (MSu2(i1).ne.MSu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSu2(i1).Ge.0._dp) Then 
  MSu(i1)=Sqrt(MSu2(i1) ) 
  Else 
  MSu(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSuEffPot 

Subroutine CalculateMhhEffPot(g1,g2,Mu,Bmu,REps,Beps,ml2,mlHd2,mHd2,mHu2,             & 
& vd,vu,vL,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: g1,g2,mlHd2(3),mHd2,mHu2,vd,vu,vL(3)

Complex(dp), Intent(in) :: Mu,Bmu,REps(3),Beps(3),ml2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(5), Mhh2(5) 
Real(dp), Intent(out) :: ZH(5,5) 
 
Real(dp) :: mat(5,5)  

Real(dp) :: Mhh2temp(5), Q2 
Real(dp) :: ZHtemp(5,5),ZHtemp2(5,5) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(3*g1**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(3*g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)-(g1**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+Mu*Conjg(Mu)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1**2*vdFix*vuFix)/4._dp
mat(1,2) = mat(1,2)-(g2**2*vdFix*vuFix)/4._dp
mat(1,2) = mat(1,2)-Bmu/2._dp
mat(1,2) = mat(1,2)-Conjg(Bmu)/2._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(Mu*Conjg(REps(1)))/2._dp
mat(1,3) = mat(1,3)+mlHd2(1)
mat(1,3) = mat(1,3)+(g1**2*vd*vL(1))/4._dp
mat(1,3) = mat(1,3)+(g2**2*vd*vL(1))/4._dp
mat(1,3) = mat(1,3)-(Conjg(Mu)*REps(1))/2._dp
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(Mu*Conjg(REps(2)))/2._dp
mat(1,4) = mat(1,4)+mlHd2(2)
mat(1,4) = mat(1,4)+(g1**2*vd*vL(2))/4._dp
mat(1,4) = mat(1,4)+(g2**2*vd*vL(2))/4._dp
mat(1,4) = mat(1,4)-(Conjg(Mu)*REps(2))/2._dp
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(Mu*Conjg(REps(3)))/2._dp
mat(1,5) = mat(1,5)+mlHd2(3)
mat(1,5) = mat(1,5)+(g1**2*vd*vL(3))/4._dp
mat(1,5) = mat(1,5)+(g2**2*vd*vL(3))/4._dp
mat(1,5) = mat(1,5)-(Conjg(Mu)*REps(3))/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(3*g1**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(3*g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+Mu*Conjg(Mu)
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+Conjg(REps(j1))*REps(j1)
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+Conjg(Beps(1))/2._dp
mat(2,3) = mat(2,3)-(g1**2*vu*vL(1))/4._dp
mat(2,3) = mat(2,3)-(g2**2*vu*vL(1))/4._dp
mat(2,3) = mat(2,3)+Beps(1)/2._dp
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+Conjg(Beps(2))/2._dp
mat(2,4) = mat(2,4)-(g1**2*vu*vL(2))/4._dp
mat(2,4) = mat(2,4)-(g2**2*vu*vL(2))/4._dp
mat(2,4) = mat(2,4)+Beps(2)/2._dp
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+Conjg(Beps(3))/2._dp
mat(2,5) = mat(2,5)-(g1**2*vu*vL(3))/4._dp
mat(2,5) = mat(2,5)-(g2**2*vu*vL(3))/4._dp
mat(2,5) = mat(2,5)+Beps(3)/2._dp
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)-(g1**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+ml2(1,1)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(3,3) = mat(3,3)+(g1**2*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+Conjg(REps(1))*REps(1)
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+ml2(1,2)/2._dp
mat(3,4) = mat(3,4)+ml2(2,1)/2._dp
mat(3,4) = mat(3,4)+(g1**2*vL(1)*vL(2))/4._dp
mat(3,4) = mat(3,4)+(g2**2*vL(1)*vL(2))/4._dp
mat(3,4) = mat(3,4)+(Conjg(REps(2))*REps(1))/2._dp
mat(3,4) = mat(3,4)+(Conjg(REps(1))*REps(2))/2._dp
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+ml2(1,3)/2._dp
mat(3,5) = mat(3,5)+ml2(3,1)/2._dp
mat(3,5) = mat(3,5)+(g1**2*vL(1)*vL(3))/4._dp
mat(3,5) = mat(3,5)+(g2**2*vL(1)*vL(3))/4._dp
mat(3,5) = mat(3,5)+(Conjg(REps(3))*REps(1))/2._dp
mat(3,5) = mat(3,5)+(Conjg(REps(1))*REps(3))/2._dp
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vdFix**2)/8._dp
mat(4,4) = mat(4,4)+(g2**2*vdFix**2)/8._dp
mat(4,4) = mat(4,4)-(g1**2*vuFix**2)/8._dp
mat(4,4) = mat(4,4)-(g2**2*vuFix**2)/8._dp
mat(4,4) = mat(4,4)+ml2(2,2)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(4,4) = mat(4,4)+(g1**2*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+(g2**2*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+Conjg(REps(2))*REps(2)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+ml2(2,3)/2._dp
mat(4,5) = mat(4,5)+ml2(3,2)/2._dp
mat(4,5) = mat(4,5)+(g1**2*vL(2)*vL(3))/4._dp
mat(4,5) = mat(4,5)+(g2**2*vL(2)*vL(3))/4._dp
mat(4,5) = mat(4,5)+(Conjg(REps(3))*REps(2))/2._dp
mat(4,5) = mat(4,5)+(Conjg(REps(2))*REps(3))/2._dp
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vdFix**2)/8._dp
mat(5,5) = mat(5,5)+(g2**2*vdFix**2)/8._dp
mat(5,5) = mat(5,5)-(g1**2*vuFix**2)/8._dp
mat(5,5) = mat(5,5)-(g2**2*vuFix**2)/8._dp
mat(5,5) = mat(5,5)+ml2(3,3)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(5,5) = mat(5,5)+(g1**2*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+(g2**2*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+Conjg(REps(3))*REps(3)

 
 Do i1=2,5
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
! Fix phases
Do i1=1,5
  pos=Maxloc(Abs(ZH(i1,:)),1)
  If (Real(ZH(i1,pos),dp).lt.0._dp) Then
    ZH(i1,:)=-ZH(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,5
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
  Mhh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhhEffPot 

Subroutine CalculateMAhEffPot(g1,g2,Mu,Bmu,REps,Beps,ml2,mlHd2,mHd2,mHu2,             & 
& vd,vu,vL,TW,ZA,MAh,MAh2,kont)

Real(dp), Intent(in) :: g1,g2,mlHd2(3),mHd2,mHu2,vd,vu,vL(3),TW

Complex(dp), Intent(in) :: Mu,Bmu,REps(3),Beps(3),ml2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MAh(5), MAh2(5) 
Real(dp), Intent(out) :: ZA(5,5) 
 
Real(dp) :: ZAFIX(5,5) 
 
Real(dp) :: mat(5,5)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMAh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(g1**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)-(g1**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+Mu*Conjg(Mu)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+Bmu/2._dp
mat(1,2) = mat(1,2)+Conjg(Bmu)/2._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(Mu*Conjg(REps(1)))/2._dp
mat(1,3) = mat(1,3)+mlHd2(1)
mat(1,3) = mat(1,3)-(Conjg(Mu)*REps(1))/2._dp
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(Mu*Conjg(REps(2)))/2._dp
mat(1,4) = mat(1,4)+mlHd2(2)
mat(1,4) = mat(1,4)-(Conjg(Mu)*REps(2))/2._dp
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(Mu*Conjg(REps(3)))/2._dp
mat(1,5) = mat(1,5)+mlHd2(3)
mat(1,5) = mat(1,5)-(Conjg(Mu)*REps(3))/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(g1**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+Mu*Conjg(Mu)
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+Conjg(REps(j1))*REps(j1)
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-Conjg(Beps(1))/2._dp
mat(2,3) = mat(2,3)-Beps(1)/2._dp
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-Conjg(Beps(2))/2._dp
mat(2,4) = mat(2,4)-Beps(2)/2._dp
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-Conjg(Beps(3))/2._dp
mat(2,5) = mat(2,5)-Beps(3)/2._dp
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)-(g1**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+ml2(1,1)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(3,3) = mat(3,3)+Conjg(REps(1))*REps(1)
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+ml2(1,2)/2._dp
mat(3,4) = mat(3,4)+ml2(2,1)/2._dp
mat(3,4) = mat(3,4)+(Conjg(REps(2))*REps(1))/2._dp
mat(3,4) = mat(3,4)+(Conjg(REps(1))*REps(2))/2._dp
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+ml2(1,3)/2._dp
mat(3,5) = mat(3,5)+ml2(3,1)/2._dp
mat(3,5) = mat(3,5)+(Conjg(REps(3))*REps(1))/2._dp
mat(3,5) = mat(3,5)+(Conjg(REps(1))*REps(3))/2._dp
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vdFix**2)/8._dp
mat(4,4) = mat(4,4)+(g2**2*vdFix**2)/8._dp
mat(4,4) = mat(4,4)-(g1**2*vuFix**2)/8._dp
mat(4,4) = mat(4,4)-(g2**2*vuFix**2)/8._dp
mat(4,4) = mat(4,4)+ml2(2,2)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(4,4) = mat(4,4)+Conjg(REps(2))*REps(2)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+ml2(2,3)/2._dp
mat(4,5) = mat(4,5)+ml2(3,2)/2._dp
mat(4,5) = mat(4,5)+(Conjg(REps(3))*REps(2))/2._dp
mat(4,5) = mat(4,5)+(Conjg(REps(2))*REps(3))/2._dp
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vdFix**2)/8._dp
mat(5,5) = mat(5,5)+(g2**2*vdFix**2)/8._dp
mat(5,5) = mat(5,5)-(g1**2*vuFix**2)/8._dp
mat(5,5) = mat(5,5)-(g2**2*vuFix**2)/8._dp
mat(5,5) = mat(5,5)+ml2(3,3)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g2**2*vL(j1)**2)/8._dp
End Do 
mat(5,5) = mat(5,5)+Conjg(REps(3))*REps(3)

 
 Do i1=2,5
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MAh2,ZA,ierr,test) 
 
 
! Fix phases
Do i1=1,5
  pos=Maxloc(Abs(ZA(i1,:)),1)
  If (Real(ZA(i1,pos),dp).lt.0._dp) Then
    ZA(i1,:)=-ZA(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,5
  If (MAh2(i1).ne.MAh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MAh2(i1).Ge.0._dp) Then 
  MAh(i1)=Sqrt(MAh2(i1) ) 
  Else 
  MAh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMAhEffPot 

Subroutine CalculateMHpmEffPot(g1,g2,Mu,Bmu,REps,Beps,Ye,Te,L1,T1,ml2,mlHd2,          & 
& mHd2,mHu2,me2,vd,vu,vL,ZP,MHpm,MHpm2,kont)

Real(dp), Intent(in) :: g1,g2,mlHd2(3),mHd2,mHu2,vd,vu,vL(3)

Complex(dp), Intent(in) :: Mu,Bmu,REps(3),Beps(3),Ye(3,3),Te(3,3),L1(3,3,3),T1(3,3,3),ml2(3,3),me2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MHpm(8), MHpm2(8) 
Real(dp), Intent(out) :: ZP(8,8) 
 
Real(dp) :: ZPFIX(8,8) 
 
Real(dp) :: mat(8,8)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHpm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(g1**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)-(g1**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+Mu*Conjg(Mu)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,1) = mat(1,1)+(Conjg(Ye(j1,j3))*vL(j2)*vL(j3)*Ye(j1,j2))/2._dp
End Do 
End Do 
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(g2**2*vdFix*vuFix)/4._dp
mat(1,2) = mat(1,2)+Conjg(Bmu)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mlHd2(1)
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)-(vd*Conjg(Ye(j1,j2))*vL(j2)*Ye(j1,1))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)+(Conjg(Ye(j1,j3))*L1(1,j2,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,3) = mat(1,3)-(Conjg(Ye(j1,j3))*L1(j2,1,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
mat(1,3) = mat(1,3)+(g2**2*vd*vL(1))/4._dp
mat(1,3) = mat(1,3)-(Conjg(Mu)*REps(1))
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+mlHd2(2)
Do j2 = 1,3
Do j1 = 1,3
mat(1,4) = mat(1,4)-(vd*Conjg(Ye(j1,j2))*vL(j2)*Ye(j1,2))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,4) = mat(1,4)+(Conjg(Ye(j1,j3))*L1(2,j2,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,4) = mat(1,4)-(Conjg(Ye(j1,j3))*L1(j2,2,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
mat(1,4) = mat(1,4)+(g2**2*vd*vL(2))/4._dp
mat(1,4) = mat(1,4)-(Conjg(Mu)*REps(2))
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+mlHd2(3)
Do j2 = 1,3
Do j1 = 1,3
mat(1,5) = mat(1,5)-(vd*Conjg(Ye(j1,j2))*vL(j2)*Ye(j1,3))/2._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,5) = mat(1,5)+(Conjg(Ye(j1,j3))*L1(3,j2,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(1,5) = mat(1,5)-(Conjg(Ye(j1,j3))*L1(j2,3,j1)*vL(j2)*vL(j3))/4._dp
End Do 
End Do 
End Do 
mat(1,5) = mat(1,5)+(g2**2*vd*vL(3))/4._dp
mat(1,5) = mat(1,5)-(Conjg(Mu)*REps(3))
mat(1,6) = 0._dp 
Do j1 = 1,3
mat(1,6) = mat(1,6)-((Conjg(Te(1,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,6) = mat(1,6)-((vu*Conjg(Ye(1,j1))*REps(j1))/sqrt(2._dp))
End Do 
mat(1,7) = 0._dp 
Do j1 = 1,3
mat(1,7) = mat(1,7)-((Conjg(Te(2,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,7) = mat(1,7)-((vu*Conjg(Ye(2,j1))*REps(j1))/sqrt(2._dp))
End Do 
mat(1,8) = 0._dp 
Do j1 = 1,3
mat(1,8) = mat(1,8)-((Conjg(Te(3,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,8) = mat(1,8)-((vu*Conjg(Ye(3,j1))*REps(j1))/sqrt(2._dp))
End Do 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(g1**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+Mu*Conjg(Mu)
Do j1 = 1,3
mat(2,2) = mat(2,2)-(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+Conjg(REps(j1))*REps(j1)
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(g2**2*vu*vL(1))/4._dp
mat(2,3) = mat(2,3)-Beps(1)
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(g2**2*vu*vL(2))/4._dp
mat(2,4) = mat(2,4)-Beps(2)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(g2**2*vu*vL(3))/4._dp
mat(2,5) = mat(2,5)-Beps(3)
mat(2,6) = 0._dp 
Do j1 = 1,3
mat(2,6) = mat(2,6)-((Mu*Conjg(Ye(1,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,6) = mat(2,6)-((vd*Conjg(Ye(1,j1))*REps(j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,6) = mat(2,6)+(Conjg(L1(j1,j2,1))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,6) = mat(2,6)-(Conjg(L1(j2,j1,1))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
mat(2,7) = 0._dp 
Do j1 = 1,3
mat(2,7) = mat(2,7)-((Mu*Conjg(Ye(2,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,7) = mat(2,7)-((vd*Conjg(Ye(2,j1))*REps(j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,7) = mat(2,7)+(Conjg(L1(j1,j2,2))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,7) = mat(2,7)-(Conjg(L1(j2,j1,2))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
mat(2,8) = 0._dp 
Do j1 = 1,3
mat(2,8) = mat(2,8)-((Mu*Conjg(Ye(3,j1))*vL(j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,8) = mat(2,8)-((vd*Conjg(Ye(3,j1))*REps(j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,8) = mat(2,8)+(Conjg(L1(j1,j2,3))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(2,8) = mat(2,8)-(Conjg(L1(j2,j1,3))*vL(j2)*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
End Do 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)-(g1**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+ml2(1,1)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)-(vd*Conjg(Ye(j1,1))*L1(1,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd*Conjg(Ye(j1,1))*L1(j2,1,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)-(vd*Conjg(L1(1,j2,j1))*vL(j2)*Ye(j1,1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd*Conjg(L1(j2,1,j1))*vL(j2)*Ye(j1,1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(Conjg(L1(1,j3,j1))*L1(1,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)-(Conjg(L1(j3,1,j1))*L1(1,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)-(Conjg(L1(1,j3,j1))*L1(j2,1,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,3) = mat(3,3)+(Conjg(L1(j3,1,j1))*L1(j2,1,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(3,3) = mat(3,3)+(g2**2*vL(1)**2)/4._dp
mat(3,3) = mat(3,3)+Conjg(REps(1))*REps(1)
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+ml2(1,2)
Do j1 = 1,3
mat(3,4) = mat(3,4)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)-(vd*Conjg(Ye(j1,1))*L1(2,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)+(vd*Conjg(Ye(j1,1))*L1(j2,2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)-(vd*Conjg(L1(1,j2,j1))*vL(j2)*Ye(j1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)+(vd*Conjg(L1(j2,1,j1))*vL(j2)*Ye(j1,2))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)+(Conjg(L1(1,j3,j1))*L1(2,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)-(Conjg(L1(j3,1,j1))*L1(2,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)-(Conjg(L1(1,j3,j1))*L1(j2,2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,4) = mat(3,4)+(Conjg(L1(j3,1,j1))*L1(j2,2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(3,4) = mat(3,4)+(g2**2*vL(1)*vL(2))/4._dp
mat(3,4) = mat(3,4)+Conjg(REps(1))*REps(2)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+ml2(1,3)
Do j1 = 1,3
mat(3,5) = mat(3,5)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)-(vd*Conjg(Ye(j1,1))*L1(3,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)+(vd*Conjg(Ye(j1,1))*L1(j2,3,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)-(vd*Conjg(L1(1,j2,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)+(vd*Conjg(L1(j2,1,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)+(Conjg(L1(1,j3,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)-(Conjg(L1(j3,1,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)-(Conjg(L1(1,j3,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(3,5) = mat(3,5)+(Conjg(L1(j3,1,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(3,5) = mat(3,5)+(g2**2*vL(1)*vL(3))/4._dp
mat(3,5) = mat(3,5)+Conjg(REps(1))*REps(3)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-((vu*Mu*Conjg(Ye(1,1)))/sqrt(2._dp))
mat(3,6) = mat(3,6)+(vd*Conjg(Te(1,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,6) = mat(3,6)-(Conjg(T1(1,j1,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,6) = mat(3,6)+(Conjg(T1(j1,1,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,6) = mat(3,6)-(vu*Conjg(L1(1,j1,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,6) = mat(3,6)+(vu*Conjg(L1(j1,1,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,7) = 0._dp 
mat(3,7) = mat(3,7)-((vu*Mu*Conjg(Ye(2,1)))/sqrt(2._dp))
mat(3,7) = mat(3,7)+(vd*Conjg(Te(2,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,7) = mat(3,7)-(Conjg(T1(1,j1,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,7) = mat(3,7)+(Conjg(T1(j1,1,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,7) = mat(3,7)-(vu*Conjg(L1(1,j1,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,7) = mat(3,7)+(vu*Conjg(L1(j1,1,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,8) = 0._dp 
mat(3,8) = mat(3,8)-((vu*Mu*Conjg(Ye(3,1)))/sqrt(2._dp))
mat(3,8) = mat(3,8)+(vd*Conjg(Te(3,1)))/sqrt(2._dp)
Do j1 = 1,3
mat(3,8) = mat(3,8)-(Conjg(T1(1,j1,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,8) = mat(3,8)+(Conjg(T1(j1,1,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,8) = mat(3,8)-(vu*Conjg(L1(1,j1,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,8) = mat(3,8)+(vu*Conjg(L1(j1,1,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vdFix**2)/8._dp
mat(4,4) = mat(4,4)-(g2**2*vdFix**2)/8._dp
mat(4,4) = mat(4,4)-(g1**2*vuFix**2)/8._dp
mat(4,4) = mat(4,4)+(g2**2*vuFix**2)/8._dp
mat(4,4) = mat(4,4)+ml2(2,2)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,2))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)-(vd*Conjg(Ye(j1,2))*L1(2,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd*Conjg(Ye(j1,2))*L1(j2,2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)-(vd*Conjg(L1(2,j2,j1))*vL(j2)*Ye(j1,2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd*Conjg(L1(j2,2,j1))*vL(j2)*Ye(j1,2))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(Conjg(L1(2,j3,j1))*L1(2,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)-(Conjg(L1(j3,2,j1))*L1(2,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)-(Conjg(L1(2,j3,j1))*L1(j2,2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,4) = mat(4,4)+(Conjg(L1(j3,2,j1))*L1(j2,2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(4,4) = mat(4,4)+(g2**2*vL(2)**2)/4._dp
mat(4,4) = mat(4,4)+Conjg(REps(2))*REps(2)
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+ml2(2,3)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)-(vd*Conjg(Ye(j1,2))*L1(3,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd*Conjg(Ye(j1,2))*L1(j2,3,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)-(vd*Conjg(L1(2,j2,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd*Conjg(L1(j2,2,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(Conjg(L1(2,j3,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)-(Conjg(L1(j3,2,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)-(Conjg(L1(2,j3,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(4,5) = mat(4,5)+(Conjg(L1(j3,2,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(4,5) = mat(4,5)+(g2**2*vL(2)*vL(3))/4._dp
mat(4,5) = mat(4,5)+Conjg(REps(2))*REps(3)
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)-((vu*Mu*Conjg(Ye(1,2)))/sqrt(2._dp))
mat(4,6) = mat(4,6)+(vd*Conjg(Te(1,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(4,6) = mat(4,6)-(Conjg(T1(2,j1,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,6) = mat(4,6)+(Conjg(T1(j1,2,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,6) = mat(4,6)-(vu*Conjg(L1(2,j1,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vu*Conjg(L1(j1,2,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(4,7) = 0._dp 
mat(4,7) = mat(4,7)-((vu*Mu*Conjg(Ye(2,2)))/sqrt(2._dp))
mat(4,7) = mat(4,7)+(vd*Conjg(Te(2,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(4,7) = mat(4,7)-(Conjg(T1(2,j1,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,7) = mat(4,7)+(Conjg(T1(j1,2,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,7) = mat(4,7)-(vu*Conjg(L1(2,j1,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,7) = mat(4,7)+(vu*Conjg(L1(j1,2,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(4,8) = 0._dp 
mat(4,8) = mat(4,8)-((vu*Mu*Conjg(Ye(3,2)))/sqrt(2._dp))
mat(4,8) = mat(4,8)+(vd*Conjg(Te(3,2)))/sqrt(2._dp)
Do j1 = 1,3
mat(4,8) = mat(4,8)-(Conjg(T1(2,j1,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,8) = mat(4,8)+(Conjg(T1(j1,2,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,8) = mat(4,8)-(vu*Conjg(L1(2,j1,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(4,8) = mat(4,8)+(vu*Conjg(L1(j1,2,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vdFix**2)/8._dp
mat(5,5) = mat(5,5)-(g2**2*vdFix**2)/8._dp
mat(5,5) = mat(5,5)-(g1**2*vuFix**2)/8._dp
mat(5,5) = mat(5,5)+(g2**2*vuFix**2)/8._dp
mat(5,5) = mat(5,5)+ml2(3,3)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(g1**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)-(g2**2*vL(j1)**2)/8._dp
End Do 
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd**2*Conjg(Ye(j1,3))*Ye(j1,3))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)-(vd*Conjg(Ye(j1,3))*L1(3,j2,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd*Conjg(Ye(j1,3))*L1(j2,3,j1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)-(vd*Conjg(L1(3,j2,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd*Conjg(L1(j2,3,j1))*vL(j2)*Ye(j1,3))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(Conjg(L1(3,j3,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)-(Conjg(L1(j3,3,j1))*L1(3,j2,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)-(Conjg(L1(3,j3,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(5,5) = mat(5,5)+(Conjg(L1(j3,3,j1))*L1(j2,3,j1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(5,5) = mat(5,5)+(g2**2*vL(3)**2)/4._dp
mat(5,5) = mat(5,5)+Conjg(REps(3))*REps(3)
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)-((vu*Mu*Conjg(Ye(1,3)))/sqrt(2._dp))
mat(5,6) = mat(5,6)+(vd*Conjg(Te(1,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(5,6) = mat(5,6)-(Conjg(T1(3,j1,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,6) = mat(5,6)+(Conjg(T1(j1,3,1))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,6) = mat(5,6)-(vu*Conjg(L1(3,j1,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vu*Conjg(L1(j1,3,1))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(5,7) = 0._dp 
mat(5,7) = mat(5,7)-((vu*Mu*Conjg(Ye(2,3)))/sqrt(2._dp))
mat(5,7) = mat(5,7)+(vd*Conjg(Te(2,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(5,7) = mat(5,7)-(Conjg(T1(3,j1,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,7) = mat(5,7)+(Conjg(T1(j1,3,2))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,7) = mat(5,7)-(vu*Conjg(L1(3,j1,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,7) = mat(5,7)+(vu*Conjg(L1(j1,3,2))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(5,8) = 0._dp 
mat(5,8) = mat(5,8)-((vu*Mu*Conjg(Ye(3,3)))/sqrt(2._dp))
mat(5,8) = mat(5,8)+(vd*Conjg(Te(3,3)))/sqrt(2._dp)
Do j1 = 1,3
mat(5,8) = mat(5,8)-(Conjg(T1(3,j1,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,8) = mat(5,8)+(Conjg(T1(j1,3,3))*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,8) = mat(5,8)-(vu*Conjg(L1(3,j1,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(5,8) = mat(5,8)+(vu*Conjg(L1(j1,3,3))*REps(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)-(g1**2*vdFix**2)/4._dp
mat(6,6) = mat(6,6)+(g1**2*vuFix**2)/4._dp
mat(6,6) = mat(6,6)+me2(1,1)
Do j1 = 1,3
Do j2 = 1,3
mat(6,6) = mat(6,6)+(Conjg(Ye(1,j2))*vL(j1)*vL(j2)*Ye(1,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(6,6) = mat(6,6)-(g1**2*vL(j1)**2)/4._dp
End Do 
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd**2*Conjg(Ye(1,j1))*Ye(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)-(vd*Conjg(Ye(1,j1))*L1(j1,j2,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd*Conjg(Ye(1,j1))*L1(j2,j1,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)-(vd*Conjg(L1(j1,j2,1))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd*Conjg(L1(j2,j1,1))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(Conjg(L1(j1,j3,1))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)-(Conjg(L1(j3,j1,1))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)-(Conjg(L1(j1,j3,1))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,6) = mat(6,6)+(Conjg(L1(j3,j1,1))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(6,7) = 0._dp 
mat(6,7) = mat(6,7)+me2(1,2)
Do j1 = 1,3
Do j2 = 1,3
mat(6,7) = mat(6,7)+(Conjg(Ye(2,j2))*vL(j1)*vL(j2)*Ye(1,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(6,7) = mat(6,7)+(vd**2*Conjg(Ye(2,j1))*Ye(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)-(vd*Conjg(Ye(2,j1))*L1(j1,j2,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)+(vd*Conjg(Ye(2,j1))*L1(j2,j1,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)-(vd*Conjg(L1(j1,j2,2))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)+(vd*Conjg(L1(j2,j1,2))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)+(Conjg(L1(j1,j3,2))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)-(Conjg(L1(j3,j1,2))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)-(Conjg(L1(j1,j3,2))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,7) = mat(6,7)+(Conjg(L1(j3,j1,2))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(6,8) = 0._dp 
mat(6,8) = mat(6,8)+me2(1,3)
Do j1 = 1,3
Do j2 = 1,3
mat(6,8) = mat(6,8)+(Conjg(Ye(3,j2))*vL(j1)*vL(j2)*Ye(1,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(6,8) = mat(6,8)+(vd**2*Conjg(Ye(3,j1))*Ye(1,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)-(vd*Conjg(Ye(3,j1))*L1(j1,j2,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)+(vd*Conjg(Ye(3,j1))*L1(j2,j1,1)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)-(vd*Conjg(L1(j1,j2,3))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)+(vd*Conjg(L1(j2,j1,3))*vL(j2)*Ye(1,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)+(Conjg(L1(j1,j3,3))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)-(Conjg(L1(j3,j1,3))*L1(j1,j2,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)-(Conjg(L1(j1,j3,3))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(6,8) = mat(6,8)+(Conjg(L1(j3,j1,3))*L1(j2,j1,1)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(7,7) = 0._dp 
mat(7,7) = mat(7,7)-(g1**2*vdFix**2)/4._dp
mat(7,7) = mat(7,7)+(g1**2*vuFix**2)/4._dp
mat(7,7) = mat(7,7)+me2(2,2)
Do j1 = 1,3
Do j2 = 1,3
mat(7,7) = mat(7,7)+(Conjg(Ye(2,j2))*vL(j1)*vL(j2)*Ye(2,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(7,7) = mat(7,7)-(g1**2*vL(j1)**2)/4._dp
End Do 
Do j1 = 1,3
mat(7,7) = mat(7,7)+(vd**2*Conjg(Ye(2,j1))*Ye(2,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)-(vd*Conjg(Ye(2,j1))*L1(j1,j2,2)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)+(vd*Conjg(Ye(2,j1))*L1(j2,j1,2)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)-(vd*Conjg(L1(j1,j2,2))*vL(j2)*Ye(2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)+(vd*Conjg(L1(j2,j1,2))*vL(j2)*Ye(2,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)+(Conjg(L1(j1,j3,2))*L1(j1,j2,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)-(Conjg(L1(j3,j1,2))*L1(j1,j2,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)-(Conjg(L1(j1,j3,2))*L1(j2,j1,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,7) = mat(7,7)+(Conjg(L1(j3,j1,2))*L1(j2,j1,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(7,8) = 0._dp 
mat(7,8) = mat(7,8)+me2(2,3)
Do j1 = 1,3
Do j2 = 1,3
mat(7,8) = mat(7,8)+(Conjg(Ye(3,j2))*vL(j1)*vL(j2)*Ye(2,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(7,8) = mat(7,8)+(vd**2*Conjg(Ye(3,j1))*Ye(2,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)-(vd*Conjg(Ye(3,j1))*L1(j1,j2,2)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)+(vd*Conjg(Ye(3,j1))*L1(j2,j1,2)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)-(vd*Conjg(L1(j1,j2,3))*vL(j2)*Ye(2,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)+(vd*Conjg(L1(j2,j1,3))*vL(j2)*Ye(2,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)+(Conjg(L1(j1,j3,3))*L1(j1,j2,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)-(Conjg(L1(j3,j1,3))*L1(j1,j2,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)-(Conjg(L1(j1,j3,3))*L1(j2,j1,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(7,8) = mat(7,8)+(Conjg(L1(j3,j1,3))*L1(j2,j1,2)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
mat(8,8) = 0._dp 
mat(8,8) = mat(8,8)-(g1**2*vdFix**2)/4._dp
mat(8,8) = mat(8,8)+(g1**2*vuFix**2)/4._dp
mat(8,8) = mat(8,8)+me2(3,3)
Do j1 = 1,3
Do j2 = 1,3
mat(8,8) = mat(8,8)+(Conjg(Ye(3,j2))*vL(j1)*vL(j2)*Ye(3,j1))/2._dp
End Do 
End Do 
Do j1 = 1,3
mat(8,8) = mat(8,8)-(g1**2*vL(j1)**2)/4._dp
End Do 
Do j1 = 1,3
mat(8,8) = mat(8,8)+(vd**2*Conjg(Ye(3,j1))*Ye(3,j1))/2._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)-(vd*Conjg(Ye(3,j1))*L1(j1,j2,3)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)+(vd*Conjg(Ye(3,j1))*L1(j2,j1,3)*vL(j2))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)-(vd*Conjg(L1(j1,j2,3))*vL(j2)*Ye(3,j1))/4._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)+(vd*Conjg(L1(j2,j1,3))*vL(j2)*Ye(3,j1))/4._dp
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)+(Conjg(L1(j1,j3,3))*L1(j1,j2,3)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)-(Conjg(L1(j3,j1,3))*L1(j1,j2,3)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)-(Conjg(L1(j1,j3,3))*L1(j2,j1,3)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
mat(8,8) = mat(8,8)+(Conjg(L1(j3,j1,3))*L1(j2,j1,3)*vL(j2)*vL(j3))/8._dp
End Do 
End Do 
End Do 

 
 Do i1=2,8
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHpm2,ZP,ierr,test) 
 
 
! Fix phases
Do i1=1,8
  pos=Maxloc(Abs(ZP(i1,:)),1)
  If (Real(ZP(i1,pos),dp).lt.0._dp) Then
    ZP(i1,:)=-ZP(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,8
  If (MHpm2(i1).ne.MHpm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHpm2(i1).Ge.0._dp) Then 
  MHpm(i1)=Sqrt(MHpm2(i1) ) 
  Else 
  MHpm(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHpmEffPot 

Subroutine CalculateMChiEffPot(g1,g2,Mu,REps,M1,M2,vd,vu,vL,UV,MChi,kont)

Real(dp) ,Intent(in) :: g1,g2,vd,vu,vL(3)

Complex(dp) ,Intent(in) :: Mu,REps(3),M1,M2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MChi(7) 
Complex(dp), Intent(out) ::  UV(7,7) 
                              
Complex(dp) :: mat(7,7), mat2(7,7), phaseM, E7(7) 

Real(dp) :: UVa(7,7), test(2), eig(7) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMChi'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(g1*vL(1))/2._dp
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(g2*vL(1))/2._dp
mat(1,6) = 0._dp 
mat(1,7) = 0._dp 
mat(1,7) = mat(1,7)+REps(1)
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(g1*vL(2))/2._dp
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(g2*vL(2))/2._dp
mat(2,6) = 0._dp 
mat(2,7) = 0._dp 
mat(2,7) = mat(2,7)+REps(2)
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(g1*vL(3))/2._dp
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(g2*vL(3))/2._dp
mat(3,6) = 0._dp 
mat(3,7) = 0._dp 
mat(3,7) = mat(3,7)+REps(3)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+M1
mat(4,5) = 0._dp 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)-(g1*vd)/2._dp
mat(4,7) = 0._dp 
mat(4,7) = mat(4,7)+(g1*vu)/2._dp
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+M2
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+(g2*vd)/2._dp
mat(5,7) = 0._dp 
mat(5,7) = mat(5,7)-(g2*vu)/2._dp
mat(6,6) = 0._dp 
mat(6,7) = 0._dp 
mat(6,7) = mat(6,7)-1._dp*(Mu)
mat(7,7) = 0._dp 

 
 Do i1=2,7
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,7
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MChi(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MChi(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
  Do i1=1,7
   pos=Maxloc(Abs(UV(i1,:)),1) 
   If (Abs(Real(UV(i1,pos),dp)).gt.Abs(Aimag(UV(i1,pos)))) Then 
      If (Real(UV(i1,pos),dp).lt.0._dp) Then 
        UV(i1,:)=-UV(i1,:) 
       End If 
    Else 
      If (Aimag(UV(i1,pos)).lt.0._dp) Then 
        UV(i1,:)=-UV(i1,:) 
      End If 
    End If 
 End Do 
 
Do i1=1,6
  Do i2=i1+1,7
    If (MChi(i1).Gt.MChi(i2)) Then 
      Eig(1) = MChi(i1) 
      MChi(i1) = MChi(i2) 
      MChi(i2) =  Eig(1) 
      E7 = UV(i1,:) 
      UV(i1,:) = UV(i2,:) 
      UV(i2,:) = E7
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call EigensystemQP(mat2, Eig, UV, ierr, test) 
mat2 = Matmul( Conjg(UV), Matmul( mat, Transpose( Conjg(UV)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,7-1
If (MaxVal(Abs(mat2(i1,(i1+1):7))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystemQP(Real(mat2,dp),Eig,UVa,ierr,test) 
 
     UV = MatMul(UV,UVa)
  Do i1=1,7
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MChi(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MChi(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,7
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV(i1,:)= phaseM * UV(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
MChi = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMChi, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMChiEffPot 

Subroutine CalculateMChaEffPot(g2,Mu,REps,Ye,L1,M2,vd,vu,vL,ZEL,ZER,MCha,kont)

Real(dp),Intent(in) :: g2,vd,vu,vL(3)

Complex(dp),Intent(in) :: Mu,REps(3),Ye(3,3),L1(3,3,3),M2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MCha(5) 
 Complex(dp), Intent(out) :: ZEL(5,5), ZER(5,5) 
 
 Complex(dp) :: mat(5,5)=0._dp, mat2(5,5)=0._dp, phaseM 

Complex(dp) :: ZEL2(5,5), ZER2(5,5) 
 
 Real(dp) :: ZEL1(5,5), ZER1(5,5), test(2), MCha2(5) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMCha'
 
MCha = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
Do j1 = 1,3
mat(1,1) = mat(1,1)-(L1(1,j1,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(L1(j1,1,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(1,1) = mat(1,1)+(vd*Ye(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
Do j1 = 1,3
mat(1,2) = mat(1,2)-(L1(1,j1,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,2) = mat(1,2)+(L1(j1,1,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(1,2) = mat(1,2)+(vd*Ye(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
Do j1 = 1,3
mat(1,3) = mat(1,3)-(L1(1,j1,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(1,3) = mat(1,3)+(L1(j1,1,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(1,3) = mat(1,3)+(vd*Ye(3,1))/sqrt(2._dp)
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(g2*vL(1))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-REps(1)
mat(2,1) = 0._dp 
Do j1 = 1,3
mat(2,1) = mat(2,1)-(L1(2,j1,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,1) = mat(2,1)+(L1(j1,2,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(2,1) = mat(2,1)+(vd*Ye(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
Do j1 = 1,3
mat(2,2) = mat(2,2)-(L1(2,j1,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(L1(j1,2,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(2,2) = mat(2,2)+(vd*Ye(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
Do j1 = 1,3
mat(2,3) = mat(2,3)-(L1(2,j1,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(2,3) = mat(2,3)+(L1(j1,2,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(2,3) = mat(2,3)+(vd*Ye(3,2))/sqrt(2._dp)
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(g2*vL(2))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-REps(2)
mat(3,1) = 0._dp 
Do j1 = 1,3
mat(3,1) = mat(3,1)-(L1(3,j1,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,1) = mat(3,1)+(L1(j1,3,1)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,1) = mat(3,1)+(vd*Ye(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
Do j1 = 1,3
mat(3,2) = mat(3,2)-(L1(3,j1,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,2) = mat(3,2)+(L1(j1,3,2)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,2) = mat(3,2)+(vd*Ye(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
Do j1 = 1,3
mat(3,3) = mat(3,3)-(L1(3,j1,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(L1(j1,3,3)*vL(j1))/(2._dp*sqrt(2._dp))
End Do 
mat(3,3) = mat(3,3)+(vd*Ye(3,3))/sqrt(2._dp)
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(g2*vL(3))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-REps(3)
mat(4,1) = 0._dp 
mat(4,2) = 0._dp 
mat(4,3) = 0._dp 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+M2
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+(g2*vu)/sqrt(2._dp)
mat(5,1) = 0._dp 
Do j1 = 1,3
mat(5,1) = mat(5,1)-((vL(j1)*Ye(1,j1))/sqrt(2._dp))
End Do 
mat(5,2) = 0._dp 
Do j1 = 1,3
mat(5,2) = mat(5,2)-((vL(j1)*Ye(2,j1))/sqrt(2._dp))
End Do 
mat(5,3) = 0._dp 
Do j1 = 1,3
mat(5,3) = mat(5,3)-((vL(j1)*Ye(3,j1))/sqrt(2._dp))
End Do 
mat(5,4) = 0._dp 
mat(5,4) = mat(5,4)+(g2*vd)/sqrt(2._dp)
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+Mu

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MCha2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MCha2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MCha2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,5
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,5
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MCha2(i1).ne.MCha2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MCha2(i1)).Le.MaxMassNumericalZero) MCha2(i1) = Abs(MCha2(i1))+1.E-10_dp 
  If (MCha2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMCha, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MCha = Sqrt( MCha2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMChaEffPot 

Subroutine CalculateMFdEffPot(Yd,L2,vd,vL,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: vd,vL(3)

Complex(dp),Intent(in) :: Yd(3,3),L2(3,3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
Do j1 = 1,3
mat(1,1) = mat(1,1)+(L2(j1,1,1)*vL(j1))/sqrt(2._dp)
End Do 
mat(1,1) = mat(1,1)+(vd*Yd(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
Do j1 = 1,3
mat(1,2) = mat(1,2)+(L2(j1,1,2)*vL(j1))/sqrt(2._dp)
End Do 
mat(1,2) = mat(1,2)+(vd*Yd(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
Do j1 = 1,3
mat(1,3) = mat(1,3)+(L2(j1,1,3)*vL(j1))/sqrt(2._dp)
End Do 
mat(1,3) = mat(1,3)+(vd*Yd(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
Do j1 = 1,3
mat(2,1) = mat(2,1)+(L2(j1,2,1)*vL(j1))/sqrt(2._dp)
End Do 
mat(2,1) = mat(2,1)+(vd*Yd(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
Do j1 = 1,3
mat(2,2) = mat(2,2)+(L2(j1,2,2)*vL(j1))/sqrt(2._dp)
End Do 
mat(2,2) = mat(2,2)+(vd*Yd(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
Do j1 = 1,3
mat(2,3) = mat(2,3)+(L2(j1,2,3)*vL(j1))/sqrt(2._dp)
End Do 
mat(2,3) = mat(2,3)+(vd*Yd(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
Do j1 = 1,3
mat(3,1) = mat(3,1)+(L2(j1,3,1)*vL(j1))/sqrt(2._dp)
End Do 
mat(3,1) = mat(3,1)+(vd*Yd(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
Do j1 = 1,3
mat(3,2) = mat(3,2)+(L2(j1,3,2)*vL(j1))/sqrt(2._dp)
End Do 
mat(3,2) = mat(3,2)+(vd*Yd(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
Do j1 = 1,3
mat(3,3) = mat(3,3)+(L2(j1,3,3)*vL(j1))/sqrt(2._dp)
End Do 
mat(3,3) = mat(3,3)+(vd*Yd(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFdEffPot 

Subroutine CalculateMFuEffPot(Yu,vu,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: vu

Complex(dp),Intent(in) :: Yu(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vu*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vu*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vu*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vu*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vu*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vu*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vu*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vu*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vu*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFuEffPot 

Subroutine CalculateVPVZEffPot(g1,g2,vd,vu,vL,ZZ,MVZ,MVZ2,TW,kont)

Real(dp), Intent(in) :: g1,g2,vd,vu,vL(3)

Real(dp), Intent(out) :: TW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp) :: VPVZ2(2),VPVZ(2)  

Real(dp), Intent(out) :: ZZ(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZ'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vdFix**2)/4._dp
mat(1,1) = mat(1,1)+(g1**2*vuFix**2)/4._dp
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g1**2*vL(j1)**2)/4._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*vdFix**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vuFix**2)/4._dp
Do j1 = 1,3
mat(1,2) = mat(1,2)-(g1*g2*vL(j1)**2)/4._dp
End Do 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/4._dp
Do j1 = 1,3
mat(2,2) = mat(2,2)+(g2**2*vL(j1)**2)/4._dp
End Do 

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZ2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VPVZ2(i1)).Le.1.E-10_dp*(Maxval(VPVZ2))) VPVZ2(i1) = 1.E-10_dp 
  If (VPVZ2(i1).ne.VPVZ2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZ2(i1).Ge.0._dp) Then 
  VPVZ(i1) =Sqrt(VPVZ2(i1) ) 
  Else 
  VPVZ(i1)= 1._dp 
  VPVZ(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZ(2) 
MVZ2 = VPVZ2(2) 

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZEffPot 

Subroutine CalculateVWmEffPot(g2,vd,vu,vL,ZW,MVWm,MVWm2,kont)

Real(dp), Intent(in) :: g2,vd,vu,vL(3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWm, MVWm2
Real(dp) :: VWm2(2),VWm(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vuFix**2)/4._dp
Do j1 = 1,3
mat(1,1) = mat(1,1)+(g2**2*vL(j1)**2)/4._dp
End Do 
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/4._dp
Do j1 = 1,3
mat(2,2) = mat(2,2)+(g2**2*vL(j1)**2)/4._dp
End Do 

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWm2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWm2(i1)).Le.1.E-10_dp*(Maxval(VWm2))) VWm2(i1) = 1.E-10_dp 
  If (VWm2(i1).ne.VWm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWm2(i1).Ge.0._dp) Then 
  VWm(i1) =Sqrt(VWm2(i1) ) 
  Else 
  VWm(i1)= 1._dp 
  VWm(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVWm = VWm(1) 
MVWm2 = VWm2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWmEffPot 

Subroutine TreeMassesSM(MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,MVWm,MVWm2,           & 
& MVZ,MVZ2,TW,ZEL,ZER,ZDL,ZDR,UV,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,               & 
& L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,             & 
& M1,M2,M3,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Real(dp),Intent(out) :: MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),MFu2(3),MVWm,MVWm2,           & 
& MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(out) :: ZEL(5,5),ZER(5,5),ZDL(3,3),ZDR(3,3),UV(7,7),ZUL(3,3),ZUR(3,3),ZW(2,2)

Real(dp),Intent(in) :: vd,vu,vL(3)

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesMSSM-RpV/LnV'
 
kont = 0 
Call CalculateMChi(g1,g2,Mu,REps,M1,M2,vd,vu,vL,UV,MChi,kont)

MChi2 = MChi**2 
Call CalculateMCha(g2,Mu,REps,Ye,L1,M2,vd,vu,vL,ZEL,ZER,MCha,kont)

MCha2 = MCha**2 
Call CalculateMFd(Yd,L2,vd,vL,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 

 
 Call CalculateVPVZ(g1,g2,vd,vu,vL,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWm(g2,vd,vu,vL,ZW,MVWm,MVWm2,kont)

Iname = Iname - 1 
 
End Subroutine  TreeMassesSM 
 
 
Subroutine SortGoldstones(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,           & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,kont)

Real(dp),Intent(inout) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp),Intent(inout) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Integer, Intent(inout) :: kont 
Integer :: i1, i2, pos 
Real(dp) :: MAhtemp(5) 
Complex(dp) :: ZAhtemp(5,5) 
Real(dp) :: MHpmtemp(8) 
Complex(dp) :: ZHpmtemp(8,8) 


pos = MinLoc(Abs(MAh2-MVZ2*RXiZ),1) 
If (pos.ne.1) Then 
  MAhtemp = MAh2 
  ZAhtemp = ZA 
  MAh2(1) = MAhtemp(pos) 
  ZA(1,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(1) 
  ZA(pos,:) = ZAhtemp(1,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=2,5
 pos = Minloc(MAh2(i1:5),1) + i1 -1  
If (pos.ne.i1) Then 
  MAhtemp = MAh2 
  ZAhtemp = ZA 
  MAh2(i1) = MAhtemp(pos) 
  ZA(i1,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(i1) 
  ZA(pos,:) = ZAhtemp(i1,:) 
End if 
End do 
MAh = sqrt(MAh2) 

 
 
pos = MinLoc(Abs(MHpm2-MVWm2*RXiWm),1) 
If (pos.ne.1) Then 
  MHpmtemp = MHpm2 
  ZHpmtemp = ZP 
  MHpm2(1) = MHpmtemp(pos) 
  ZP(1,:) = ZHpmtemp(pos,:) 
  MHpm2(pos) = MHpmtemp(1) 
  ZP(pos,:) = ZHpmtemp(1,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=2,8
 pos = Minloc(MHpm2(i1:8),1) + i1 -1  
If (pos.ne.i1) Then 
  MHpmtemp = MHpm2 
  ZHpmtemp = ZP 
  MHpm2(i1) = MHpmtemp(pos) 
  ZP(i1,:) = ZHpmtemp(pos,:) 
  MHpm2(pos) = MHpmtemp(i1) 
  ZP(pos,:) = ZHpmtemp(i1,:) 
End if 
End do 
MHpm = sqrt(MHpm2) 

 
 
End subroutine SortGoldstones 


End Module TreeLevelMasses_MSSMLV 
 
