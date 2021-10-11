Module Pole2L_MSSMLV 
 
Use Control 
Use Settings 
Use Couplings_MSSMLV 
Use AddLoopFunctions 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_MSSMLV 
Use StandardModel 
Use TreeLevelMasses_MSSMLV 
Use Pole2LFunctions
Contains 
 
Subroutine CalculatePi2S(p2,vd,vu,vL,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,              & 
& Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,kont,tad2L,          & 
& Pi2S,Pi2P)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Real(dp),Intent(in) :: vd,vu,vL(3)

Real(dp) :: MAh(5),MAh2(5),MCha(5),MCha2(5),MChi(7),MChi2(7),MFd(3),MFd2(3),MFu(3),               & 
& MFu2(3),MGlu,MGlu2,Mhh(5),Mhh2(5),MHpm(8),MHpm2(8),MSd(6),MSd2(6),MSu(6),              & 
& MSu2(6),MVWm,MVWm2,MVZ,MVZ2,TW,ZA(5,5),ZH(5,5),ZP(8,8),ZZ(2,2)

Complex(dp) :: pG,ZEL(5,5),ZER(5,5),ZD(6,6),ZDL(3,3),ZDR(3,3),UV(7,7),ZU(6,6),ZUL(3,3),              & 
& ZUR(3,3),ZW(2,2)

Complex(dp) :: cplAhHpmcHpm(5,8,8),cplAhSdcSd(5,6,6),cplAhSucSu(5,6,6),cplhhHpmcHpm(5,8,8),          & 
& cplhhSdcSd(5,6,6),cplhhSucSu(5,6,6),cplHpmSucSd(8,6,6),cplSdcHpmcSu(6,8,6),            & 
& cplSdcSdVG(6,6),cplSucSuVG(6,6),cplVGVGVG,cplcChaChaAhL(5,5,5),cplcChaChaAhR(5,5,5),   & 
& cplcFdFdAhL(3,3,5),cplcFdFdAhR(3,3,5),cplcFuFuAhL(3,3,5),cplcFuFuAhR(3,3,5),           & 
& cplChiChacHpmL(7,5,8),cplChiChacHpmR(7,5,8),cplChaFucSdL(5,3,6),cplChaFucSdR(5,3,6),   & 
& cplcChaChahhL(5,5,5),cplcChaChahhR(5,5,5),cplcFdChaSuL(3,5,6),cplcFdChaSuR(3,5,6),     & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplcChaChiHpmL(5,7,8),cplcChaChiHpmR(5,7,8),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),   & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplcFdFdhhL(3,3,5),cplcFdFdhhR(3,3,5),cplcChaFdcSuL(5,3,6),cplcChaFdcSuR(5,3,6),       & 
& cplcFuFdcHpmL(3,3,8),cplcFuFdcHpmR(3,3,8),cplGluFucSuL(3,6),cplGluFucSuR(3,6),         & 
& cplcFuFuhhL(3,3,5),cplcFuFuhhR(3,3,5),cplcFdFuHpmL(3,3,8),cplcFdFuHpmR(3,3,8),         & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(5,3,6),cplcChacFuSdR(5,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhHpmcHpm(5,5,8,8),cplAhAhSdcSd(5,5,6,6),cplAhAhSucSu(5,5,6,6),cplAhhhHpmcHpm(5,5,8,8),& 
& cplAhhhSdcSd(5,5,6,6),cplAhHpmSucSd(5,8,6,6),cplAhSdcHpmcSu(5,6,8,6),cplhhhhHpmcHpm(5,5,8,8),& 
& cplhhhhSdcSd(5,5,6,6),cplhhhhSucSu(5,5,6,6),cplhhHpmSucSd(5,8,6,6),cplhhSdcHpmcSu(5,6,8,6),& 
& cplHpmHpmcHpmcHpm(8,8,8,8),cplHpmSdcHpmcSd(8,6,8,6),cplHpmSucHpmcSu(8,6,8,6),          & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSuSucSucSu(6,6,6,6)

Real(dp), Intent(in) :: p2
Integer, Intent(inout):: kont
Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 
Real(dp) :: Qscale,prefactor,funcvalue
complex(dp) :: cplxprefactor,A0m
Real(dp)  :: temptad(5)
Real(dp)  :: tempcont(5,5)
Real(dp)  :: tempcontah(5,5)
Real(dp)  :: runningval(5,5)
Real(dp), Intent(out) :: tad2l(5)
Real(dp), Intent(out) :: Pi2S(5,5)
Real(dp), Intent(out) :: Pi2P(5,5)
complex(dp) :: coup1,coup2,coup3,coup4
complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r
real(dp) :: epsFmass
real(dp) :: epscouplings
Real(dp)  :: tempcouplingvector(5)
Real(dp)  :: tempcouplingmatrix(5,5)
Real(dp)  :: tempcouplingmatrixah(5,5)
logical :: nonzerocoupling
real(dp) :: delta2Ltadpoles(5)
real(dp)  :: delta2Lmasses(5,5)
real(dp)  :: delta2Lmassesah(5,5)
Real(dp)  :: tad1LG(5)
complex(dp) :: tad1LmatrixSd(6,6)
complex(dp) :: tad1LmatrixSu(6,6)
complex(dp) :: tad1Lmatrixhh(5,5)
complex(dp) :: tad1LmatrixAh(5,5)
complex(dp) :: tad1LmatrixHpm(8,8)
complex(dp) :: tad1LmatrixChi(7,7)
complex(dp) :: tad1LmatrixCha(5,5)


tad2l(:)=0
Pi2S(:,:)=0
Pi2P(:,:)=0
Qscale=getrenormalizationscale()
epsfmass=0._dp
epscouplings=1.0E-6_dp
Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFu,MFu2,               & 
& MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSu,MSu2,MVWm,MVWm2,MVZ,MVZ2,pG,               & 
& TW,ZEL,ZER,ZA,ZD,ZDL,ZDR,ZH,UV,ZP,ZU,ZUL,ZUR,ZW,ZZ,vd,vu,vL,g1,g2,g3,Yd,               & 
& Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,             & 
& mlHd2,M1,M2,M3,.True.,kont)

Where (Abs(MSd2/Qscale).lt.TwoLoopRegulatorMass )MSd2=Qscale*TwoLoopRegulatorMass
Where (Abs(MSu2/Qscale).lt.TwoLoopRegulatorMass )MSu2=Qscale*TwoLoopRegulatorMass
Where (Abs(Mhh2/Qscale).lt.TwoLoopRegulatorMass )Mhh2=Qscale*TwoLoopRegulatorMass
Where (Abs(MAh2/Qscale).lt.TwoLoopRegulatorMass )MAh2=Qscale*TwoLoopRegulatorMass
Where (Abs(MHpm2/Qscale).lt.TwoLoopRegulatorMass )MHpm2=Qscale*TwoLoopRegulatorMass
Call CouplingsFor2LPole3(Mu,REps,Ye,Te,L1,T1,vd,vL,ZA,ZP,Yd,Td,L2,T2,ZD,              & 
& Yu,Tu,ZU,ZH,vu,g3,ZEL,ZER,ZDL,ZDR,ZUL,ZUR,UV,pG,cplAhHpmcHpm,cplAhSdcSd,               & 
& cplAhSucSu,cplhhHpmcHpm,cplhhSdcSd,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSdVG,     & 
& cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,       & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplGluFucSuL,cplGluFucSuR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,         & 
& cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsFor2LPole4(Ye,L1,ZA,ZP,Yd,L2,ZD,Yu,ZU,ZH,g3,cplAhAhHpmcHpm,             & 
& cplAhAhSdcSd,cplAhAhSucSu,cplAhhhHpmcHpm,cplAhhhSdcSd,cplAhHpmSucSd,cplAhSdcHpmcSu,    & 
& cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSucSu,cplhhHpmSucSd,cplhhSdcHpmcSu,cplHpmHpmcHpmcHpm,& 
& cplHpmSdcHpmcSd,cplHpmSucHpmcSu,cplSdSdcSdcSd,cplSdSucSdcSu,cplSuSucSucSu)

! ----------------------------------
! ------- 1L GAUGELESS TADPOLE DIAGRAMS --------
! ----------------------------------
delta2Ltadpoles(:)=0._dp
delta2Lmasses(:,:)=0._dp
delta2LmassesAh(:,:)=0._dp
tad1LG(:)=0._dp
if(include1l2lshift) then
temptad(:) = 0._dp 
  Do i1 = 1, 5
A0m = 1._dp*(-J0(MCha2(i1),qscale)) 
  Do gE1 = 1, 5
coup1L = cplcChaChahhL(i1,i1,gE1)
coup1R = cplcChaChahhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MCha(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFd2(i1),qscale)) 
  Do gE1 = 1, 5
coup1L = cplcFdFdhhL(i1,i1,gE1)
coup1R = cplcFdFdhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFd(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFu2(i1),qscale)) 
  Do gE1 = 1, 5
coup1L = cplcFuFuhhL(i1,i1,gE1)
coup1R = cplcFuFuhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFu(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 8
A0m = 1._dp*(-J0(MHpm2(i1),qscale)) 
  Do gE1 = 1, 5
coup1 = cplhhHpmcHpm(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 3._dp*(-J0(MSd2(i1),qscale)) 
  Do gE1 = 1, 5
coup1 = cplhhSdcSd(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 6
A0m = 3._dp*(-J0(MSu2(i1),qscale)) 
  Do gE1 = 1, 5
coup1 = cplhhSucSu(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

tad1LG=matmul(temptad*oo16Pi2,ZH)
! ----------------------------
! ----------------------------------
! ------- 1L2L SHIFTS --------
! ----------------------------------
end if ! include1l2lshift
! ----------------------------------
! ------- TADPOLE DIAGRAMS --------
! ----------------------------------
temptad(:)=0._dp
tempcouplingvector(:)=0._dp
! ---- Topology ToSSS
! ---- Ah,Hpm,conj[Hpm] ----
Do i1=1,5
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplAhhhHpmcHpm(i1,gE1,i2,i3)
coup2 = cplAhHpmcHpm(i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSSS(MAh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplAhhhSdcSd(i1,gE1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSSS(MAh2(i1),MSd2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,Hpm,conj[Hpm] ----
Do i1=1,5
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhhhHpmcHpm(gE1,i1,i2,i3)
coup2 = cplhhHpmcHpm(i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSSS(Mhh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,Sd,conj[Sd] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhhhSdcSd(gE1,i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSSS(Mhh2(i1),MSd2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- hh,Su,conj[Su] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhhhSucSu(gE1,i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSSS(Mhh2(i1),MSu2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Hpm,Su,conj[Sd] ----
Do i1=1,8
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmSucSd(gE1,i1,i2,i3)
coup2 = cplSdcHpmcSu(i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*TfSSS(MHpm2(i1),MSu2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Topology ToSS
! ---- Hpm,conj[Hpm],Ah ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplAhAhHpmcHpm(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MHpm2(i1),MHpm2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],hh ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhhhHpmcHpm(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*TfSS(MHpm2(i1),MHpm2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplHpmHpmcHpmcHpm(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MHpm2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplHpmSdcHpmcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MHpm2(i1),MHpm2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Su ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplHpmSucHpmcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MHpm2(i1),MHpm2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplAhAhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSd2(i1),MSd2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhhhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSd2(i1),MSd2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplHpmSdcHpmcSd(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MSd2(i1),MSd2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplSdSdcSdcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSd2(i1),MSd2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplSdSucSdcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSd2(i1),MSd2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplAhAhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSu2(i1),MSu2(i2),MAh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhhhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*TfSS(MSu2(i1),MSu2(i2),Mhh2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplHpmSucHpmcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 3._dp*TfSS(MSu2(i1),MSu2(i2),MHpm2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplSdSucSdcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSu2(i1),MSu2(i2),MSd2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplSuSucSucSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 1._dp*TfSS(MSu2(i1),MSu2(i2),MSu2(i3),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
! ---- Topology ToSSSS
! ---- Hpm,conj[Hpm],Ah,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(i3,i4,i1)
coup3 = cplAhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MHpm2(i1),MHpm2(i2),MAh2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],hh,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(i3,i4,i1)
coup3 = cplhhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSSS(MHpm2(i1),MHpm2(i2),Mhh2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd,conj[Su] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplSdcHpmcSu(i3,i1,i4)
coup3 = cplHpmSucSd(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MHpm2(i1),MHpm2(i2),MSd2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(i3,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplHpmSucSd(i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Ah,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(i3,i4,i1)
coup3 = cplAhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSu2(i1),MSu2(i2),MAh2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],hh,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(i3,i4,i1)
coup3 = cplhhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSu2(i1),MSu2(i2),Mhh2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplSdcHpmcSu(i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSSS(MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
end do
end do
end do
! ---- Topology ToSV
! ---- Sd ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*TfSV(MSd2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
! ---- Su ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*TfSV(MSu2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end do
! ---- Topology ToSSFF
! ---- Hpm,conj[Hpm],Cha,Chi ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,7
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2L = cplChiChacHpmL(i4,i3,i1)
coup2R = cplChiChacHpmR(i4,i3,i1)
coup3L = cplcChaChiHpmL(i3,i4,i2)
coup3R = cplcChaChiHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -1._dp*TfSSFF(MHpm2(i1),MHpm2(i2),MCha2(i3),MChi2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i3) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2L = cplChiChacHpmL(i4,i3,i1)
coup2R = cplChiChacHpmR(i4,i3,i1)
coup3L = cplcChaChiHpmL(i3,i4,i2)
coup3R = cplcChaChiHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MChi(i4)*TfSSFbFb(MHpm2(i1),MHpm2(i2),MCha2(i3),MChi2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Fd,bar[Fu] ----
Do i1=1,8
Do i2=1,8
Do i3=1,3
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2L = cplcFuFdcHpmL(i4,i3,i1)
coup2R = cplcFuFdcHpmR(i4,i3,i1)
coup3L = cplcFdFuHpmL(i3,i4,i2)
coup3R = cplcFdFuHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MHpm2(i1),MHpm2(i2),MFd2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2L = cplcFuFdcHpmL(i4,i3,i1)
coup2R = cplcFuFdcHpmR(i4,i3,i1)
coup3L = cplcFdFuHpmL(i3,i4,i2)
coup3R = cplcFdFuHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i4)*TfSSFbFb(MHpm2(i1),MHpm2(i2),MFd2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,conj[Sd],Cha,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MFu(i4)*TfSSFbFb(MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,conj[Sd],Chi,Fd ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MChi(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i3)*MFd(i4)*TfSSFbFb(MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*TfSSFF(MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i3)*TfSSFbFb(MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Su,conj[Su],Chi,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MChi(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i3)*MFu(i4)*TfSSFbFb(MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Su,conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -3._dp*TfSSFF(MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MCha(i4)*TfSSFbFb(MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Su,conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*TfSSFF(MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i3)*TfSSFbFb(MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Topology ToFFFS
! ---- Cha,bar[Cha],Cha,Ah ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,i4)
coup2R = cplcChaChaAhR(i1,i3,i4)
coup3L = cplcChaChaAhL(i3,i2,i4)
coup3R = cplcChaChaAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i3)*TfFFFbS(MCha2(i1),MCha2(i2),MCha2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,i4)
coup2R = cplcChaChaAhR(i1,i3,i4)
coup3L = cplcChaChaAhL(i3,i2,i4)
coup3R = cplcChaChaAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i2)*TfFFbFS(MCha2(i1),MCha2(i2),MCha2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,i4)
coup2R = cplcChaChaAhR(i1,i3,i4)
coup3L = cplcChaChaAhL(i3,i2,i4)
coup3R = cplcChaChaAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i3)*MCha(i2)*TfFbFbFbS(MCha2(i1),MCha2(i2),MCha2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,hh ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,i4)
coup2R = cplcChaChahhR(i1,i3,i4)
coup3L = cplcChaChahhL(i3,i2,i4)
coup3R = cplcChaChahhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i3)*TfFFFbS(MCha2(i1),MCha2(i2),MCha2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,i4)
coup2R = cplcChaChahhR(i1,i3,i4)
coup3L = cplcChaChahhL(i3,i2,i4)
coup3R = cplcChaChahhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i2)*TfFFbFS(MCha2(i1),MCha2(i2),MCha2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,i4)
coup2R = cplcChaChahhR(i1,i3,i4)
coup3L = cplcChaChahhL(i3,i2,i4)
coup3R = cplcChaChahhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i3)*MCha(i2)*TfFbFbFbS(MCha2(i1),MCha2(i2),MCha2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Cha,bar[Cha],Chi,Hpm ----
Do i1=1,5
Do i2=1,5
Do i3=1,7
Do i4=1,8
if((MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChiHpmL(i1,i3,i4)
coup2R = cplcChaChiHpmR(i1,i3,i4)
coup3L = cplChiChacHpmL(i3,i2,i4)
coup3R = cplChiChacHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MChi(i3)*TfFFFbS(MCha2(i1),MCha2(i2),MChi2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChiHpmL(i1,i3,i4)
coup2R = cplcChaChiHpmR(i1,i3,i4)
coup3L = cplChiChacHpmL(i3,i2,i4)
coup3R = cplChiChacHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -2._dp*MCha(i2)*TfFFbFS(MCha2(i1),MCha2(i2),MChi2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChiHpmL(i1,i3,i4)
coup2R = cplcChaChiHpmR(i1,i3,i4)
coup3L = cplChiChacHpmL(i3,i2,i4)
coup3R = cplChiChacHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MChi(i3)*MCha(i2)*TfFbFbFbS(MCha2(i1),MCha2(i2),MChi2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Cha,bar[Cha],Fd,conj[Su] ----
Do i1=1,5
Do i2=1,5
Do i3=1,3
Do i4=1,6
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaFdcSuL(i1,i3,i4)
coup2R = cplcChaFdcSuR(i1,i3,i4)
coup3L = cplcFdChaSuL(i3,i2,i4)
coup3R = cplcFdChaSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MCha2(i1),MCha2(i2),MFd2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaFdcSuL(i1,i3,i4)
coup2R = cplcChaFdcSuR(i1,i3,i4)
coup3L = cplcFdChaSuL(i3,i2,i4)
coup3R = cplcFdChaSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MCha(i2)*TfFFbFS(MCha2(i1),MCha2(i2),MFd2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaFdcSuL(i1,i3,i4)
coup2R = cplcChaFdcSuR(i1,i3,i4)
coup3L = cplcFdChaSuL(i3,i2,i4)
coup3R = cplcFdChaSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MFd(i3)*MCha(i2)*TfFbFbFbS(MCha2(i1),MCha2(i2),MFd2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Cha,bar[Cha],bar[Fu],Sd ----
Do i1=1,5
Do i2=1,5
Do i3=1,3
Do i4=1,6
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i1,i3,i4)
coup2R = cplcChacFuSdR(i1,i3,i4)
coup3L = cplChaFucSdL(i2,i3,i4)
coup3R = cplChaFucSdR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MCha2(i1),MCha2(i2),MFu2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i1,i3,i4)
coup2R = cplcChacFuSdR(i1,i3,i4)
coup3L = cplChaFucSdL(i2,i3,i4)
coup3R = cplChaFucSdR(i2,i3,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MCha(i2)*TfFFbFS(MCha2(i1),MCha2(i2),MFu2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i1,i3,i4)
coup2R = cplcChacFuSdR(i1,i3,i4)
coup3L = cplChaFucSdL(i2,i3,i4)
coup3R = cplChaFucSdR(i2,i3,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MCha(i2)*MFu(i3)*TfFbFbFbS(MCha2(i1),MCha2(i2),MFu2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,5
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,i4)
coup2R = cplcFdFdAhR(i1,i3,i4)
coup3L = cplcFdFdAhL(i3,i2,i4)
coup3R = cplcFdFdAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFd2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Cha,Su ----
Do i1=1,3
Do i2=1,3
Do i3=1,5
Do i4=1,6
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChaSuL(i1,i3,i4)
coup2R = cplcFdChaSuR(i1,i3,i4)
coup3L = cplcChaFdcSuL(i3,i2,i4)
coup3R = cplcChaFdcSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MCha(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MCha2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChaSuL(i1,i3,i4)
coup2R = cplcFdChaSuR(i1,i3,i4)
coup3L = cplcChaFdcSuL(i3,i2,i4)
coup3R = cplcChaFdcSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MCha2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChaSuL(i1,i3,i4)
coup2R = cplcFdChaSuR(i1,i3,i4)
coup3L = cplcChaFdcSuL(i3,i2,i4)
coup3R = cplcChaFdcSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MFd(i1)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MCha2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Chi,Sd ----
Do i1=1,3
Do i2=1,3
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChiSdL(i1,i3,i4)
coup2R = cplcFdChiSdR(i1,i3,i4)
coup3L = cplChiFdcSdL(i3,i2,i4)
coup3R = cplChiFdcSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MChi(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MChi2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChiSdL(i1,i3,i4)
coup2R = cplcFdChiSdR(i1,i3,i4)
coup3L = cplChiFdcSdL(i3,i2,i4)
coup3R = cplChiFdcSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MChi2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MChi(i3) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdChiSdL(i1,i3,i4)
coup2R = cplcFdChiSdR(i1,i3,i4)
coup3L = cplChiFdcSdL(i3,i2,i4)
coup3R = cplChiFdcSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i3)*MFd(i1)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MChi2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,5
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,i4)
coup2R = cplcFdFdhhR(i1,i3,i4)
coup3L = cplcFdFdhhL(i3,i2,i4)
coup3R = cplcFdFdhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFd2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Fu,Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,8
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFuHpmL(i1,i3,i4)
coup2R = cplcFdFuHpmR(i1,i3,i4)
coup3L = cplcFuFdcHpmL(i3,i2,i4)
coup3R = cplcFuFdcHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFd2(i1),MFd2(i2),MFu2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFuHpmL(i1,i3,i4)
coup2R = cplcFdFuHpmR(i1,i3,i4)
coup3L = cplcFuFdcHpmL(i3,i2,i4)
coup3R = cplcFuFdcHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MFu2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFuHpmL(i1,i3,i4)
coup2R = cplcFdFuHpmR(i1,i3,i4)
coup3L = cplcFuFdcHpmL(i3,i2,i4)
coup3R = cplcFuFdcHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i3)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MFu2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fd,bar[Fd],Glu,Sd ----
Do i1=1,3
Do i2=1,3
Do i4=1,6
if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdGluSdL(i1,i4)
coup2R = cplcFdGluSdR(i1,i4)
coup3L = cplGluFdcSdL(i2,i4)
coup3R = cplGluFdcSdR(i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -8._dp*MGlu*TfFFFbS(MFd2(i1),MFd2(i2),MGlu2,MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdGluSdL(i1,i4)
coup2R = cplcFdGluSdR(i1,i4)
coup3L = cplGluFdcSdL(i2,i4)
coup3R = cplGluFdcSdR(i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -8._dp*MFd(i2)*TfFFbFS(MFd2(i1),MFd2(i2),MGlu2,MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdGluSdL(i1,i4)
coup2R = cplcFdGluSdR(i1,i4)
coup3L = cplGluFdcSdL(i2,i4)
coup3R = cplGluFdcSdR(i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*MFd(i2)*TfFbFbFbS(MFd2(i1),MFd2(i2),MGlu2,MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Fu,bar[Fu],Fu,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,5
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,i4)
coup2R = cplcFuFuAhR(i1,i3,i4)
coup3L = cplcFuFuAhL(i3,i2,i4)
coup3R = cplcFuFuAhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFu2(i3),MAh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Chi,Su ----
Do i1=1,3
Do i2=1,3
Do i3=1,7
Do i4=1,6
if((MChi(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuChiSuL(i1,i3,i4)
coup2R = cplcFuChiSuR(i1,i3,i4)
coup3L = cplChiFucSuL(i3,i2,i4)
coup3R = cplChiFucSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MChi(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MChi2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuChiSuL(i1,i3,i4)
coup2R = cplcFuChiSuR(i1,i3,i4)
coup3L = cplChiFucSuL(i3,i2,i4)
coup3R = cplChiFucSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MChi2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MChi(i3) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuChiSuL(i1,i3,i4)
coup2R = cplcFuChiSuR(i1,i3,i4)
coup3L = cplChiFucSuL(i3,i2,i4)
coup3R = cplChiFucSuR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i3)*MFu(i1)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MChi2(i3),MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Fd,conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,8
if((MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdcHpmL(i1,i3,i4)
coup2R = cplcFuFdcHpmR(i1,i3,i4)
coup3L = cplcFdFuHpmL(i3,i2,i4)
coup3R = cplcFdFuHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFd(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFd2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdcHpmL(i1,i3,i4)
coup2R = cplcFuFdcHpmR(i1,i3,i4)
coup3L = cplcFdFuHpmL(i3,i2,i4)
coup3R = cplcFdFuHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFd2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFdcHpmL(i1,i3,i4)
coup2R = cplcFuFdcHpmR(i1,i3,i4)
coup3L = cplcFdFuHpmL(i3,i2,i4)
coup3R = cplcFdFuHpmR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i1)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFd2(i3),MHpm2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,5
if((MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,i4)
coup2R = cplcFuFuhhR(i1,i3,i4)
coup3L = cplcFuFuhhL(i3,i2,i4)
coup3R = cplcFuFuhhR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MFu2(i3),Mhh2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Fu,bar[Fu],Glu,Su ----
Do i1=1,3
Do i2=1,3
Do i4=1,6
if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuGluSuL(i1,i4)
coup2R = cplcFuGluSuR(i1,i4)
coup3L = cplGluFucSuL(i2,i4)
coup3R = cplGluFucSuR(i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -8._dp*MGlu*TfFFFbS(MFu2(i1),MFu2(i2),MGlu2,MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuGluSuL(i1,i4)
coup2R = cplcFuGluSuR(i1,i4)
coup3L = cplGluFucSuL(i2,i4)
coup3R = cplGluFucSuR(i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -8._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MGlu2,MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuGluSuL(i1,i4)
coup2R = cplcFuGluSuR(i1,i4)
coup3L = cplGluFucSuL(i2,i4)
coup3R = cplGluFucSuR(i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MGlu2,MSu2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
! ---- Fu,bar[Fu],bar[Cha],Sd ----
Do i1=1,3
Do i2=1,3
Do i3=1,5
Do i4=1,6
if((MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i3,i1,i4)
coup2R = cplcChacFuSdR(i3,i1,i4)
coup3L = cplChaFucSdL(i3,i2,i4)
coup3R = cplChaFucSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3R+coup1R*coup2L*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MCha(i3)*TfFFFbS(MFu2(i1),MFu2(i2),MCha2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i3,i1,i4)
coup2R = cplcChacFuSdR(i3,i1,i4)
coup3L = cplChaFucSdL(i3,i2,i4)
coup3R = cplChaFucSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2R*coup3L+coup1R*coup2L*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -6._dp*MFu(i2)*TfFFbFS(MFu2(i1),MFu2(i2),MCha2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcChacFuSdL(i3,i1,i4)
coup2R = cplcChacFuSdR(i3,i1,i4)
coup3L = cplChaFucSdL(i3,i2,i4)
coup3R = cplChaFucSdR(i3,i2,i4)
prefactor=Real(coup1L*coup2L*coup3L+coup1R*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MCha(i3)*MFu(i2)*TfFbFbFbS(MFu2(i1),MFu2(i2),MCha2(i3),MSd2(i4),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Topology ToFV
! ---- Fd ----
Do i1=1,3
if((MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFdFdhhL(i1,i1,gE1)
coup1R = cplcFdFdhhR(i1,i1,gE1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1L*coup2*coup3+coup1R*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MFd(i1)*TfFV(MFd2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
! ---- Fu ----
Do i1=1,3
if((MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
coup1L = cplcFuFuhhL(i1,i1,gE1)
coup1R = cplcFuFuhhR(i1,i1,gE1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1L*coup2*coup3+coup1R*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingvector(gE1)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingvector(gE1)= 0._dp
 end if
   End Do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MFu(i1)*TfFV(MFu2(i1),Qscale)
 temptad=temptad+tempcouplingvector*funcvalue
end if
end if

end do
! ----------------------------
! ---- Final tadpole result --
temptad=(temptad*oo16Pi2*oo16Pi2)+delta2ltadpoles
tad2L=matmul(temptad,ZH)
! ----------------------------

! ------------------------------------
! ------- CP EVEN MASS DIAGRAMS ------
! ------------------------------------
tempcont(:,:)=0._dp
tempcouplingmatrix(:,:)=0._dp
! ---- Topology WoSSSS
! ---- Hpm,conj[Hpm],Ah,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplAhHpmcHpm(i3,i4,i1)
coup3 = cplAhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MHpm2(i1),MHpm2(i2),MAh2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],hh,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplhhHpmcHpm(i3,i4,i1)
coup3 = cplhhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MHpm2(i1),MHpm2(i2),Mhh2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd,conj[Su] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplSdcHpmcSu(i3,i1,i4)
coup3 = cplHpmSucSd(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MHpm2(i1),MHpm2(i2),MSd2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplAhSdcSd(i3,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplhhSdcSd(i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplHpmSucSd(i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Ah,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplAhSucSu(i3,i4,i1)
coup3 = cplAhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],hh,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplhhSucSu(i3,i4,i1)
coup3 = cplhhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplSdcHpmcSu(i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology XoSSS
! ---- Hpm,conj[Hpm],Ah ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplAhAhHpmcHpm(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],hh ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplhhhhHpmcHpm(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplHpmHpmcHpmcHpm(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplHpmSdcHpmcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Su ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplHpmSucHpmcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplAhAhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplhhhhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplHpmSdcHpmcSd(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSdcSdcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSucSdcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplAhAhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplhhhhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplHpmSucHpmcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplSdSucSdcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2 = cplSuSucSucSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Topology YoSSSS
! ---- Hpm,conj[Hpm],Hpm,Ah ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3 = cplAhAhHpmcHpm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,hh ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3 = cplhhhhHpmcHpm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3 = cplHpmHpmcHpmcHpm(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Sd ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3 = cplHpmSdcHpmcSd(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Su ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3 = cplHpmSucHpmcSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplAhAhSdcSd(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplhhhhSdcSd(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplHpmSdcHpmcSd(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplSdSdcSdcSd(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplSdSucSdcSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplAhAhSucSu(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MAh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplhhhhSucSu(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Mhh2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplHpmSucHpmcSu(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplSdSucSdcSu(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplSuSucSucSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology ZoSSSS
! ---- Hpm,conj[Hpm],Hpm,conj[Hpm] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i4)
coup3 = cplHpmHpmcHpmcHpm(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd,conj[Sd] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i4)
coup3 = cplHpmSdcHpmcSd(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*ZfSSSS(p2,MHpm2(i1),MHpm2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Su,conj[Su] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i4)
coup3 = cplHpmSucHpmcSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*ZfSSSS(p2,MHpm2(i1),MHpm2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i4)
coup3 = cplSdSdcSdcSd(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i4)
coup3 = cplSdSucSdcSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i4)
coup3 = cplSuSucSucSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology SoSSS
! ---- Ah,Hpm,conj[Hpm] ----
Do i1=1,5
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhhhHpmcHpm(i1,gE1,i2,i3)
coup2 = cplAhhhHpmcHpm(i1,gE2,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,MAh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhhhSdcSd(i1,gE1,i2,i3)
coup2 = cplAhhhSdcSd(i1,gE2,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,MAh2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,Hpm,conj[Hpm] ----
Do i1=1,5
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,i1,i2,i3)
coup2 = cplhhhhHpmcHpm(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,Mhh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,Sd,conj[Sd] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,i1,i2,i3)
coup2 = cplhhhhSdcSd(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,Mhh2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- hh,Su,conj[Su] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,i1,i2,i3)
coup2 = cplhhhhSucSu(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,Mhh2(i1),MSu2(i2),MSu2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Hpm,Su,conj[Sd] ----
Do i1=1,8
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmSucSd(gE1,i1,i2,i3)
coup2 = cplhhSdcHpmcSu(gE2,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*SfSSS(p2,MHpm2(i1),MSu2(i2),MSd2(i3),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Topology UoSSSS
! ---- Hpm,conj[Hpm],Ah,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplAhhhHpmcHpm(i3,gE2,i4,i1)
coup3 = cplAhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MHpm2(i1),MHpm2(i2),MAh2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],hh,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhhhHpmcHpm(gE2,i3,i4,i1)
coup3 = cplhhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MHpm2(i1),MHpm2(i2),Mhh2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd,conj[Su] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhSdcHpmcSu(gE2,i3,i1,i4)
coup3 = cplHpmSucSd(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MHpm2(i1),MHpm2(i2),MSd2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplAhhhSdcSd(i3,gE2,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhhhSdcSd(gE2,i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhHpmSucSd(gE2,i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],hh,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhhhSucSu(gE2,i3,i4,i1)
coup3 = cplhhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),MSu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSdcHpmcSu(gE2,i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology VoSSSSS
! ---- Hpm,conj[Hpm],Hpm,Ah,conj[Hpm] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,5
Do i5=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3 = cplAhHpmcHpm(i4,i2,i5)
coup4 = cplAhHpmcHpm(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MAh2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,hh,conj[Hpm] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,5
Do i5=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3 = cplhhHpmcHpm(i4,i2,i5)
coup4 = cplhhHpmcHpm(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),Mhh2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Su,conj[Sd] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,6
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3 = cplHpmSucSd(i2,i4,i5)
coup4 = cplSdcHpmcSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MSu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Ah,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplAhSdcSd(i4,i2,i5)
coup4 = cplAhSdcSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MAh2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,hh,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplhhSdcSd(i4,i2,i5)
coup4 = cplhhSdcSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Mhh2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3 = cplSdcHpmcSu(i2,i4,i5)
coup4 = cplHpmSucSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MHpm2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Ah,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplAhSucSu(i4,i2,i5)
coup4 = cplAhSucSu(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MAh2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,hh,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplhhSucSu(i4,i2,i5)
coup4 = cplhhSucSu(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Mhh2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Hpm,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3 = cplHpmSucSd(i4,i2,i5)
coup4 = cplSdcHpmcSu(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MHpm2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSSSSS
! ---- Hpm,Su,conj[Hpm],conj[Su],Sd ----
Do i1=1,8
Do i2=1,6
Do i3=1,8
Do i4=1,6
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2 = cplhhSucSu(gE2,i2,i4)
coup3 = cplSdcHpmcSu(i5,i1,i2)
coup4 = cplHpmSucSd(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MfSSSSS(p2,MHpm2(i1),MSu2(i2),MHpm2(i3),MSu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],conj[Hpm],Hpm,Ah ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,8
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2 = cplhhHpmcHpm(gE2,i4,i2)
coup3 = cplAhHpmcHpm(i5,i2,i1)
coup4 = cplAhHpmcHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MHpm2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],conj[Hpm],Hpm,hh ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,8
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2 = cplhhHpmcHpm(gE2,i4,i2)
coup3 = cplhhHpmcHpm(i5,i2,i1)
coup4 = cplhhHpmcHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MHpm2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Sd],conj[Hpm],Sd,conj[Su] ----
Do i1=1,8
Do i2=1,6
Do i3=1,8
Do i4=1,6
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2 = cplhhSdcSd(gE2,i4,i2)
coup3 = cplSdcHpmcSu(i2,i1,i5)
coup4 = cplHpmSucSd(i3,i5,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MfSSSSS(p2,MHpm2(i1),MSd2(i2),MHpm2(i3),MSd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],conj[Sd],Sd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2 = cplhhSdcSd(gE2,i4,i2)
coup3 = cplAhSdcSd(i5,i2,i1)
coup4 = cplAhSdcSd(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],conj[Sd],Sd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2 = cplhhSdcSd(gE2,i4,i2)
coup3 = cplhhSdcSd(i5,i2,i1)
coup4 = cplhhSdcSd(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Su],conj[Sd],Su,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2 = cplhhSucSu(gE2,i4,i2)
coup3 = cplHpmSucSd(i5,i2,i1)
coup4 = cplSdcHpmcSu(i3,i5,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MfSSSSS(p2,MSd2(i1),MSu2(i2),MSd2(i3),MSu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],conj[Su],Su,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2 = cplhhSucSu(gE2,i4,i2)
coup3 = cplAhSucSu(i5,i2,i1)
coup4 = cplAhSucSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],conj[Su],Su,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2 = cplhhSucSu(gE2,i4,i2)
coup3 = cplhhSucSu(i5,i2,i1)
coup4 = cplhhSucSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology WoSSSV
! ---- Sd ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSSV(p2,MSd2(i1),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Su ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSSV(p2,MSu2(i1),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
! ---- Topology MoSSSSV
! ---- Sd,conj[Sd] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i2,i1)
coup3 = g3
coup4 = g3
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSV(p2,MSd2(i1),MSd2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i2,i1)
coup3 = g3
coup4 = g3
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSV(p2,MSu2(i1),MSu2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
! ---- Topology WoSSFF
! ---- Hpm,conj[Hpm],Cha,Chi ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,7
if((MCha(i3) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2L = cplChiChacHpmL(i4,i3,i1)
coup2R = cplChiChacHpmR(i4,i3,i1)
coup3L = cplcChaChiHpmL(i3,i4,i2)
coup3R = cplcChaChiHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MCha(i3)*MChi(i4)*WfSSFbFb(p2,MHpm2(i1),MHpm2(i2),MCha2(i3),MChi2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2L = cplChiChacHpmL(i4,i3,i1)
coup2R = cplChiChacHpmR(i4,i3,i1)
coup3L = cplcChaChiHpmL(i3,i4,i2)
coup3R = cplcChaChiHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MHpm2(i1),MHpm2(i2),MCha2(i3),MChi2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Fd,bar[Fu] ----
Do i1=1,8
Do i2=1,8
Do i3=1,3
Do i4=1,3
if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2L = cplcFuFdcHpmL(i4,i3,i1)
coup2R = cplcFuFdcHpmR(i4,i3,i1)
coup3L = cplcFdFuHpmL(i3,i4,i2)
coup3R = cplcFdFuHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MFd(i3)*MFu(i4)*WfSSFbFb(p2,MHpm2(i1),MHpm2(i2),MFd2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhHpmcHpm(gE1,gE2,i1,i2)
coup2L = cplcFuFdcHpmL(i4,i3,i1)
coup2R = cplcFuFdcHpmR(i4,i3,i1)
coup3L = cplcFdFuHpmL(i3,i4,i2)
coup3R = cplcFdFuHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MHpm2(i1),MHpm2(i2),MFd2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Cha,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MCha(i3)*MFu(i4)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Chi,Fd ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MChi(i3)*MFd(i4)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MGlu*MFd(i3)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSdcSd(gE1,gE2,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Chi,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MChi(i3)*MFu(i4)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
Do i4=1,5
if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MFd(i3)*MCha(i4)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MGlu*MFu(i3)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhhhSucSu(gE1,gE2,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
! ---- Topology MoFFFFS
! ---- Cha,Fu,bar[Cha],bar[Fu],Sd ----
Do i1=1,5
Do i2=1,3
Do i3=1,5
Do i4=1,3
Do i5=1,6
if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MCha(i1)*MFu(i2)*MCha(i3)*MFu(i4)*MfFbFbFbFbS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MCha(i3)*MfFFbFbFS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i4)*MfFFbFFbS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MFu(i4)*MfFFFbFbS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],bar[Cha],Cha,Ah ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
Do i5=1,5
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MCha(i1)*MCha(i4)*MCha(i2)*MCha(i3)*MfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i2)*MCha(i3)*MfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MCha(i2)*MfFFbFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MCha(i3)*MfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],bar[Cha],Cha,hh ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
Do i5=1,5
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MCha(i1)*MCha(i4)*MCha(i2)*MCha(i3)*MfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i2)*MCha(i3)*MfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MCha(i2)*MfFFbFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MCha(i3)*MfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Fd],bar[Cha],Fd,conj[Su] ----
Do i1=1,5
Do i2=1,3
Do i3=1,5
Do i4=1,3
Do i5=1,6
if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MCha(i1)*MFd(i4)*MCha(i3)*MFd(i2)*MfFbFbFbFbS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MFd(i2)*MfFFbFbFS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MCha(i3)*MfFFFbFbS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i3,i1,gE1)
coup1R = cplcChaChahhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Cha],bar[Fd],Cha,Su ----
Do i1=1,3
Do i2=1,5
Do i3=1,3
Do i4=1,5
Do i5=1,6
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MCha(i4)*MFd(i1)*MCha(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MCha(i2)*MfFFbFFbS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],bar[Fd],Fd,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],bar[Fd],Fd,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fu],bar[Fd],Fu,Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,8
if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFu(i4)*MFd(i3)*MFu(i2)*MfFbFbFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i2)*MfFFbFbFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i3,i1,gE1)
coup1R = cplcFdFdhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,Cha,bar[Fu],bar[Cha],Sd ----
Do i1=1,3
Do i2=1,5
Do i3=1,3
Do i4=1,5
Do i5=1,6
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i4,i2,gE2)
coup2R = cplcChaChahhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MCha(i2)*MFu(i1)*MCha(i4)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i4,i2,gE2)
coup2R = cplcChaChahhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i4,i2,gE2)
coup2R = cplcChaChahhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i2)*MCha(i4)*MfFFbFFbS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i4,i2,gE2)
coup2R = cplcChaChahhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcChaChahhL(i4,i2,gE2)
coup2R = cplcChaChahhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fd],bar[Fu],Fd,conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,8
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFu(i1)*MFd(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i3,i1,gE1)
coup1R = cplcFuFuhhR(i3,i1,gE1)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSFSFF
! ---- Hpm,Fu,conj[Hpm],bar[Fu],Fd ----
Do i1=1,8
Do i2=1,3
Do i3=1,8
Do i4=1,3
Do i5=1,3
if((MFd(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFdcHpmL(i2,i5,i1)
coup3R = cplcFuFdcHpmR(i2,i5,i1)
coup4L = cplcFdFuHpmL(i5,i4,i3)
coup4R = cplcFdFuHpmR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MFu(i2)*MFu(i4)*MfSFbSFbFb(p2,MHpm2(i1),MFu2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFdcHpmL(i2,i5,i1)
coup3R = cplcFuFdcHpmR(i2,i5,i1)
coup4L = cplcFdFuHpmL(i5,i4,i3)
coup4R = cplcFdFuHpmR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MHpm2(i1),MFu2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcFuFuhhL(i4,i2,gE2)
coup2R = cplcFuFuhhR(i4,i2,gE2)
coup3L = cplcFuFdcHpmL(i2,i5,i1)
coup3R = cplcFuFdcHpmR(i2,i5,i1)
coup4L = cplcFdFuHpmL(i5,i4,i3)
coup4R = cplcFdFuHpmR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,MHpm2(i1),MFu2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Hpm,bar[Cha],conj[Hpm],Cha,Chi ----
Do i1=1,8
Do i2=1,5
Do i3=1,8
Do i4=1,5
Do i5=1,7
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplChiChacHpmL(i5,i2,i1)
coup3R = cplChiChacHpmR(i5,i2,i1)
coup4L = cplcChaChiHpmL(i4,i5,i3)
coup4R = cplcChaChiHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MChi(i5)*MCha(i2)*MfSFbSFbFb(p2,MHpm2(i1),MCha2(i2),MHpm2(i3),MCha2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplChiChacHpmL(i5,i2,i1)
coup3R = cplChiChacHpmR(i5,i2,i1)
coup4L = cplcChaChiHpmL(i4,i5,i3)
coup4R = cplcChaChiHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i4)*MfSFSFbF(p2,MHpm2(i1),MCha2(i2),MHpm2(i3),MCha2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplChiChacHpmL(i5,i2,i1)
coup3R = cplChiChacHpmR(i5,i2,i1)
coup4L = cplcChaChiHpmL(i4,i5,i3)
coup4R = cplcChaChiHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i5)*MfSFSFFb(p2,MHpm2(i1),MCha2(i2),MHpm2(i3),MCha2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Hpm,bar[Fd],conj[Hpm],Fd,bar[Fu] ----
Do i1=1,8
Do i2=1,3
Do i3=1,8
Do i4=1,3
Do i5=1,3
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i5,i2,i1)
coup3R = cplcFuFdcHpmR(i5,i2,i1)
coup4L = cplcFdFuHpmL(i4,i5,i3)
coup4R = cplcFdFuHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MFu(i5)*MfSFbSFbFb(p2,MHpm2(i1),MFd2(i2),MHpm2(i3),MFd2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i5,i2,i1)
coup3R = cplcFuFdcHpmR(i5,i2,i1)
coup4L = cplcFdFuHpmL(i4,i5,i3)
coup4R = cplcFdFuHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MHpm2(i1),MFd2(i2),MHpm2(i3),MFd2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i5,i2,i1)
coup3R = cplcFuFdcHpmR(i5,i2,i1)
coup4L = cplcFdFuHpmL(i4,i5,i3)
coup4R = cplcFdFuHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,MHpm2(i1),MFd2(i2),MHpm2(i3),MFd2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Sd,bar[Cha],conj[Sd],Cha,Fu ----
Do i1=1,6
Do i2=1,5
Do i3=1,6
Do i4=1,5
Do i5=1,3
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i2,i5,i1)
coup3R = cplChaFucSdR(i2,i5,i1)
coup4L = cplcChacFuSdL(i4,i5,i3)
coup4R = cplcChacFuSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i5)*MCha(i2)*MfSFbSFbFb(p2,MSd2(i1),MCha2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i2,i5,i1)
coup3R = cplChaFucSdR(i2,i5,i1)
coup4L = cplcChacFuSdL(i4,i5,i3)
coup4R = cplcChacFuSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i4)*MfSFSFbF(p2,MSd2(i1),MCha2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcChaChahhL(i2,i4,gE2)
coup2R = cplcChaChahhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i2,i5,i1)
coup3R = cplChaFucSdR(i2,i5,i1)
coup4L = cplcChacFuSdL(i4,i5,i3)
coup4R = cplcChacFuSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,MSd2(i1),MCha2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Sd,bar[Fd],conj[Sd],Fd,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MFd(i4)*MFd(i2)*MfSFbSFbFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MfSFSFFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Sd,bar[Fd],conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i4)*MFd(i2)*MfSFbSFbFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFd(i4)*MfSFSFbF(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MfSFSFFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,bar[Fu],conj[Sd],Fu,Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,5
if((MCha(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MfSFSFFb(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,Cha,conj[Su],bar[Cha],Fd ----
Do i1=1,6
Do i2=1,5
Do i3=1,6
Do i4=1,5
Do i5=1,3
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcChaChahhL(i4,i2,gE2)
coup2R = cplcChaChahhR(i4,i2,gE2)
coup3L = cplcChaFdcSuL(i2,i5,i1)
coup3R = cplcChaFdcSuR(i2,i5,i1)
coup4L = cplcFdChaSuL(i5,i4,i3)
coup4R = cplcFdChaSuR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i2)*MFd(i5)*MCha(i4)*MfSFbSFbFb(p2,MSu2(i1),MCha2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcChaChahhL(i4,i2,gE2)
coup2R = cplcChaChahhR(i4,i2,gE2)
coup3L = cplcChaFdcSuL(i2,i5,i1)
coup3R = cplcChaFdcSuR(i2,i5,i1)
coup4L = cplcFdChaSuL(i5,i4,i3)
coup4R = cplcFdChaSuR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i4)*MfSFSFbF(p2,MSu2(i1),MCha2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcChaChahhL(i4,i2,gE2)
coup2R = cplcChaChahhR(i4,i2,gE2)
coup3L = cplcChaFdcSuL(i2,i5,i1)
coup3R = cplcChaFdcSuR(i2,i5,i1)
coup4L = cplcFdChaSuL(i5,i4,i3)
coup4R = cplcFdChaSuR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,MSu2(i1),MCha2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fd],conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,5
if((MCha(i5) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MCha(i5)*MFd(i2)*MfSFbSFbFb(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFdFdhhL(i2,i4,gE2)
coup2R = cplcFdFdhhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MfSFSFFb(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fu],conj[Su],Fu,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MfSFSFFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fu],conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFu(i4)*MfSFSFbF(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i3)
coup2L = cplcFuFuhhL(i2,i4,gE2)
coup2R = cplcFuFuhhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MfSFSFFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Topology VoSSSFF
! ---- Hpm,conj[Hpm],Hpm,Chi,bar[Cha] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,7
Do i5=1,5
if((MCha(i5) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3L = cplcChaChiHpmL(i5,i4,i2)
coup3R = cplcChaChiHpmR(i5,i4,i2)
coup4L = cplChiChacHpmL(i4,i5,i3)
coup4R = cplChiChacHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MCha(i5)*VfSSSFbFb(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MChi2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3L = cplcChaChiHpmL(i5,i4,i2)
coup3R = cplcChaChiHpmR(i5,i4,i2)
coup4L = cplChiChacHpmL(i4,i5,i3)
coup4R = cplChiChacHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MChi2(i4),MCha2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Fu,bar[Fd] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,3
Do i5=1,3
if((MFd(i5) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3L = cplcFdFuHpmL(i5,i4,i2)
coup3R = cplcFdFuHpmR(i5,i4,i2)
coup4L = cplcFuFdcHpmL(i4,i5,i3)
coup4R = cplcFuFdcHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i5)*VfSSSFbFb(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhHpmcHpm(gE1,i1,i2)
coup2 = cplhhHpmcHpm(gE2,i3,i1)
coup3L = cplcFdFuHpmL(i5,i4,i2)
coup3R = cplcFdFuHpmR(i5,i4,i2)
coup4L = cplcFuFdcHpmL(i4,i5,i3)
coup4R = cplcFuFdcHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Chi,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcFdChiSdL(i5,i4,i2)
coup3R = cplcFdChiSdR(i5,i4,i2)
coup4L = cplChiFdcSdL(i4,i5,i3)
coup4R = cplChiFdcSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MChi2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcFdChiSdL(i5,i4,i2)
coup3R = cplcFdChiSdR(i5,i4,i2)
coup4L = cplChiFdcSdL(i4,i5,i3)
coup4R = cplChiFdcSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MChi2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Glu,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i5=1,3
if((MFd(i5) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcFdGluSdL(i5,i2)
coup3R = cplcFdGluSdR(i5,i2)
coup4L = cplGluFdcSdL(i5,i3)
coup4R = cplGluFdcSdR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MGlu2,MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcFdGluSdL(i5,i2)
coup3R = cplcFdGluSdR(i5,i2)
coup4L = cplGluFdcSdL(i5,i3)
coup4R = cplGluFdcSdR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MGlu2,MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcChacFuSdL(i4,i5,i2)
coup3R = cplcChacFuSdR(i4,i5,i2)
coup4L = cplChaFucSdL(i4,i5,i3)
coup4R = cplChaFucSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSdcSd(gE1,i1,i2)
coup2 = cplhhSdcSd(gE2,i3,i1)
coup3L = cplcChacFuSdL(i4,i5,i2)
coup3R = cplcChacFuSdR(i4,i5,i2)
coup4L = cplChaFucSdL(i4,i5,i3)
coup4R = cplChaFucSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Cha,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFdChaSuL(i5,i4,i2)
coup3R = cplcFdChaSuR(i5,i4,i2)
coup4L = cplcChaFdcSuL(i4,i5,i3)
coup4R = cplcChaFdcSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFd(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFdChaSuL(i5,i4,i2)
coup3R = cplcFdChaSuR(i5,i4,i2)
coup4L = cplcChaFdcSuL(i4,i5,i3)
coup4R = cplcChaFdcSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Chi,bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFuChiSuL(i5,i4,i2)
coup3R = cplcFuChiSuR(i5,i4,i2)
coup4L = cplChiFucSuL(i4,i5,i3)
coup4R = cplChiFucSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MChi2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFuChiSuL(i5,i4,i2)
coup3R = cplcFuChiSuR(i5,i4,i2)
coup4L = cplChiFucSuL(i4,i5,i3)
coup4R = cplChiFucSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MChi2(i4),MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Glu,bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i5=1,3
if((MFu(i5) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFuGluSuL(i5,i2)
coup3R = cplcFuGluSuR(i5,i2)
coup4L = cplGluFucSuL(i5,i3)
coup4R = cplGluFucSuR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MGlu2,MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplhhSucSu(gE1,i1,i2)
coup2 = cplhhSucSu(gE2,i3,i1)
coup3L = cplcFuGluSuL(i5,i2)
coup3R = cplcFuGluSuR(i5,i2)
coup4L = cplGluFucSuL(i5,i3)
coup4R = cplGluFucSuR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MGlu2,MFu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Topology VoFFFFS
! ---- Cha,bar[Cha],Cha,bar[Cha],Ah ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
Do i5=1,5
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i3)*MCha(i2)*MCha(i4)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i3)*MCha(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,Chi,conj[Hpm] ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,7
Do i5=1,8
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i3)*MChi(i4)*MCha(i2)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MChi(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i3)*MChi(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,Fu,conj[Sd] ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,3
Do i5=1,6
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MCha(i3)*MFu(i4)*MCha(i2)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MFu(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i3)*MFu(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,bar[Cha],hh ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
Do i5=1,5
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i3)*MCha(i2)*MCha(i4)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i3)*MCha(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,bar[Fd],Su ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,3
Do i5=1,6
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MCha(i3)*MCha(i2)*MFd(i4)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MFd(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i3)*MFd(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChahhL(i2,i1,gE1)
coup1R = cplcChaChahhR(i2,i1,gE1)
coup2L = cplcChaChahhL(i1,i3,gE2)
coup2R = cplcChaChahhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fd],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Chi,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i1)*MFd(i3)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i1)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MChi(i4)*MFd(i3)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Glu,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i5=1,6
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*MFd(i3)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MGlu*MFd(i3)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fd],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Cha],conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,5
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MCha(i4)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MCha(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MCha(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fu],conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,8
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFu(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i3,gE2)
coup2R = cplcFdFdhhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Cha,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,5
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i4)*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Chi,conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MChi(i4)*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Glu,conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i5=1,6
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MGlu*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fd],Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,8
if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFd(i4)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFd(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFd(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i3,gE2)
coup2R = cplcFuFuhhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology GoFFFFV
! ---- Fd,bar[Fd] ----
Do i1=1,3
Do i2=1,3
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i2,gE2)
coup2R = cplcFdFdhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdhhL(i2,i1,gE1)
coup1R = cplcFdFdhhR(i2,i1,gE1)
coup2L = cplcFdFdhhL(i1,i2,gE2)
coup2R = cplcFdFdhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFd(i1)*MFd(i2)*GfFbFbV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
! ---- Fu,bar[Fu] ----
Do i1=1,3
Do i2=1,3
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i2,gE2)
coup2R = cplcFuFuhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuhhL(i2,i1,gE1)
coup1R = cplcFuFuhhR(i2,i1,gE1)
coup2L = cplcFuFuhhL(i1,i2,gE2)
coup2R = cplcFuFuhhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrix(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrix(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFu(i1)*MFu(i2)*GfFbFbV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcont=tempcont+tempcouplingmatrix*funcvalue
end if
end if

end do
end do
do gE1=1,5
Pi2S(gE1,gE1)=Pi2S(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2
do gE2=1,gE1-1
Pi2S(gE1,gE2)=Pi2S(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2
Pi2S(gE2,gE1)=Pi2S(gE1,gE2)
End do
End do
Pi2S=Pi2S+delta2lmasses
Pi2S = Matmul(Pi2S,ZH)
Pi2S = Matmul(Transpose(ZH),Pi2S)

! -----------------------------------
! ------- CP ODD MASS DIAGRAMS ------
! -----------------------------------
tempcontah(:,:)=0._dp
tempcouplingmatrixah(:,:)=0._dp
! ---- Topology WoSSSS
! ---- Hpm,conj[Hpm],Ah,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplAhHpmcHpm(i3,i4,i1)
coup3 = cplAhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MHpm2(i1),MHpm2(i2),MAh2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],hh,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplhhHpmcHpm(i3,i4,i1)
coup3 = cplhhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSSS(p2,MHpm2(i1),MHpm2(i2),Mhh2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd,conj[Su] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplSdcHpmcSu(i3,i1,i4)
coup3 = cplHpmSucSd(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MHpm2(i1),MHpm2(i2),MSd2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplAhSdcSd(i3,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplhhSdcSd(i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplHpmSucSd(i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Ah,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplAhSucSu(i3,i4,i1)
coup3 = cplAhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],hh,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplhhSucSu(i3,i4,i1)
coup3 = cplhhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplSdcHpmcSu(i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology XoSSS
! ---- Hpm,conj[Hpm],Ah ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplAhAhHpmcHpm(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],hh ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplhhhhHpmcHpm(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp/2._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplHpmHpmcHpmcHpm(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplHpmSdcHpmcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Hpm,conj[Hpm],Su ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2 = cplHpmSucHpmcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MHpm2(i1),MHpm2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplAhAhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplhhhhSdcSd(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplHpmSdcHpmcSd(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSdcSdcSd(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Sd,conj[Sd],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2 = cplSdSucSdcSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSd2(i1),MSd2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplAhAhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplhhhhSucSu(i3,i3,i2,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp/2._dp*XfSSS(p2,MSu2(i1),MSu2(i2),Mhh2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplHpmSucHpmcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplSdSucSdcSu(i3,i2,i3,i1)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2 = cplSuSucSucSu(i2,i3,i1,i3)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*XfSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Topology YoSSSS
! ---- Hpm,conj[Hpm],Hpm,Ah ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3 = cplAhAhHpmcHpm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,hh ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3 = cplhhhhHpmcHpm(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3 = cplHpmHpmcHpmcHpm(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Sd ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3 = cplHpmSdcHpmcSd(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Su ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3 = cplHpmSucHpmcSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplAhAhSdcSd(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplhhhhSdcSd(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplHpmSdcHpmcSd(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplSdSdcSdcSd(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplSdSucSdcSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplAhAhSucSu(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MAh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplhhhhSucSu(i4,i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Mhh2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplHpmSucHpmcSu(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplSdSucSdcSu(i4,i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplSuSucSucSu(i2,i4,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*YfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology ZoSSSS
! ---- Hpm,conj[Hpm],Hpm,conj[Hpm] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i4)
coup3 = cplHpmHpmcHpmcHpm(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd,conj[Sd] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i4)
coup3 = cplHpmSdcHpmcSd(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*ZfSSSS(p2,MHpm2(i1),MHpm2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Su,conj[Su] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i4)
coup3 = cplHpmSucHpmcSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -6._dp*ZfSSSS(p2,MHpm2(i1),MHpm2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i4)
coup3 = cplSdSdcSdcSd(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i4)
coup3 = cplSdSucSdcSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -2._dp*ZfSSSS(p2,MSd2(i1),MSd2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i4)
coup3 = cplSuSucSucSu(i2,i4,i1,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*ZfSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology SoSSS
! ---- Ah,Hpm,conj[Hpm] ----
Do i1=1,5
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,i1,i2,i3)
coup2 = cplAhAhHpmcHpm(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,MAh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,i1,i2,i3)
coup2 = cplAhAhSdcSd(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,MAh2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Ah,Su,conj[Su] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,i1,i2,i3)
coup2 = cplAhAhSucSu(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,MAh2(i1),MSu2(i2),MSu2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,Hpm,conj[Hpm] ----
Do i1=1,5
Do i2=1,8
Do i3=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhhhHpmcHpm(gE1,i1,i2,i3)
coup2 = cplAhhhHpmcHpm(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*SfSSS(p2,Mhh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- hh,Sd,conj[Sd] ----
Do i1=1,5
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhhhSdcSd(gE1,i1,i2,i3)
coup2 = cplAhhhSdcSd(gE2,i1,i3,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*SfSSS(p2,Mhh2(i1),MSd2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Hpm,Su,conj[Sd] ----
Do i1=1,8
Do i2=1,6
Do i3=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmSucSd(gE1,i1,i2,i3)
coup2 = cplAhSdcHpmcSu(gE2,i3,i1,i2)
prefactor=Real(coup1*coup2,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*SfSSS(p2,MHpm2(i1),MSu2(i2),MSd2(i3),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Topology UoSSSS
! ---- Hpm,conj[Hpm],Ah,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhAhHpmcHpm(gE2,i3,i4,i1)
coup3 = cplAhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MHpm2(i1),MHpm2(i2),MAh2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],hh,Hpm ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhhhHpmcHpm(gE2,i3,i4,i1)
coup3 = cplhhHpmcHpm(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*UfSSSS(p2,MHpm2(i1),MHpm2(i2),Mhh2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Sd,conj[Su] ----
Do i1=1,8
Do i2=1,8
Do i3=1,6
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhSdcHpmcSu(gE2,i3,i1,i4)
coup3 = cplHpmSucSd(i2,i4,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MHpm2(i1),MHpm2(i2),MSd2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Ah,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhAhSdcSd(gE2,i3,i4,i1)
coup3 = cplAhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),MAh2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],hh,Sd ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhhhSdcSd(gE2,i3,i4,i1)
coup3 = cplhhSdcSd(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),Mhh2(i3),MSd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Hpm,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,8
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhHpmSucSd(gE2,i3,i4,i1)
coup3 = cplSdcHpmcSu(i2,i3,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSd2(i1),MSd2(i2),MHpm2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Ah,Su ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhAhSucSu(gE2,i3,i4,i1)
coup3 = cplAhSucSu(i3,i2,i4)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSu2(i1),MSu2(i2),MAh2(i3),MSu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Sd,conj[Hpm] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSdcHpmcSu(gE2,i3,i4,i1)
coup3 = cplHpmSucSd(i4,i2,i3)
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -12._dp*UfSSSS(p2,MSu2(i1),MSu2(i2),MSd2(i3),MHpm2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology VoSSSSS
! ---- Hpm,conj[Hpm],Hpm,Ah,conj[Hpm] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,5
Do i5=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3 = cplAhHpmcHpm(i4,i2,i5)
coup4 = cplAhHpmcHpm(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MAh2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,hh,conj[Hpm] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,5
Do i5=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3 = cplhhHpmcHpm(i4,i2,i5)
coup4 = cplhhHpmcHpm(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),Mhh2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Su,conj[Sd] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,6
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3 = cplHpmSucSd(i2,i4,i5)
coup4 = cplSdcHpmcSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MSu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Ah,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplAhSdcSd(i4,i2,i5)
coup4 = cplAhSdcSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MAh2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,hh,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplhhSdcSd(i4,i2,i5)
coup4 = cplhhSdcSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),Mhh2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3 = cplSdcHpmcSu(i2,i4,i5)
coup4 = cplHpmSucSd(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MHpm2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Ah,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplAhSucSu(i4,i2,i5)
coup4 = cplAhSucSu(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MAh2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,hh,conj[Su] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplhhSucSu(i4,i2,i5)
coup4 = cplhhSucSu(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),Mhh2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Hpm,conj[Sd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,8
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3 = cplHpmSucSd(i4,i2,i5)
coup4 = cplSdcHpmcSu(i5,i4,i3)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MHpm2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSSSSS
! ---- Hpm,Su,conj[Hpm],conj[Su],Sd ----
Do i1=1,8
Do i2=1,6
Do i3=1,8
Do i4=1,6
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2 = cplAhSucSu(gE2,i2,i4)
coup3 = cplSdcHpmcSu(i5,i1,i2)
coup4 = cplHpmSucSd(i3,i4,i5)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MfSSSSS(p2,MHpm2(i1),MSu2(i2),MHpm2(i3),MSu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],conj[Hpm],Hpm,Ah ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,8
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2 = cplAhHpmcHpm(gE2,i4,i2)
coup3 = cplAhHpmcHpm(i5,i2,i1)
coup4 = cplAhHpmcHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MHpm2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],conj[Hpm],Hpm,hh ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,8
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2 = cplAhHpmcHpm(gE2,i4,i2)
coup3 = cplhhHpmcHpm(i5,i2,i1)
coup4 = cplhhHpmcHpm(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfSSSSS(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MHpm2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Sd],conj[Hpm],Sd,conj[Su] ----
Do i1=1,8
Do i2=1,6
Do i3=1,8
Do i4=1,6
Do i5=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2 = cplAhSdcSd(gE2,i4,i2)
coup3 = cplSdcHpmcSu(i2,i1,i5)
coup4 = cplHpmSucSd(i3,i5,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MfSSSSS(p2,MHpm2(i1),MSd2(i2),MHpm2(i3),MSd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],conj[Sd],Sd,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2 = cplAhSdcSd(gE2,i4,i2)
coup3 = cplAhSdcSd(i5,i2,i1)
coup4 = cplAhSdcSd(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],conj[Sd],Sd,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2 = cplAhSdcSd(gE2,i4,i2)
coup3 = cplhhSdcSd(i5,i2,i1)
coup4 = cplhhSdcSd(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSd2(i1),MSd2(i2),MSd2(i3),MSd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Su],conj[Sd],Su,Hpm ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,8
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2 = cplAhSucSu(gE2,i4,i2)
coup3 = cplHpmSucSd(i5,i2,i1)
coup4 = cplSdcHpmcSu(i3,i5,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MfSSSSS(p2,MSd2(i1),MSu2(i2),MSd2(i3),MSu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],conj[Su],Su,Ah ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2 = cplAhSucSu(gE2,i4,i2)
coup3 = cplAhSucSu(i5,i2,i1)
coup4 = cplAhSucSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],conj[Su],Su,hh ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,6
Do i5=1,5
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2 = cplAhSucSu(gE2,i4,i2)
coup3 = cplhhSucSu(i5,i2,i1)
coup4 = cplhhSucSu(i5,i3,i4)
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfSSSSS(p2,MSu2(i1),MSu2(i2),MSu2(i3),MSu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology WoSSSV
! ---- Sd ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSSV(p2,MSd2(i1),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
! ---- Su ----
Do i1=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i1)
coup2 = g3
coup3 = g3
prefactor=Real(coup1*coup2*coup3,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSSV(p2,MSu2(i1),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
! ---- Topology MoSSSSV
! ---- Sd,conj[Sd] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i2,i1)
coup3 = g3
coup4 = g3
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSV(p2,MSd2(i1),MSd2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- Su,conj[Su] ----
Do i1=1,6
Do i2=1,6
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i2,i1)
coup3 = g3
coup4 = g3
prefactor=Real(coup1*coup2*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MfSSSSV(p2,MSu2(i1),MSu2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
! ---- Topology WoSSFF
! ---- Hpm,conj[Hpm],Cha,Chi ----
Do i1=1,8
Do i2=1,8
Do i3=1,5
Do i4=1,7
if((MCha(i3) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2L = cplChiChacHpmL(i4,i3,i1)
coup2R = cplChiChacHpmR(i4,i3,i1)
coup3L = cplcChaChiHpmL(i3,i4,i2)
coup3R = cplcChaChiHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*MCha(i3)*MChi(i4)*WfSSFbFb(p2,MHpm2(i1),MHpm2(i2),MCha2(i3),MChi2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2L = cplChiChacHpmL(i4,i3,i1)
coup2R = cplChiChacHpmR(i4,i3,i1)
coup3L = cplcChaChiHpmL(i3,i4,i2)
coup3R = cplcChaChiHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -1._dp*WfSSFF(p2,MHpm2(i1),MHpm2(i2),MCha2(i3),MChi2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Fd,bar[Fu] ----
Do i1=1,8
Do i2=1,8
Do i3=1,3
Do i4=1,3
if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2L = cplcFuFdcHpmL(i4,i3,i1)
coup2R = cplcFuFdcHpmR(i4,i3,i1)
coup3L = cplcFdFuHpmL(i3,i4,i2)
coup3R = cplcFdFuHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MFd(i3)*MFu(i4)*WfSSFbFb(p2,MHpm2(i1),MHpm2(i2),MFd2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhHpmcHpm(gE1,gE2,i1,i2)
coup2L = cplcFuFdcHpmL(i4,i3,i1)
coup2R = cplcFuFdcHpmR(i4,i3,i1)
coup3L = cplcFdFuHpmL(i3,i4,i2)
coup3R = cplcFdFuHpmR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MHpm2(i1),MHpm2(i2),MFd2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Cha,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,5
Do i4=1,3
if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MCha(i3)*MFu(i4)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChaFucSdL(i3,i4,i1)
coup2R = cplChaFucSdR(i3,i4,i1)
coup3L = cplcChacFuSdL(i3,i4,i2)
coup3R = cplcChacFuSdR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MCha2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Chi,Fd ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MChi(i3)*MFd(i4)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplChiFdcSdL(i3,i4,i1)
coup2R = cplChiFdcSdR(i3,i4,i1)
coup3L = cplcFdChiSdL(i4,i3,i2)
coup3R = cplcFdChiSdR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MChi2(i3),MFd2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MGlu*MFd(i3)*WfSSFbFb(p2,MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSdcSd(gE1,gE2,i1,i2)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdGluSdL(i3,i2)
coup3R = cplcFdGluSdR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSFF(p2,MSd2(i1),MSd2(i2),MFd2(i3),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Su,conj[Su],Chi,Fu ----
Do i1=1,6
Do i2=1,6
Do i3=1,7
Do i4=1,3
if((MChi(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MChi(i3)*MFu(i4)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplChiFucSuL(i3,i4,i1)
coup2R = cplChiFucSuR(i3,i4,i1)
coup3L = cplcFuChiSuL(i4,i3,i2)
coup3R = cplcFuChiSuR(i4,i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MChi2(i3),MFu2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
Do i4=1,5
if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*MFd(i3)*MCha(i4)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplcChaFdcSuL(i4,i3,i1)
coup2R = cplcChaFdcSuR(i4,i3,i1)
coup3L = cplcFdChaSuL(i3,i4,i2)
coup3R = cplcFdChaSuR(i3,i4,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -3._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MFd2(i3),MCha2(i4),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Su,conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,6
Do i3=1,3
if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3L+coup1*coup2R*coup3R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*MGlu*MFu(i3)*WfSSFbFb(p2,MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhAhSucSu(gE1,gE2,i1,i2)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuGluSuL(i3,i2)
coup3R = cplcFuGluSuR(i3,i2)
prefactor=Real(coup1*coup2L*coup3R+coup1*coup2R*coup3L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= -4._dp*WfSSFF(p2,MSu2(i1),MSu2(i2),MFu2(i3),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
! ---- Topology MoFFFFS
! ---- Cha,Fu,bar[Cha],bar[Fu],Sd ----
Do i1=1,5
Do i2=1,3
Do i3=1,5
Do i4=1,3
Do i5=1,6
if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MCha(i1)*MFu(i2)*MCha(i3)*MFu(i4)*MfFbFbFbFbS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MCha(i3)*MfFFbFbFS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i4)*MfFFbFFbS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MFu(i4)*MfFFFbFbS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i1,i2,i5)
coup3R = cplcChacFuSdR(i1,i2,i5)
coup4L = cplChaFucSdL(i3,i4,i5)
coup4R = cplChaFucSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MCha2(i1),MFu2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],bar[Cha],Cha,Ah ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
Do i5=1,5
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MCha(i1)*MCha(i4)*MCha(i2)*MCha(i3)*MfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i2)*MCha(i3)*MfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MCha(i2)*MfFFbFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MCha(i3)*MfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChaAhL(i1,i2,i5)
coup3R = cplcChaChaAhR(i1,i2,i5)
coup4L = cplcChaChaAhL(i4,i3,i5)
coup4R = cplcChaChaAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],bar[Cha],Cha,hh ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
Do i5=1,5
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= MCha(i1)*MCha(i4)*MCha(i2)*MCha(i3)*MfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i2)*MCha(i3)*MfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MCha(i2)*MfFFbFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MCha(i3)*MfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcChaChahhL(i1,i2,i5)
coup3R = cplcChaChahhR(i1,i2,i5)
coup4L = cplcChaChahhL(i4,i3,i5)
coup4R = cplcChaChahhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 1._dp*MfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Fd],bar[Cha],Fd,conj[Su] ----
Do i1=1,5
Do i2=1,3
Do i3=1,5
Do i4=1,3
Do i5=1,6
if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MCha(i1)*MFd(i4)*MCha(i3)*MFd(i2)*MfFbFbFbFbS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MFd(i2)*MfFFbFbFS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MCha(i3)*MfFFFbFbS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i3,i1,gE1)
coup1R = cplcChaChaAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i1,i2,i5)
coup3R = cplcChaFdcSuR(i1,i2,i5)
coup4L = cplcFdChaSuL(i4,i3,i5)
coup4R = cplcFdChaSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MCha2(i1),MFd2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Cha],bar[Fd],Cha,Su ----
Do i1=1,3
Do i2=1,5
Do i3=1,3
Do i4=1,5
Do i5=1,6
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MCha(i4)*MFd(i1)*MCha(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MCha(i2)*MfFFbFFbS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplcFdChaSuL(i1,i2,i5)
coup3R = cplcFdChaSuR(i1,i2,i5)
coup4L = cplcChaFdcSuL(i4,i3,i5)
coup4R = cplcChaFdcSuR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MCha2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],bar[Fd],Fd,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdAhL(i1,i2,i5)
coup3R = cplcFdFdAhR(i1,i2,i5)
coup4L = cplcFdFdAhL(i4,i3,i5)
coup4R = cplcFdFdAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],bar[Fd],Fd,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFd(i4)*MFd(i2)*MFd(i3)*MfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFd(i3)*MfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFdFdhhL(i1,i2,i5)
coup3R = cplcFdFdhhR(i1,i2,i5)
coup4L = cplcFdFdhhL(i4,i3,i5)
coup4R = cplcFdFdhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fu],bar[Fd],Fu,Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,8
if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i1)*MFu(i4)*MFd(i3)*MFu(i2)*MfFbFbFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFu(i2)*MfFFbFbFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i3)*MfFFFbFbS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i3,i1,gE1)
coup1R = cplcFdFdAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFdFuHpmL(i1,i2,i5)
coup3R = cplcFdFuHpmR(i1,i2,i5)
coup4L = cplcFuFdcHpmL(i4,i3,i5)
coup4R = cplcFuFdcHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFd2(i1),MFu2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,Cha,bar[Fu],bar[Cha],Sd ----
Do i1=1,3
Do i2=1,5
Do i3=1,3
Do i4=1,5
Do i5=1,6
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i4,i2,gE2)
coup2R = cplcChaChaAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MCha(i2)*MFu(i1)*MCha(i4)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i4,i2,gE2)
coup2R = cplcChaChaAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i4,i2,gE2)
coup2R = cplcChaChaAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i2)*MCha(i4)*MfFFbFFbS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i4,i2,gE2)
coup2R = cplcChaChaAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcChaChaAhL(i4,i2,gE2)
coup2R = cplcChaChaAhR(i4,i2,gE2)
coup3L = cplcChacFuSdL(i2,i1,i5)
coup3R = cplcChacFuSdR(i2,i1,i5)
coup4L = cplChaFucSdL(i4,i3,i5)
coup4R = cplChaFucSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MCha2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fd],bar[Fu],Fd,conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,8
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFd(i4)*MFu(i1)*MFd(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MfFFbFFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i1,i2,i5)
coup3R = cplcFuFdcHpmR(i1,i2,i5)
coup4L = cplcFdFuHpmL(i4,i3,i5)
coup4R = cplcFdFuHpmR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFd2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuAhL(i1,i2,i5)
coup3R = cplcFuFuAhR(i1,i2,i5)
coup4L = cplcFuFuAhL(i4,i3,i5)
coup4R = cplcFuFuAhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],bar[Fu],Fu,hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MFu(i1)*MFu(i4)*MFu(i2)*MFu(i3)*MfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i2)*MFu(i3)*MfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i2)*MfFFbFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFu(i3)*MfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i3,i1,gE1)
coup1R = cplcFuFuAhR(i3,i1,gE1)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplcFuFuhhL(i1,i2,i5)
coup3R = cplcFuFuhhR(i1,i2,i5)
coup4L = cplcFuFuhhL(i4,i3,i5)
coup4R = cplcFuFuhhR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 3._dp*MfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology MoSFSFF
! ---- Hpm,Fu,conj[Hpm],bar[Fu],Fd ----
Do i1=1,8
Do i2=1,3
Do i3=1,8
Do i4=1,3
Do i5=1,3
if((MFd(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFdcHpmL(i2,i5,i1)
coup3R = cplcFuFdcHpmR(i2,i5,i1)
coup4L = cplcFdFuHpmL(i5,i4,i3)
coup4R = cplcFdFuHpmR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MFu(i2)*MFu(i4)*MfSFbSFbFb(p2,MHpm2(i1),MFu2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFdcHpmL(i2,i5,i1)
coup3R = cplcFuFdcHpmR(i2,i5,i1)
coup4L = cplcFdFuHpmL(i5,i4,i3)
coup4R = cplcFdFuHpmR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MHpm2(i1),MFu2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcFuFuAhL(i4,i2,gE2)
coup2R = cplcFuFuAhR(i4,i2,gE2)
coup3L = cplcFuFdcHpmL(i2,i5,i1)
coup3R = cplcFuFdcHpmR(i2,i5,i1)
coup4L = cplcFdFuHpmL(i5,i4,i3)
coup4R = cplcFdFuHpmR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,MHpm2(i1),MFu2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Hpm,bar[Cha],conj[Hpm],Cha,Chi ----
Do i1=1,8
Do i2=1,5
Do i3=1,8
Do i4=1,5
Do i5=1,7
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplChiChacHpmL(i5,i2,i1)
coup3R = cplChiChacHpmR(i5,i2,i1)
coup4L = cplcChaChiHpmL(i4,i5,i3)
coup4R = cplcChaChiHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i4)*MChi(i5)*MCha(i2)*MfSFbSFbFb(p2,MHpm2(i1),MCha2(i2),MHpm2(i3),MCha2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplChiChacHpmL(i5,i2,i1)
coup3R = cplChiChacHpmR(i5,i2,i1)
coup4L = cplcChaChiHpmL(i4,i5,i3)
coup4R = cplcChaChiHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i4)*MfSFSFbF(p2,MHpm2(i1),MCha2(i2),MHpm2(i3),MCha2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplChiChacHpmL(i5,i2,i1)
coup3R = cplChiChacHpmR(i5,i2,i1)
coup4L = cplcChaChiHpmL(i4,i5,i3)
coup4R = cplcChaChiHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i5)*MfSFSFFb(p2,MHpm2(i1),MCha2(i2),MHpm2(i3),MCha2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Hpm,bar[Fd],conj[Hpm],Fd,bar[Fu] ----
Do i1=1,8
Do i2=1,3
Do i3=1,8
Do i4=1,3
Do i5=1,3
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i5,i2,i1)
coup3R = cplcFuFdcHpmR(i5,i2,i1)
coup4L = cplcFdFuHpmL(i4,i5,i3)
coup4R = cplcFdFuHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MFd(i2)*MFu(i5)*MfSFbSFbFb(p2,MHpm2(i1),MFd2(i2),MHpm2(i3),MFd2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i5,i2,i1)
coup3R = cplcFuFdcHpmR(i5,i2,i1)
coup4L = cplcFdFuHpmL(i4,i5,i3)
coup4R = cplcFdFuHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MHpm2(i1),MFd2(i2),MHpm2(i3),MFd2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcFuFdcHpmL(i5,i2,i1)
coup3R = cplcFuFdcHpmR(i5,i2,i1)
coup4L = cplcFdFuHpmL(i4,i5,i3)
coup4R = cplcFdFuHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,MHpm2(i1),MFd2(i2),MHpm2(i3),MFd2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Sd,bar[Cha],conj[Sd],Cha,Fu ----
Do i1=1,6
Do i2=1,5
Do i3=1,6
Do i4=1,5
Do i5=1,3
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i2,i5,i1)
coup3R = cplChaFucSdR(i2,i5,i1)
coup4L = cplcChacFuSdL(i4,i5,i3)
coup4R = cplcChacFuSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i5)*MCha(i2)*MfSFbSFbFb(p2,MSd2(i1),MCha2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i2,i5,i1)
coup3R = cplChaFucSdR(i2,i5,i1)
coup4L = cplcChacFuSdL(i4,i5,i3)
coup4R = cplcChacFuSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i4)*MfSFSFbF(p2,MSd2(i1),MCha2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcChaChaAhL(i2,i4,gE2)
coup2R = cplcChaChaAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i2,i5,i1)
coup3R = cplChaFucSdR(i2,i5,i1)
coup4L = cplcChacFuSdL(i4,i5,i3)
coup4R = cplcChacFuSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i5)*MfSFSFFb(p2,MSd2(i1),MCha2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Sd,bar[Fd],conj[Sd],Fd,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MFd(i4)*MFd(i2)*MfSFbSFbFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplChiFdcSdL(i5,i2,i1)
coup3R = cplChiFdcSdR(i5,i2,i1)
coup4L = cplcFdChiSdL(i4,i5,i3)
coup4R = cplcFdChiSdR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MfSFSFFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Sd,bar[Fd],conj[Sd],Fd,Glu ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
if((MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i4)*MFd(i2)*MfSFbSFbFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFd(i4)*MfSFSFbF(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplGluFdcSdL(i2,i1)
coup3R = cplGluFdcSdR(i2,i1)
coup4L = cplcFdGluSdL(i4,i3)
coup4R = cplcFdGluSdR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MfSFSFFb(p2,MSd2(i1),MFd2(i2),MSd2(i3),MFd2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Sd,bar[Fu],conj[Sd],Fu,Cha ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,5
if((MCha(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChaFucSdL(i5,i2,i1)
coup3R = cplChaFucSdR(i5,i2,i1)
coup4L = cplcChacFuSdL(i5,i4,i3)
coup4R = cplcChacFuSdR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MfSFSFFb(p2,MSd2(i1),MFu2(i2),MSd2(i3),MFu2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,Cha,conj[Su],bar[Cha],Fd ----
Do i1=1,6
Do i2=1,5
Do i3=1,6
Do i4=1,5
Do i5=1,3
if((MCha(i2) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcChaChaAhL(i4,i2,gE2)
coup2R = cplcChaChaAhR(i4,i2,gE2)
coup3L = cplcChaFdcSuL(i2,i5,i1)
coup3R = cplcChaFdcSuR(i2,i5,i1)
coup4L = cplcFdChaSuL(i5,i4,i3)
coup4R = cplcFdChaSuR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i2)*MFd(i5)*MCha(i4)*MfSFbSFbFb(p2,MSu2(i1),MCha2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcChaChaAhL(i4,i2,gE2)
coup2R = cplcChaChaAhR(i4,i2,gE2)
coup3L = cplcChaFdcSuL(i2,i5,i1)
coup3R = cplcChaFdcSuR(i2,i5,i1)
coup4L = cplcFdChaSuL(i5,i4,i3)
coup4R = cplcFdChaSuR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i4)*MfSFSFbF(p2,MSu2(i1),MCha2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcChaChaAhL(i4,i2,gE2)
coup2R = cplcChaChaAhR(i4,i2,gE2)
coup3L = cplcChaFdcSuL(i2,i5,i1)
coup3R = cplcChaFdcSuR(i2,i5,i1)
coup4L = cplcFdChaSuL(i5,i4,i3)
coup4R = cplcFdChaSuR(i5,i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i5)*MfSFSFFb(p2,MSu2(i1),MCha2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fd],conj[Su],Fd,bar[Cha] ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,5
if((MCha(i5) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i4)*MCha(i5)*MFd(i2)*MfSFbSFbFb(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i4)*MfSFSFbF(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFdFdAhL(i2,i4,gE2)
coup2R = cplcFdFdAhR(i2,i4,gE2)
coup3L = cplcChaFdcSuL(i5,i2,i1)
coup3R = cplcChaFdcSuR(i5,i2,i1)
coup4L = cplcFdChaSuL(i4,i5,i3)
coup4R = cplcFdChaSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i5)*MfSFSFFb(p2,MSu2(i1),MFd2(i2),MSu2(i3),MFd2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fu],conj[Su],Fu,Chi ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
Do i5=1,7
if((MChi(i5) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i4)*MfSFSFbF(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplChiFucSuL(i5,i2,i1)
coup3R = cplChiFucSuR(i5,i2,i1)
coup4L = cplcFuChiSuL(i4,i5,i3)
coup4R = cplcFuChiSuR(i4,i5,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i5)*MfSFSFFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MChi2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
end do
! ---- Su,bar[Fu],conj[Su],Fu,Glu ----
Do i1=1,6
Do i2=1,3
Do i3=1,6
Do i4=1,3
if((MFu(i2) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3L*coup4L+coup1*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i4)*MFu(i2)*MfSFbSFbFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4L+coup1*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFu(i4)*MfSFSFbF(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i3)
coup2L = cplcFuFuAhL(i2,i4,gE2)
coup2R = cplcFuFuAhR(i2,i4,gE2)
coup3L = cplGluFucSuL(i2,i1)
coup3R = cplGluFucSuR(i2,i1)
coup4L = cplcFuGluSuL(i4,i3)
coup4R = cplcFuGluSuR(i4,i3)
prefactor=Real(coup1*coup2L*coup3R*coup4R+coup1*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MfSFSFFb(p2,MSu2(i1),MFu2(i2),MSu2(i3),MFu2(i4),MGlu2,Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
end do
end do
! ---- Topology VoSSSFF
! ---- Hpm,conj[Hpm],Hpm,Chi,bar[Cha] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,7
Do i5=1,5
if((MCha(i5) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3L = cplcChaChiHpmL(i5,i4,i2)
coup3R = cplcChaChiHpmR(i5,i4,i2)
coup4L = cplChiChacHpmL(i4,i5,i3)
coup4R = cplChiChacHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MChi(i4)*MCha(i5)*VfSSSFbFb(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MChi2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3L = cplcChaChiHpmL(i5,i4,i2)
coup3R = cplcChaChiHpmR(i5,i4,i2)
coup4L = cplChiChacHpmL(i4,i5,i3)
coup4R = cplChiChacHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfSSSFF(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MChi2(i4),MCha2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Hpm,conj[Hpm],Hpm,Fu,bar[Fd] ----
Do i1=1,8
Do i2=1,8
Do i3=1,8
Do i4=1,3
Do i5=1,3
if((MFd(i5) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3L = cplcFdFuHpmL(i5,i4,i2)
coup3R = cplcFdFuHpmR(i5,i4,i2)
coup4L = cplcFuFdcHpmL(i4,i5,i3)
coup4R = cplcFuFdcHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i4)*MFd(i5)*VfSSSFbFb(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhHpmcHpm(gE1,i1,i2)
coup2 = cplAhHpmcHpm(gE2,i3,i1)
coup3L = cplcFdFuHpmL(i5,i4,i2)
coup3R = cplcFdFuHpmR(i5,i4,i2)
coup4L = cplcFuFdcHpmL(i4,i5,i3)
coup4R = cplcFuFdcHpmR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MHpm2(i1),MHpm2(i2),MHpm2(i3),MFu2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Chi,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcFdChiSdL(i5,i4,i2)
coup3R = cplcFdChiSdR(i5,i4,i2)
coup4L = cplChiFdcSdL(i4,i5,i3)
coup4R = cplChiFdcSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MChi2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcFdChiSdL(i5,i4,i2)
coup3R = cplcFdChiSdR(i5,i4,i2)
coup4L = cplChiFdcSdL(i4,i5,i3)
coup4R = cplChiFdcSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MChi2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,Glu,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i5=1,3
if((MFd(i5) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcFdGluSdL(i5,i2)
coup3R = cplcFdGluSdR(i5,i2)
coup4L = cplGluFdcSdL(i5,i3)
coup4R = cplGluFdcSdR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MGlu2,MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcFdGluSdL(i5,i2)
coup3R = cplcFdGluSdR(i5,i2)
coup4L = cplGluFdcSdL(i5,i3)
coup4R = cplGluFdcSdR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MGlu2,MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Sd,conj[Sd],Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcChacFuSdL(i4,i5,i2)
coup3R = cplcChacFuSdR(i4,i5,i2)
coup4L = cplChaFucSdL(i4,i5,i3)
coup4R = cplChaFucSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i5)*VfSSSFbFb(p2,MSd2(i1),MSd2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSdcSd(gE1,i1,i2)
coup2 = cplAhSdcSd(gE2,i3,i1)
coup3L = cplcChacFuSdL(i4,i5,i2)
coup3R = cplcChacFuSdR(i4,i5,i2)
coup4L = cplChaFucSdL(i4,i5,i3)
coup4R = cplChaFucSdR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSd2(i1),MSd2(i2),MSd2(i3),MCha2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Cha,bar[Fd] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,5
Do i5=1,3
if((MCha(i4) .gt. epsfmass) .and. (MFd(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFdChaSuL(i5,i4,i2)
coup3R = cplcFdChaSuR(i5,i4,i2)
coup4L = cplcChaFdcSuL(i4,i5,i3)
coup4R = cplcChaFdcSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFd(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFdChaSuL(i5,i4,i2)
coup3R = cplcFdChaSuR(i5,i4,i2)
coup4L = cplcChaFdcSuL(i4,i5,i3)
coup4R = cplcChaFdcSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MCha2(i4),MFd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Chi,bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i4=1,7
Do i5=1,3
if((MChi(i4) .gt. epsfmass) .and. (MFu(i5) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFuChiSuL(i5,i4,i2)
coup3R = cplcFuChiSuR(i5,i4,i2)
coup4L = cplChiFucSuL(i4,i5,i3)
coup4R = cplChiFucSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MChi2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFuChiSuL(i5,i4,i2)
coup3R = cplcFuChiSuR(i5,i4,i2)
coup4L = cplChiFucSuL(i4,i5,i3)
coup4R = cplChiFucSuR(i4,i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MChi2(i4),MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Su,conj[Su],Su,Glu,bar[Fu] ----
Do i1=1,6
Do i2=1,6
Do i3=1,6
Do i5=1,3
if((MFu(i5) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFuGluSuL(i5,i2)
coup3R = cplcFuGluSuR(i5,i2)
coup4L = cplGluFucSuL(i5,i3)
coup4R = cplGluFucSuR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4L+coup1*coup2*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i5)*VfSSSFbFb(p2,MSu2(i1),MSu2(i2),MSu2(i3),MGlu2,MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1 = cplAhSucSu(gE1,i1,i2)
coup2 = cplAhSucSu(gE2,i3,i1)
coup3L = cplcFuGluSuL(i5,i2)
coup3R = cplcFuGluSuR(i5,i2)
coup4L = cplGluFucSuL(i5,i3)
coup4R = cplGluFucSuR(i5,i3)
prefactor=Real(coup1*coup2*coup3L*coup4R+coup1*coup2*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfSSSFF(p2,MSu2(i1),MSu2(i2),MSu2(i3),MGlu2,MFu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Topology VoFFFFS
! ---- Cha,bar[Cha],Cha,bar[Cha],Ah ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
Do i5=1,5
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i3)*MCha(i2)*MCha(i4)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i3)*MCha(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChaAhL(i4,i2,i5)
coup3R = cplcChaChaAhR(i4,i2,i5)
coup4L = cplcChaChaAhL(i3,i4,i5)
coup4R = cplcChaChaAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,Chi,conj[Hpm] ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,7
Do i5=1,8
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i3)*MChi(i4)*MCha(i2)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MChi(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MChi(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i3)*MChi(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChiChacHpmL(i4,i2,i5)
coup3R = cplChiChacHpmR(i4,i2,i5)
coup4L = cplcChaChiHpmL(i3,i4,i5)
coup4R = cplcChaChiHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MChi2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,Fu,conj[Sd] ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,3
Do i5=1,6
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MCha(i3)*MFu(i4)*MCha(i2)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MFu(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i3)*MFu(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i2,i4,i5)
coup3R = cplChaFucSdR(i2,i4,i5)
coup4L = cplcChacFuSdL(i3,i4,i5)
coup4R = cplcChacFuSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFu2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,bar[Cha],hh ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,5
Do i5=1,5
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i3)*MCha(i2)*MCha(i4)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i1)*MCha(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MCha(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MCha(i3)*MCha(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcChaChahhL(i4,i2,i5)
coup3R = cplcChaChahhR(i4,i2,i5)
coup4L = cplcChaChahhL(i3,i4,i5)
coup4R = cplcChaChahhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 2._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MCha2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Cha,bar[Cha],Cha,bar[Fd],Su ----
Do i1=1,5
Do i2=1,5
Do i3=1,5
Do i4=1,3
Do i5=1,6
if((MCha(i1) .gt. epsfmass) .and. (MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MCha(i3)*MCha(i2)*MFd(i4)*VfFbFbFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i1)*MCha(i3)*VfFbFFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i1)*MFd(i4)*VfFbFFFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i2) .gt. epsfmass) .and. (MCha(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i3)*MCha(i2)*VfFFbFbFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i3)*MFd(i4)*VfFFFbFbS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcChaChaAhL(i2,i1,gE1)
coup1R = cplcChaChaAhR(i2,i1,gE1)
coup2L = cplcChaChaAhL(i1,i3,gE2)
coup2R = cplcChaChaAhR(i1,i3,gE2)
coup3L = cplcFdChaSuL(i4,i2,i5)
coup3R = cplcFdChaSuR(i4,i2,i5)
coup4L = cplcChaFdcSuL(i3,i4,i5)
coup4R = cplcChaFdcSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MCha2(i1),MCha2(i2),MCha2(i3),MFd2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fd],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdAhL(i4,i2,i5)
coup3R = cplcFdFdAhR(i4,i2,i5)
coup4L = cplcFdFdAhL(i3,i4,i5)
coup4R = cplcFdFdAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Chi,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i1)*MFd(i3)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFd(i1)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MChi(i4)*MFd(i3)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplChiFdcSdL(i4,i2,i5)
coup3R = cplChiFdcSdR(i4,i2,i5)
coup4L = cplcFdChiSdL(i3,i4,i5)
coup4R = cplcFdChiSdR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MChi2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,Glu,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i5=1,6
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*MFd(i3)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFd(i1)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MGlu*MFd(i3)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplGluFdcSdL(i2,i5)
coup3R = cplGluFdcSdR(i2,i5)
coup4L = cplcFdGluSdL(i3,i5)
coup4R = cplcFdGluSdR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MGlu2,MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fd],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFd(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFd(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFd(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFdFdhhL(i4,i2,i5)
coup3R = cplcFdFdhhR(i4,i2,i5)
coup4L = cplcFdFdhhL(i3,i4,i5)
coup4R = cplcFdFdhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFd2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Cha],conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,5
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MCha(i4)*MFd(i2)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MCha(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MCha(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcChaFdcSuL(i4,i2,i5)
coup3R = cplcChaFdcSuR(i4,i2,i5)
coup4L = cplcFdChaSuL(i3,i4,i5)
coup4R = cplcFdChaSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MCha2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fd,bar[Fd],Fd,bar[Fu],conj[Hpm] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,8
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFd(i3)*MFd(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i1)*MFd(i3)*VfFbFFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i1)*MFu(i4)*VfFbFFFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i2) .gt. epsfmass) .and. (MFd(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFd(i3)*MFd(i2)*VfFFbFbFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFd(i3)*MFu(i4)*VfFFFbFbS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i3,gE2)
coup2R = cplcFdFdAhR(i1,i3,gE2)
coup3L = cplcFuFdcHpmL(i4,i2,i5)
coup3R = cplcFuFdcHpmR(i4,i2,i5)
coup4L = cplcFdFuHpmL(i3,i4,i5)
coup4R = cplcFdFuHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFd2(i1),MFd2(i2),MFd2(i3),MFu2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],Ah ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuAhL(i4,i2,i5)
coup3R = cplcFuFuAhR(i4,i2,i5)
coup4L = cplcFuFuAhL(i3,i4,i5)
coup4R = cplcFuFuAhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),MAh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Cha,conj[Sd] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,5
Do i5=1,6
if((MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MCha(i4)*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MCha(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MCha(i4)*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChaFucSdL(i4,i2,i5)
coup3R = cplChaFucSdR(i4,i2,i5)
coup4L = cplcChacFuSdL(i4,i3,i5)
coup4R = cplcChacFuSdR(i4,i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MCha2(i4),MSd2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Chi,conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,7
Do i5=1,6
if((MChi(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MChi(i4)*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MChi(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MChi(i4)*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplChiFucSuL(i4,i2,i5)
coup3R = cplChiFucSuR(i4,i2,i5)
coup4L = cplcFuChiSuL(i3,i4,i5)
coup4R = cplcFuChiSuR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MChi2(i4),MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,Glu,conj[Su] ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i5=1,6
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*MFu(i3)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MGlu*MFu(i1)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MGlu .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 16._dp*MGlu*MFu(i3)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplGluFucSuL(i2,i5)
coup3R = cplGluFucSuR(i2,i5)
coup4L = cplcFuGluSuL(i3,i5)
coup4R = cplcFuGluSuR(i3,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 8._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MGlu2,MSu2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fu],hh ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,5
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFu(i2)*MFu(i4)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i3) .gt. epsfmass) .and. (MFu(i4) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFu(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFuFuhhL(i4,i2,i5)
coup3R = cplcFuFuhhR(i4,i2,i5)
coup4L = cplcFuFuhhL(i3,i4,i5)
coup4R = cplcFuFuhhR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFu2(i4),Mhh2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Fu,bar[Fu],Fu,bar[Fd],Hpm ----
Do i1=1,3
Do i2=1,3
Do i3=1,3
Do i4=1,3
Do i5=1,8
if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3L*coup4L+coup1R*coup2R*coup3R*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFu(i3)*MFd(i4)*MFu(i2)*VfFbFbFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i1) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4L+coup1R*coup2R*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i1)*MFu(i3)*VfFbFFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i1) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2L*coup3R*coup4R+coup1R*coup2R*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i1)*MFd(i4)*VfFbFFFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFu(i2) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3L*coup4R+coup1R*coup2L*coup3R*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*MFu(i3)*MFu(i2)*VfFFbFbFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

if((MFd(i4) .gt. epsfmass) .and. (MFu(i3) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4R+coup1R*coup2L*coup3L*coup4L,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 12._dp*MFu(i3)*MFd(i4)*VfFFFbFbS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i3,gE2)
coup2R = cplcFuFuAhR(i1,i3,gE2)
coup3L = cplcFdFuHpmL(i4,i2,i5)
coup3R = cplcFdFuHpmR(i4,i2,i5)
coup4L = cplcFuFdcHpmL(i3,i4,i5)
coup4R = cplcFuFdcHpmR(i3,i4,i5)
prefactor=Real(coup1L*coup2R*coup3R*coup4L+coup1R*coup2L*coup3L*coup4R,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 6._dp*VfFFFFS(p2,MFu2(i1),MFu2(i2),MFu2(i3),MFd2(i4),MHpm2(i5),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end do
end do
end do
end do
end do
! ---- Topology GoFFFFV
! ---- Fd,bar[Fd] ----
Do i1=1,3
Do i2=1,3
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i2,gE2)
coup2R = cplcFdFdAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
if((MFd(i1) .gt. epsfmass) .and. (MFd(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFdFdAhL(i2,i1,gE1)
coup1R = cplcFdFdAhR(i2,i1,gE1)
coup2L = cplcFdFdAhL(i1,i2,gE2)
coup2R = cplcFdFdAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFd(i1)*MFd(i2)*GfFbFbV(p2,MFd2(i1),MFd2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
! ---- Fu,bar[Fu] ----
Do i1=1,3
Do i2=1,3
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i2,gE2)
coup2R = cplcFuFuAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2R*coup3*coup4+coup1R*coup2L*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*GfFFV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
if((MFu(i1) .gt. epsfmass) .and. (MFu(i2) .gt. epsfmass)) then 
nonzerocoupling=.false.
  Do gE1=1,5
   Do gE2=1,5
coup1L = cplcFuFuAhL(i2,i1,gE1)
coup1R = cplcFuFuAhR(i2,i1,gE1)
coup2L = cplcFuFuAhL(i1,i2,gE2)
coup2R = cplcFuFuAhR(i1,i2,gE2)
coup3 = g3
coup4 = g3
prefactor=Real(coup1L*coup2L*coup3*coup4+coup1R*coup2R*coup3*coup4,dp)
if(abs(prefactor) .gt. epscouplings) then
 tempcouplingmatrixah(gE1,gE2)=prefactor
 nonzerocoupling=.true.
 else
 tempcouplingmatrixah(gE1,gE2)= 0._dp
 end if
   End Do
  End do
if(nonzerocoupling) then 
 funcvalue= 4._dp*MFu(i1)*MFu(i2)*GfFbFbV(p2,MFu2(i1),MFu2(i2),Qscale)
 tempcontah=tempcontah+tempcouplingmatrixah*funcvalue
end if
end if

end do
end do
do gE1=1,5
Pi2P(gE1,gE1)=Pi2P(gE1,gE1)+tempcontah(gE1,gE1)*oo16Pi2*oo16Pi2
do gE2=1,gE1-1
Pi2P(gE1,gE2)=Pi2P(gE1,gE2)+0.5_dp*(tempcontah(gE1,gE2)+tempcontah(gE2,gE1))*oo16Pi2*oo16Pi2
Pi2P(gE2,gE1)=Pi2P(gE1,gE2)
End do
End do
Pi2P=Pi2P+delta2lmassesah
Pi2P = Matmul(Pi2P,ZA)
Pi2P = Matmul(Transpose(ZA),Pi2P)
End Subroutine CalculatePi2S
End Module Pole2L_MSSMLV 
 
