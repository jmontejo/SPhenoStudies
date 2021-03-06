! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 21:50 on 24.8.2021   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_MSSMTriRpV 
 
Use Model_Data_MSSMTriRpV 
Use TreeLevelMasses_MSSMTriRpV 
Use RGEs_MSSMTriRpV 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,L3,Yu,Mu,Td,Te,T1,              & 
& T2,T3,Tu,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,vd,vu,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,vd,vu

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),L3(3,3,3),Yu(3,3),Mu,Td(3,3),Te(3,3),             & 
& T1(3,3,3),T2(3,3,3),T3(3,3,3),Tu(3,3),Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),         & 
& me2(3,3),M1,M2,M3

Real(dp) :: Abs2Mu

Complex(dp), Intent(in) :: Tad1Loop(2)

! For numerical routines 
Real(dp) :: gC(539)
logical :: broycheck 
Real(dp) :: broyx(2)

Abs2Mu =  0._dp 
If (HighScaleModel.Eq."LOW") Then 
mHd2 = (-(g1**2*vd**3) - g2**2*vd**3 + g1**2*vd*vu**2 + g2**2*vd*vu**2 + 4*vu*Bmu -          & 
&  8*vd*Mu*Conjg(Mu) + 4*vu*Conjg(Bmu) + 8*Tad1Loop(1))/(8._dp*vd)
mHu2 = (g1**2*vd**2*vu + g2**2*vd**2*vu - g1**2*vu**3 - g2**2*vu**3 + 4*vd*Bmu -             & 
&  8*vu*Mu*Conjg(Mu) + 4*vd*Conjg(Bmu) + 8*Tad1Loop(2))/(8._dp*vu)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (mHd2.ne.mHd2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mHd2" 
   Call TerminateProgram  
 End If 
 If (mHu2.ne.mHu2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mHu2" 
   Call TerminateProgram  
 End If 
 
 ! Check for positive abs-squared 
Else 
Abs2Mu = (-8*mHd2*vd**2 - g2**2*vd**4 + 8*mHu2*vu**2 + g2**2*vu**4 + g1**2*(-vd**4 +           & 
&  vu**4) + 8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2))/(8._dp*(vd**2 - vu**2))
Mu = Sqrt(Abs2Mu)*SignumMu
Bmu = (-4*mHd2*vd*vu + 4*mHu2*vd*vu - g1**2*vd**3*vu - g2**2*vd**3*vu + g1**2*vd*vu**3 +    & 
&  g2**2*vd*vu**3 + 4*vu*Tad1Loop(1) - 4*vd*Tad1Loop(2))/(4._dp*(vd**2 - vu**2))

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(Bmu,dp).ne.Real(Bmu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Bmu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Bmu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Bmu" 
   !Call TerminateProgram  
   Bmu = Real(Bmu,dp) 
  SignOfMuChanged= .True. 
End If 
 
 ! Check for positive abs-squared 
If (Abs2Mu.Lt.0._dp) Then 
Write(*,*) "No consistent solution found for tadpoles: " 
Write(*,*) "Negative absolute squared: ,Abs2Mu "   
Write(*,*) "Result: ",Abs2Mu 
Abs2Mu = Abs(Abs2Mu)  
Mu = SignumMu* sqrt(Abs2Mu) 
SignOfMuChanged = .True.  
End If 
End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,Yd,Ye,L1,L2,L3,Yu,Mu,Td,Te,T1,T2,               & 
& T3,Tu,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,M1,M2,M3,vd,vu,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,vd,vu

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),L3(3,3,3),Yu(3,3),Mu,Td(3,3),Te(3,3),             & 
& T1(3,3,3),T2(3,3,3),T3(3,3,3),Tu(3,3),Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),         & 
& me2(3,3),M1,M2,M3

Complex(dp), Intent(in) :: Tad1Loop(2)

Real(dp), Intent(out) :: TadpoleValues(2)

TadpoleValues(1) = Real(((g1**2 + g2**2)*vd**3 - 8*Bmu*vu + vd*(8._dp*(mHd2)          & 
&  - (g1**2 + g2**2)*vu**2 + 8*Mu**2))/8._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((-8*Bmu*vd + vu*(8._dp*(mHu2) - (g1**2 + g2**2)               & 
& *vd**2 + g1**2*vu**2 + g2**2*vu**2 + 8*Mu**2))/8._dp - Tad1Loop(2),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_MSSMTriRpV 
 
