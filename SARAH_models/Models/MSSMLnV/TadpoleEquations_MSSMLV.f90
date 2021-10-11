! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:11 on 24.8.2021   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_MSSMLV 
 
Use Model_Data_MSSMLV 
Use TreeLevelMasses_MSSMLV 
Use RGEs_MSSMLV 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,               & 
& T1,T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp), Intent(in) :: Tad1Loop(5)

! For numerical routines 
Real(dp) :: gC(449)
logical :: broycheck 
Real(dp) :: broyx(3)

If (HighScaleModel.Eq."LOW") Then 
mHd2 = (-(g1**2*vd**4) - g2**2*vd**4 + g1**2*vd**2*vu**2 + g2**2*vd**2*vu**2 +               & 
&  4*vd*vu*Bmu - 8*vd**2*Mu*Conjg(Mu) + 4*vd*vu*Conjg(Bmu) + 8*vd*Tad1Loop(1) +          & 
&  4*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) - g1**2*vu**2*vL(1)**2 -              & 
&  g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 +        & 
&  4*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) +            & 
&  8*ml2(2,1)*vL(1)*vL(2) - g1**2*vu**2*vL(2)**2 - g2**2*vu**2*vL(2)**2 + 8*ml2(2,       & 
& 2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 + & 
&  g2**2*vL(2)**4 + 4*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) + 8*ml2(1,           & 
& 3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,            & 
& 2)*vL(2)*vL(3) - g1**2*vu**2*vL(3)**2 - g2**2*vu**2*vL(3)**2 + 8*ml2(3,3)*vL(3)**2 +   & 
&  2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 +   & 
&  2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*Conjg(REps(1))*vL(1)**2*REps(1) +& 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) + 8*Conjg(REps(2))*vL(2)**2*REps(2) +            & 
&  8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +         & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  4*vu*vL(1)*Beps(1) + 4*vu*vL(2)*Beps(2) + 4*vu*vL(3)*Beps(3))/(8._dp*vd**2)
mHu2 = (g1**2*vd**2*vu + g2**2*vd**2*vu - g1**2*vu**3 - g2**2*vu**3 + 4*vd*Bmu -             & 
&  8*vu*Mu*Conjg(Mu) + 4*vd*Conjg(Bmu) + 8*Tad1Loop(2) - 4*Conjg(Beps(1))*vL(1) +        & 
&  g1**2*vu*vL(1)**2 + g2**2*vu*vL(1)**2 - 4*Conjg(Beps(2))*vL(2) + g1**2*vu*vL(2)**2 +  & 
&  g2**2*vu*vL(2)**2 - 4*Conjg(Beps(3))*vL(3) + g1**2*vu*vL(3)**2 + g2**2*vu*vL(3)**2 -  & 
&  8*vu*Conjg(REps(1))*REps(1) - 8*vu*Conjg(REps(2))*REps(2) - 8*vu*Conjg(REps(3))*REps(3) -& 
&  4*vL(1)*Beps(1) - 4*vL(2)*Beps(2) - 4*vL(3)*Beps(3))/(8._dp*vu)
mlHd2(1) = -(4*vu*Conjg(Beps(1)) - 8*Tad1Loop(3) + g1**2*vd**2*vL(1) + g2**2*vd**2*vL(1) -       & 
&  g1**2*vu**2*vL(1) - g2**2*vu**2*vL(1) + 8*ml2(1,1)*vL(1) + g1**2*vL(1)**3 +           & 
&  g2**2*vL(1)**3 + 4*ml2(1,2)*vL(2) + 4*ml2(2,1)*vL(2) + g1**2*vL(1)*vL(2)**2 +         & 
&  g2**2*vL(1)*vL(2)**2 + 4*ml2(1,3)*vL(3) + 4*ml2(3,1)*vL(3) + g1**2*vL(1)*vL(3)**2 +   & 
&  g2**2*vL(1)*vL(3)**2 - 4*vd*Conjg(Mu)*REps(1) + 4*Conjg(REps(2))*vL(2)*REps(1) +      & 
&  4*Conjg(REps(3))*vL(3)*REps(1) + Conjg(REps(1))*(-4*vd*Mu + 8*vL(1)*REps(1) +         & 
&  4*vL(2)*REps(2) + 4*vL(3)*REps(3)) + 4*vu*Beps(1))/(8._dp*vd)
mlHd2(2) = -(4*vu*Conjg(Beps(2)) - 8*Tad1Loop(4) + 4*ml2(1,2)*vL(1) + 4*ml2(2,1)*vL(1) +         & 
&  g1**2*vd**2*vL(2) + g2**2*vd**2*vL(2) - g1**2*vu**2*vL(2) - g2**2*vu**2*vL(2) +       & 
&  8*ml2(2,2)*vL(2) + g1**2*vL(1)**2*vL(2) + g2**2*vL(1)**2*vL(2) + g1**2*vL(2)**3 +     & 
&  g2**2*vL(2)**3 + 4*ml2(2,3)*vL(3) + 4*ml2(3,2)*vL(3) + g1**2*vL(2)*vL(3)**2 +         & 
&  g2**2*vL(2)*vL(3)**2 - 4*vd*Conjg(Mu)*REps(2) + 4*Conjg(REps(1))*vL(1)*REps(2) +      & 
&  4*Conjg(REps(3))*vL(3)*REps(2) + Conjg(REps(2))*(-4*vd*Mu + 4*vL(1)*REps(1) +         & 
&  8*vL(2)*REps(2) + 4*vL(3)*REps(3)) + 4*vu*Beps(2))/(8._dp*vd)
mlHd2(3) = -(4*vu*Conjg(Beps(3)) - 8*Tad1Loop(5) + 4*ml2(1,3)*vL(1) + 4*ml2(3,1)*vL(1) +         & 
&  4*ml2(2,3)*vL(2) + 4*ml2(3,2)*vL(2) + g1**2*vd**2*vL(3) + g2**2*vd**2*vL(3) -         & 
&  g1**2*vu**2*vL(3) - g2**2*vu**2*vL(3) + 8*ml2(3,3)*vL(3) + g1**2*vL(1)**2*vL(3) +     & 
&  g2**2*vL(1)**2*vL(3) + g1**2*vL(2)**2*vL(3) + g2**2*vL(2)**2*vL(3) + g1**2*vL(3)**3 + & 
&  g2**2*vL(3)**3 - 4*vd*Conjg(Mu)*REps(3) + 4*Conjg(REps(1))*vL(1)*REps(3) +            & 
&  4*Conjg(REps(2))*vL(2)*REps(3) + Conjg(REps(3))*(-4*vd*Mu + 4*vL(1)*REps(1) +         & 
&  4*vL(2)*REps(2) + 8*vL(3)*REps(3)) + 4*vu*Beps(3))/(8._dp*vd)

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
 If (Real(mlHd2(1),dp).ne.Real(mlHd2(1),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(1)" 
   Call TerminateProgram  
 End If 
 If (Real(mlHd2(2),dp).ne.Real(mlHd2(2),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(2)" 
   Call TerminateProgram  
 End If 
 If (Real(mlHd2(3),dp).ne.Real(mlHd2(3),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(3)" 
   Call TerminateProgram  
 End If 
 Else 
If (SolutionTadpoleNr.eq.1) Then 
mlHd2(1) = -(4*vu*Conjg(Beps(1)) - 8*Tad1Loop(3) + g1**2*vd**2*vL(1) + g2**2*vd**2*vL(1) -       & 
&  g1**2*vu**2*vL(1) - g2**2*vu**2*vL(1) + 8*ml2(1,1)*vL(1) + g1**2*vL(1)**3 +           & 
&  g2**2*vL(1)**3 + 4*ml2(1,2)*vL(2) + 4*ml2(2,1)*vL(2) + g1**2*vL(1)*vL(2)**2 +         & 
&  g2**2*vL(1)*vL(2)**2 + 4*ml2(1,3)*vL(3) + 4*ml2(3,1)*vL(3) + g1**2*vL(1)*vL(3)**2 +   & 
&  g2**2*vL(1)*vL(3)**2 + 4*Conjg(REps(2))*vL(2)*REps(1) + 4*Conjg(REps(3))*vL(3)*REps(1) +& 
&  4*vu*Beps(1) + sqrt(2._dp)*vd*REps(1)*Sqrt((-8*mHd2*vd**2 - g1**2*vd**4 -             & 
&  g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 + 8*vd*Tad1Loop(1) -           & 
&  8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) - 2*g1**2*vu**2*vL(1)**2 -& 
&  2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 +      & 
&  8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) +            & 
&  8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 - 2*g2**2*vu**2*vL(2)**2 +            & 
&  8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 +         & 
&  g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) +   & 
&  8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) +            & 
&  8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 - 2*g2**2*vu**2*vL(3)**2 +            & 
&  8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 +         & 
&  2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 +              & 
&  g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) + & 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2)) +      & 
&  Conjg(REps(1))*(8*vL(1)*REps(1) + 4*vL(2)*REps(2) + 4*vL(3)*REps(3) + sqrt(2._dp)*vd*Sqrt((-& 
& 8*mHd2*vd**2 - g1**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 +  & 
&  8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) -& 
&  2*g1**2*vu**2*vL(1)**2 - 2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 +               & 
&  g1**2*vL(1)**4 + g2**2*vL(1)**4 + 8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) +   & 
&  8*ml2(1,2)*vL(1)*vL(2) + 8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 -            & 
&  2*g2**2*vu**2*vL(2)**2 + 8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 +            & 
&  2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) -& 
&  8*Tad1Loop(5)*vL(3) + 8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) +               & 
&  8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 -            & 
&  2*g2**2*vu**2*vL(3)**2 + 8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 +            & 
&  2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 +   & 
&  g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) +& 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2))))/(8._dp*vd)
mlHd2(2) = -(4*vu*Conjg(Beps(2)) - 8*Tad1Loop(4) + 4*ml2(1,2)*vL(1) + 4*ml2(2,1)*vL(1) +         & 
&  g1**2*vd**2*vL(2) + g2**2*vd**2*vL(2) - g1**2*vu**2*vL(2) - g2**2*vu**2*vL(2) +       & 
&  8*ml2(2,2)*vL(2) + g1**2*vL(1)**2*vL(2) + g2**2*vL(1)**2*vL(2) + g1**2*vL(2)**3 +     & 
&  g2**2*vL(2)**3 + 4*ml2(2,3)*vL(3) + 4*ml2(3,2)*vL(3) + g1**2*vL(2)*vL(3)**2 +         & 
&  g2**2*vL(2)*vL(3)**2 + 4*Conjg(REps(1))*vL(1)*REps(2) + 4*Conjg(REps(3))*vL(3)*REps(2) +& 
&  4*vu*Beps(2) + sqrt(2._dp)*vd*REps(2)*Sqrt((-8*mHd2*vd**2 - g1**2*vd**4 -             & 
&  g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 + 8*vd*Tad1Loop(1) -           & 
&  8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) - 2*g1**2*vu**2*vL(1)**2 -& 
&  2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 +      & 
&  8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) +            & 
&  8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 - 2*g2**2*vu**2*vL(2)**2 +            & 
&  8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 +         & 
&  g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) +   & 
&  8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) +            & 
&  8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 - 2*g2**2*vu**2*vL(3)**2 +            & 
&  8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 +         & 
&  2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 +              & 
&  g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) + & 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2)) +      & 
&  Conjg(REps(2))*(4*vL(1)*REps(1) + 8*vL(2)*REps(2) + 4*vL(3)*REps(3) + sqrt(2._dp)*vd*Sqrt((-& 
& 8*mHd2*vd**2 - g1**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 +  & 
&  8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) -& 
&  2*g1**2*vu**2*vL(1)**2 - 2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 +               & 
&  g1**2*vL(1)**4 + g2**2*vL(1)**4 + 8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) +   & 
&  8*ml2(1,2)*vL(1)*vL(2) + 8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 -            & 
&  2*g2**2*vu**2*vL(2)**2 + 8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 +            & 
&  2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) -& 
&  8*Tad1Loop(5)*vL(3) + 8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) +               & 
&  8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 -            & 
&  2*g2**2*vu**2*vL(3)**2 + 8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 +            & 
&  2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 +   & 
&  g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) +& 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2))))/(8._dp*vd)
mlHd2(3) = -(4*vu*Conjg(Beps(3)) - 8*Tad1Loop(5) + 4*ml2(1,3)*vL(1) + 4*ml2(3,1)*vL(1) +         & 
&  4*ml2(2,3)*vL(2) + 4*ml2(3,2)*vL(2) + g1**2*vd**2*vL(3) + g2**2*vd**2*vL(3) -         & 
&  g1**2*vu**2*vL(3) - g2**2*vu**2*vL(3) + 8*ml2(3,3)*vL(3) + g1**2*vL(1)**2*vL(3) +     & 
&  g2**2*vL(1)**2*vL(3) + g1**2*vL(2)**2*vL(3) + g2**2*vL(2)**2*vL(3) + g1**2*vL(3)**3 + & 
&  g2**2*vL(3)**3 + 4*Conjg(REps(1))*vL(1)*REps(3) + 4*Conjg(REps(2))*vL(2)*REps(3) +    & 
&  4*vu*Beps(3) + sqrt(2._dp)*vd*REps(3)*Sqrt((-8*mHd2*vd**2 - g1**2*vd**4 -             & 
&  g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 + 8*vd*Tad1Loop(1) -           & 
&  8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) - 2*g1**2*vu**2*vL(1)**2 -& 
&  2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 +      & 
&  8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) +            & 
&  8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 - 2*g2**2*vu**2*vL(2)**2 +            & 
&  8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 +         & 
&  g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) +   & 
&  8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) +            & 
&  8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 - 2*g2**2*vu**2*vL(3)**2 +            & 
&  8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 +         & 
&  2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 +              & 
&  g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) + & 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2)) +      & 
&  Conjg(REps(3))*(4*vL(1)*REps(1) + 4*vL(2)*REps(2) + 8*vL(3)*REps(3) + sqrt(2._dp)*vd*Sqrt((-& 
& 8*mHd2*vd**2 - g1**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 +  & 
&  8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) -& 
&  2*g1**2*vu**2*vL(1)**2 - 2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 +               & 
&  g1**2*vL(1)**4 + g2**2*vL(1)**4 + 8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) +   & 
&  8*ml2(1,2)*vL(1)*vL(2) + 8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 -            & 
&  2*g2**2*vu**2*vL(2)**2 + 8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 +            & 
&  2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) -& 
&  8*Tad1Loop(5)*vL(3) + 8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) +               & 
&  8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 -            & 
&  2*g2**2*vu**2*vL(3)**2 + 8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 +            & 
&  2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 +   & 
&  g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) +& 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2))))/(8._dp*vd)
Mu = -Sqrt((-8*mHd2*vd**2 - g1**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 +       & 
&  g2**2*vu**4 + 8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) -       & 
&  8*Tad1Loop(3)*vL(1) - 2*g1**2*vu**2*vL(1)**2 - 2*g2**2*vu**2*vL(1)**2 +               & 
&  8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 + 8*vu*Conjg(Beps(2))*vL(2) -   & 
&  8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) + 8*ml2(2,1)*vL(1)*vL(2) -               & 
&  2*g1**2*vu**2*vL(2)**2 - 2*g2**2*vu**2*vL(2)**2 + 8*ml2(2,2)*vL(2)**2 +               & 
&  2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 +              & 
&  g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) + 8*ml2(1,           & 
& 3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,            & 
& 2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 - 2*g2**2*vu**2*vL(3)**2 + 8*ml2(3,            & 
& 3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 +& 
&  2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) +& 
&  8*Conjg(REps(1))*vL(1)**2*REps(1) + 8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) +            & 
&  8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) + 8*vu**2*Conjg(REps(2))*REps(2) +               & 
&  8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) + 8*Conjg(REps(2))*vL(2)**2*REps(2) +            & 
&  8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) + 8*vu**2*Conjg(REps(3))*REps(3) +               & 
&  8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) + 8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) +         & 
&  8*Conjg(REps(3))*vL(3)**2*REps(3) + 8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) +         & 
&  8*vu*vL(3)*Beps(3))/(vd**2 - vu**2))/(2._dp*sqrt(2._dp))
Bmu = (-8*mHd2*vd**2*vu + 8*mHu2*vd**2*vu - 2*g1**2*vd**4*vu - 2*g2**2*vd**4*vu +           & 
&  2*g1**2*vd**2*vu**3 + 2*g2**2*vd**2*vu**3 + 8*vd*vu*Tad1Loop(1) - 8*vd**2*Tad1Loop(2) +& 
&  4*(vd**2 + vu**2)*Conjg(Beps(1))*vL(1) - 8*vu*Tad1Loop(3)*vL(1) - g1**2*vd**2*vu*vL(1)**2 -& 
&  g2**2*vd**2*vu*vL(1)**2 - g1**2*vu**3*vL(1)**2 - g2**2*vu**3*vL(1)**2 +               & 
&  8*vu*ml2(1,1)*vL(1)**2 + g1**2*vu*vL(1)**4 + g2**2*vu*vL(1)**4 + 4*(vd**2 +           & 
&  vu**2)*Conjg(Beps(2))*vL(2) - 8*vu*Tad1Loop(4)*vL(2) + 8*vu*ml2(1,2)*vL(1)*vL(2) +    & 
&  8*vu*ml2(2,1)*vL(1)*vL(2) - g1**2*vd**2*vu*vL(2)**2 - g2**2*vd**2*vu*vL(2)**2 -       & 
&  g1**2*vu**3*vL(2)**2 - g2**2*vu**3*vL(2)**2 + 8*vu*ml2(2,2)*vL(2)**2 + 2*g1**2*vu*vL(1)**2*vL(2)**2 +& 
&  2*g2**2*vu*vL(1)**2*vL(2)**2 + g1**2*vu*vL(2)**4 + g2**2*vu*vL(2)**4 + 4*vd**2*Conjg(Beps(3))*vL(3) +& 
&  4*vu**2*Conjg(Beps(3))*vL(3) - 8*vu*Tad1Loop(5)*vL(3) + 8*vu*ml2(1,3)*vL(1)*vL(3) +   & 
&  8*vu*ml2(3,1)*vL(1)*vL(3) + 8*vu*ml2(2,3)*vL(2)*vL(3) + 8*vu*ml2(3,2)*vL(2)*vL(3) -   & 
&  g1**2*vd**2*vu*vL(3)**2 - g2**2*vd**2*vu*vL(3)**2 - g1**2*vu**3*vL(3)**2 -            & 
&  g2**2*vu**3*vL(3)**2 + 8*vu*ml2(3,3)*vL(3)**2 + 2*g1**2*vu*vL(1)**2*vL(3)**2 +        & 
&  2*g2**2*vu*vL(1)**2*vL(3)**2 + 2*g1**2*vu*vL(2)**2*vL(3)**2 + 2*g2**2*vu*vL(2)**2*vL(3)**2 +& 
&  g1**2*vu*vL(3)**4 + g2**2*vu*vL(3)**4 + 8*vd**2*vu*Conjg(REps(1))*REps(1) +           & 
&  8*vu*Conjg(REps(1))*vL(1)**2*REps(1) + 8*vu*Conjg(REps(2))*vL(1)*vL(2)*REps(1) +      & 
&  8*vu*Conjg(REps(3))*vL(1)*vL(3)*REps(1) + 8*vd**2*vu*Conjg(REps(2))*REps(2) +         & 
&  8*vu*Conjg(REps(1))*vL(1)*vL(2)*REps(2) + 8*vu*Conjg(REps(2))*vL(2)**2*REps(2) +      & 
&  8*vu*Conjg(REps(3))*vL(2)*vL(3)*REps(2) + 8*vd**2*vu*Conjg(REps(3))*REps(3) +         & 
&  8*vu*Conjg(REps(1))*vL(1)*vL(3)*REps(3) + 8*vu*Conjg(REps(2))*vL(2)*vL(3)*REps(3) +   & 
&  8*vu*Conjg(REps(3))*vL(3)**2*REps(3) + 4*vd**2*vL(1)*Beps(1) + 4*vu**2*vL(1)*Beps(1) +& 
&  4*vd**2*vL(2)*Beps(2) + 4*vu**2*vL(2)*Beps(2) + 4*vd**2*vL(3)*Beps(3) +               & 
&  4*vu**2*vL(3)*Beps(3))/(8._dp*(vd**3 - vd*vu**2))
If (Real(mlHd2(1),dp).ne.Real(mlHd2(1),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(1)" 
   Call TerminateProgram  
 End If 
 If (Real(mlHd2(2),dp).ne.Real(mlHd2(2),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(2)" 
   Call TerminateProgram  
 End If 
 If (Real(mlHd2(3),dp).ne.Real(mlHd2(3),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(3)" 
   Call TerminateProgram  
 End If 
 If (Real(Mu,dp).ne.Real(Mu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Mu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Mu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Mu" 
   Mu = Real(Mu,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(Bmu,dp).ne.Real(Bmu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Bmu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Bmu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Bmu" 
   Bmu = Real(Bmu,dp) 
  SignOfMuChanged= .True. 
End If 
 Else If (SolutionTadpoleNr.eq.2) Then 
mlHd2(1) = -(4*vu*Conjg(Beps(1)) - 8*Tad1Loop(3) + g1**2*vd**2*vL(1) + g2**2*vd**2*vL(1) -       & 
&  g1**2*vu**2*vL(1) - g2**2*vu**2*vL(1) + 8*ml2(1,1)*vL(1) + g1**2*vL(1)**3 +           & 
&  g2**2*vL(1)**3 + 4*ml2(1,2)*vL(2) + 4*ml2(2,1)*vL(2) + g1**2*vL(1)*vL(2)**2 +         & 
&  g2**2*vL(1)*vL(2)**2 + 4*ml2(1,3)*vL(3) + 4*ml2(3,1)*vL(3) + g1**2*vL(1)*vL(3)**2 +   & 
&  g2**2*vL(1)*vL(3)**2 + 4*Conjg(REps(2))*vL(2)*REps(1) + 4*Conjg(REps(3))*vL(3)*REps(1) +& 
&  4*vu*Beps(1) - sqrt(2._dp)*vd*REps(1)*Sqrt((-8*mHd2*vd**2 - g1**2*vd**4 -             & 
&  g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 + 8*vd*Tad1Loop(1) -           & 
&  8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) - 2*g1**2*vu**2*vL(1)**2 -& 
&  2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 +      & 
&  8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) +            & 
&  8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 - 2*g2**2*vu**2*vL(2)**2 +            & 
&  8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 +         & 
&  g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) +   & 
&  8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) +            & 
&  8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 - 2*g2**2*vu**2*vL(3)**2 +            & 
&  8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 +         & 
&  2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 +              & 
&  g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) + & 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2)) +      & 
&  Conjg(REps(1))*(8*vL(1)*REps(1) + 4*vL(2)*REps(2) + 4*vL(3)*REps(3) - sqrt(2._dp)*vd*Sqrt((-& 
& 8*mHd2*vd**2 - g1**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 +  & 
&  8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) -& 
&  2*g1**2*vu**2*vL(1)**2 - 2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 +               & 
&  g1**2*vL(1)**4 + g2**2*vL(1)**4 + 8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) +   & 
&  8*ml2(1,2)*vL(1)*vL(2) + 8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 -            & 
&  2*g2**2*vu**2*vL(2)**2 + 8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 +            & 
&  2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) -& 
&  8*Tad1Loop(5)*vL(3) + 8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) +               & 
&  8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 -            & 
&  2*g2**2*vu**2*vL(3)**2 + 8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 +            & 
&  2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 +   & 
&  g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) +& 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2))))/(8._dp*vd)
mlHd2(2) = -(4*vu*Conjg(Beps(2)) - 8*Tad1Loop(4) + 4*ml2(1,2)*vL(1) + 4*ml2(2,1)*vL(1) +         & 
&  g1**2*vd**2*vL(2) + g2**2*vd**2*vL(2) - g1**2*vu**2*vL(2) - g2**2*vu**2*vL(2) +       & 
&  8*ml2(2,2)*vL(2) + g1**2*vL(1)**2*vL(2) + g2**2*vL(1)**2*vL(2) + g1**2*vL(2)**3 +     & 
&  g2**2*vL(2)**3 + 4*ml2(2,3)*vL(3) + 4*ml2(3,2)*vL(3) + g1**2*vL(2)*vL(3)**2 +         & 
&  g2**2*vL(2)*vL(3)**2 + 4*Conjg(REps(1))*vL(1)*REps(2) + 4*Conjg(REps(3))*vL(3)*REps(2) +& 
&  4*vu*Beps(2) - sqrt(2._dp)*vd*REps(2)*Sqrt((-8*mHd2*vd**2 - g1**2*vd**4 -             & 
&  g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 + 8*vd*Tad1Loop(1) -           & 
&  8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) - 2*g1**2*vu**2*vL(1)**2 -& 
&  2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 +      & 
&  8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) +            & 
&  8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 - 2*g2**2*vu**2*vL(2)**2 +            & 
&  8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 +         & 
&  g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) +   & 
&  8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) +            & 
&  8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 - 2*g2**2*vu**2*vL(3)**2 +            & 
&  8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 +         & 
&  2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 +              & 
&  g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) + & 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2)) +      & 
&  Conjg(REps(2))*(4*vL(1)*REps(1) + 8*vL(2)*REps(2) + 4*vL(3)*REps(3) - sqrt(2._dp)*vd*Sqrt((-& 
& 8*mHd2*vd**2 - g1**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 +  & 
&  8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) -& 
&  2*g1**2*vu**2*vL(1)**2 - 2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 +               & 
&  g1**2*vL(1)**4 + g2**2*vL(1)**4 + 8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) +   & 
&  8*ml2(1,2)*vL(1)*vL(2) + 8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 -            & 
&  2*g2**2*vu**2*vL(2)**2 + 8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 +            & 
&  2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) -& 
&  8*Tad1Loop(5)*vL(3) + 8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) +               & 
&  8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 -            & 
&  2*g2**2*vu**2*vL(3)**2 + 8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 +            & 
&  2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 +   & 
&  g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) +& 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2))))/(8._dp*vd)
mlHd2(3) = -(4*vu*Conjg(Beps(3)) - 8*Tad1Loop(5) + 4*ml2(1,3)*vL(1) + 4*ml2(3,1)*vL(1) +         & 
&  4*ml2(2,3)*vL(2) + 4*ml2(3,2)*vL(2) + g1**2*vd**2*vL(3) + g2**2*vd**2*vL(3) -         & 
&  g1**2*vu**2*vL(3) - g2**2*vu**2*vL(3) + 8*ml2(3,3)*vL(3) + g1**2*vL(1)**2*vL(3) +     & 
&  g2**2*vL(1)**2*vL(3) + g1**2*vL(2)**2*vL(3) + g2**2*vL(2)**2*vL(3) + g1**2*vL(3)**3 + & 
&  g2**2*vL(3)**3 + 4*Conjg(REps(1))*vL(1)*REps(3) + 4*Conjg(REps(2))*vL(2)*REps(3) +    & 
&  4*vu*Beps(3) - sqrt(2._dp)*vd*REps(3)*Sqrt((-8*mHd2*vd**2 - g1**2*vd**4 -             & 
&  g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 + 8*vd*Tad1Loop(1) -           & 
&  8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) - 2*g1**2*vu**2*vL(1)**2 -& 
&  2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 +      & 
&  8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) +            & 
&  8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 - 2*g2**2*vu**2*vL(2)**2 +            & 
&  8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 +         & 
&  g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) +   & 
&  8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) +            & 
&  8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 - 2*g2**2*vu**2*vL(3)**2 +            & 
&  8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 +         & 
&  2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 +              & 
&  g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) + & 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2)) +      & 
&  Conjg(REps(3))*(4*vL(1)*REps(1) + 4*vL(2)*REps(2) + 8*vL(3)*REps(3) - sqrt(2._dp)*vd*Sqrt((-& 
& 8*mHd2*vd**2 - g1**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 + g2**2*vu**4 +  & 
&  8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) - 8*Tad1Loop(3)*vL(1) -& 
&  2*g1**2*vu**2*vL(1)**2 - 2*g2**2*vu**2*vL(1)**2 + 8*ml2(1,1)*vL(1)**2 +               & 
&  g1**2*vL(1)**4 + g2**2*vL(1)**4 + 8*vu*Conjg(Beps(2))*vL(2) - 8*Tad1Loop(4)*vL(2) +   & 
&  8*ml2(1,2)*vL(1)*vL(2) + 8*ml2(2,1)*vL(1)*vL(2) - 2*g1**2*vu**2*vL(2)**2 -            & 
&  2*g2**2*vu**2*vL(2)**2 + 8*ml2(2,2)*vL(2)**2 + 2*g1**2*vL(1)**2*vL(2)**2 +            & 
&  2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 + g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) -& 
&  8*Tad1Loop(5)*vL(3) + 8*ml2(1,3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) +               & 
&  8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 -            & 
&  2*g2**2*vu**2*vL(3)**2 + 8*ml2(3,3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 +            & 
&  2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 + 2*g2**2*vL(2)**2*vL(3)**2 +   & 
&  g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) + 8*Conjg(REps(1))*vL(1)**2*REps(1) +& 
&  8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) + 8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) +         & 
&  8*vu**2*Conjg(REps(2))*REps(2) + 8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) +               & 
&  8*Conjg(REps(2))*vL(2)**2*REps(2) + 8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) +            & 
&  8*vu**2*Conjg(REps(3))*REps(3) + 8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) +               & 
&  8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) + 8*Conjg(REps(3))*vL(3)**2*REps(3) +            & 
&  8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) + 8*vu*vL(3)*Beps(3))/(vd**2 - vu**2))))/(8._dp*vd)
Mu = Sqrt((-8*mHd2*vd**2 - g1**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + g1**2*vu**4 +        & 
&  g2**2*vu**4 + 8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2) + 8*vu*Conjg(Beps(1))*vL(1) -       & 
&  8*Tad1Loop(3)*vL(1) - 2*g1**2*vu**2*vL(1)**2 - 2*g2**2*vu**2*vL(1)**2 +               & 
&  8*ml2(1,1)*vL(1)**2 + g1**2*vL(1)**4 + g2**2*vL(1)**4 + 8*vu*Conjg(Beps(2))*vL(2) -   & 
&  8*Tad1Loop(4)*vL(2) + 8*ml2(1,2)*vL(1)*vL(2) + 8*ml2(2,1)*vL(1)*vL(2) -               & 
&  2*g1**2*vu**2*vL(2)**2 - 2*g2**2*vu**2*vL(2)**2 + 8*ml2(2,2)*vL(2)**2 +               & 
&  2*g1**2*vL(1)**2*vL(2)**2 + 2*g2**2*vL(1)**2*vL(2)**2 + g1**2*vL(2)**4 +              & 
&  g2**2*vL(2)**4 + 8*vu*Conjg(Beps(3))*vL(3) - 8*Tad1Loop(5)*vL(3) + 8*ml2(1,           & 
& 3)*vL(1)*vL(3) + 8*ml2(3,1)*vL(1)*vL(3) + 8*ml2(2,3)*vL(2)*vL(3) + 8*ml2(3,            & 
& 2)*vL(2)*vL(3) - 2*g1**2*vu**2*vL(3)**2 - 2*g2**2*vu**2*vL(3)**2 + 8*ml2(3,            & 
& 3)*vL(3)**2 + 2*g1**2*vL(1)**2*vL(3)**2 + 2*g2**2*vL(1)**2*vL(3)**2 + 2*g1**2*vL(2)**2*vL(3)**2 +& 
&  2*g2**2*vL(2)**2*vL(3)**2 + g1**2*vL(3)**4 + g2**2*vL(3)**4 + 8*vu**2*Conjg(REps(1))*REps(1) +& 
&  8*Conjg(REps(1))*vL(1)**2*REps(1) + 8*Conjg(REps(2))*vL(1)*vL(2)*REps(1) +            & 
&  8*Conjg(REps(3))*vL(1)*vL(3)*REps(1) + 8*vu**2*Conjg(REps(2))*REps(2) +               & 
&  8*Conjg(REps(1))*vL(1)*vL(2)*REps(2) + 8*Conjg(REps(2))*vL(2)**2*REps(2) +            & 
&  8*Conjg(REps(3))*vL(2)*vL(3)*REps(2) + 8*vu**2*Conjg(REps(3))*REps(3) +               & 
&  8*Conjg(REps(1))*vL(1)*vL(3)*REps(3) + 8*Conjg(REps(2))*vL(2)*vL(3)*REps(3) +         & 
&  8*Conjg(REps(3))*vL(3)**2*REps(3) + 8*vu*vL(1)*Beps(1) + 8*vu*vL(2)*Beps(2) +         & 
&  8*vu*vL(3)*Beps(3))/(vd**2 - vu**2))/(2._dp*sqrt(2._dp))
Bmu = (-8*mHd2*vd**2*vu + 8*mHu2*vd**2*vu - 2*g1**2*vd**4*vu - 2*g2**2*vd**4*vu +           & 
&  2*g1**2*vd**2*vu**3 + 2*g2**2*vd**2*vu**3 + 8*vd*vu*Tad1Loop(1) - 8*vd**2*Tad1Loop(2) +& 
&  4*(vd**2 + vu**2)*Conjg(Beps(1))*vL(1) - 8*vu*Tad1Loop(3)*vL(1) - g1**2*vd**2*vu*vL(1)**2 -& 
&  g2**2*vd**2*vu*vL(1)**2 - g1**2*vu**3*vL(1)**2 - g2**2*vu**3*vL(1)**2 +               & 
&  8*vu*ml2(1,1)*vL(1)**2 + g1**2*vu*vL(1)**4 + g2**2*vu*vL(1)**4 + 4*(vd**2 +           & 
&  vu**2)*Conjg(Beps(2))*vL(2) - 8*vu*Tad1Loop(4)*vL(2) + 8*vu*ml2(1,2)*vL(1)*vL(2) +    & 
&  8*vu*ml2(2,1)*vL(1)*vL(2) - g1**2*vd**2*vu*vL(2)**2 - g2**2*vd**2*vu*vL(2)**2 -       & 
&  g1**2*vu**3*vL(2)**2 - g2**2*vu**3*vL(2)**2 + 8*vu*ml2(2,2)*vL(2)**2 + 2*g1**2*vu*vL(1)**2*vL(2)**2 +& 
&  2*g2**2*vu*vL(1)**2*vL(2)**2 + g1**2*vu*vL(2)**4 + g2**2*vu*vL(2)**4 + 4*vd**2*Conjg(Beps(3))*vL(3) +& 
&  4*vu**2*Conjg(Beps(3))*vL(3) - 8*vu*Tad1Loop(5)*vL(3) + 8*vu*ml2(1,3)*vL(1)*vL(3) +   & 
&  8*vu*ml2(3,1)*vL(1)*vL(3) + 8*vu*ml2(2,3)*vL(2)*vL(3) + 8*vu*ml2(3,2)*vL(2)*vL(3) -   & 
&  g1**2*vd**2*vu*vL(3)**2 - g2**2*vd**2*vu*vL(3)**2 - g1**2*vu**3*vL(3)**2 -            & 
&  g2**2*vu**3*vL(3)**2 + 8*vu*ml2(3,3)*vL(3)**2 + 2*g1**2*vu*vL(1)**2*vL(3)**2 +        & 
&  2*g2**2*vu*vL(1)**2*vL(3)**2 + 2*g1**2*vu*vL(2)**2*vL(3)**2 + 2*g2**2*vu*vL(2)**2*vL(3)**2 +& 
&  g1**2*vu*vL(3)**4 + g2**2*vu*vL(3)**4 + 8*vd**2*vu*Conjg(REps(1))*REps(1) +           & 
&  8*vu*Conjg(REps(1))*vL(1)**2*REps(1) + 8*vu*Conjg(REps(2))*vL(1)*vL(2)*REps(1) +      & 
&  8*vu*Conjg(REps(3))*vL(1)*vL(3)*REps(1) + 8*vd**2*vu*Conjg(REps(2))*REps(2) +         & 
&  8*vu*Conjg(REps(1))*vL(1)*vL(2)*REps(2) + 8*vu*Conjg(REps(2))*vL(2)**2*REps(2) +      & 
&  8*vu*Conjg(REps(3))*vL(2)*vL(3)*REps(2) + 8*vd**2*vu*Conjg(REps(3))*REps(3) +         & 
&  8*vu*Conjg(REps(1))*vL(1)*vL(3)*REps(3) + 8*vu*Conjg(REps(2))*vL(2)*vL(3)*REps(3) +   & 
&  8*vu*Conjg(REps(3))*vL(3)**2*REps(3) + 4*vd**2*vL(1)*Beps(1) + 4*vu**2*vL(1)*Beps(1) +& 
&  4*vd**2*vL(2)*Beps(2) + 4*vu**2*vL(2)*Beps(2) + 4*vd**2*vL(3)*Beps(3) +               & 
&  4*vu**2*vL(3)*Beps(3))/(8._dp*(vd**3 - vd*vu**2))
If (Real(mlHd2(1),dp).ne.Real(mlHd2(1),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(1)" 
   Call TerminateProgram  
 End If 
 If (Real(mlHd2(2),dp).ne.Real(mlHd2(2),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(2)" 
   Call TerminateProgram  
 End If 
 If (Real(mlHd2(3),dp).ne.Real(mlHd2(3),dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mlHd2(3)" 
   Call TerminateProgram  
 End If 
 If (Real(Mu,dp).ne.Real(Mu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Mu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Mu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Mu" 
   Mu = Real(Mu,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(Bmu,dp).ne.Real(Bmu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Bmu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Bmu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Bmu" 
   Bmu = Real(Bmu,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,             & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,Tad1Loop,            & 
& TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Complex(dp), Intent(in) :: Tad1Loop(5)

Real(dp), Intent(out) :: TadpoleValues(5)

TadpoleValues(1) = Real(-Tad1Loop(1) + (8*mHd2*vd + g1**2*vd**3 + g2**2*vd**3 - 8*Bmu*vu - g1**2*vd*vu**2 - g2**2*vd*vu**2 + 8*vd*Mu**2 - 4*Mu*(Conjg(REps(1))& 
& *vL(1) + Conjg(REps(2))*vL(2) + Conjg(REps(3))*vL(3)) + 8*(mlHd2(1)*vL(1)              & 
&  + mlHd2(2)*vL(2) + mlHd2(3)*vL(3)) + g1**2*vd*(vL(1)**2 + vL(2)**2 + vL(3)            & 
& **2) + g2**2*vd*(vL(1)**2 + vL(2)**2 + vL(3)**2) - 4*Mu*(vL(1)*REps(1) + vL(2)         & 
& *REps(2) + vL(3)*REps(3)))/8._dp,dp) 
TadpoleValues(2) = Real(-Tad1Loop(2) + (-8*Bmu*vd + 8*mHu2*vu - g1**2*vd**2*vu - g2**2*vd**2*vu + g1**2*vu**3 + g2**2*vu**3 + 8*vu*Mu**2 + 4*(Conjg(Beps(1))& 
& *vL(1) + Conjg(Beps(2))*vL(2) + Conjg(Beps(3))*vL(3)) - g1**2*vu*(vL(1)**2 + vL(2)     & 
& **2 + vL(3)**2) - g2**2*vu*(vL(1)**2 + vL(2)**2 + vL(3)**2) + 8*vu*(Conjg(REps(1))     & 
& *REps(1) + Conjg(REps(2))*REps(2) + Conjg(REps(3))*REps(3)) + 4*(vL(1)*Beps(1)         & 
&  + vL(2)*Beps(2) + vL(3)*Beps(3)))/8._dp,dp) 
TadpoleValues(3) = Real(-Tad1Loop(3) + (-4*vd*Mu*Conjg(REps(1)) + 4*vu*Conjg(Beps(1)) & 
&  + 8*vd*mlHd2(1) + g1**2*vd**2*vL(1) + g2**2*vd**2*vL(1) - g1**2*vu**2*vL(1)           & 
&  - g2**2*vu**2*vL(1) + 4*(ml2(1,1)*vL(1) + ml2(1,2)*vL(2) + ml2(1,3)*vL(3))            & 
&  + 4*(ml2(1,1)*vL(1) + ml2(2,1)*vL(2) + ml2(3,1)*vL(3)) + g1**2*vL(1)*(vL(1)           & 
& **2 + vL(2)**2 + vL(3)**2) + g2**2*vL(1)*(vL(1)**2 + vL(2)**2 + vL(3)**2)              & 
&  - 4*vd*Mu*REps(1) + 4*(Conjg(REps(1))*vL(1) + Conjg(REps(2))*vL(2) + Conjg(REps(3))   & 
& *vL(3))*REps(1) + 4*Conjg(REps(1))*(vL(1)*REps(1) + vL(2)*REps(2) + vL(3)              & 
& *REps(3)) + 4*vu*Beps(1))/8._dp,dp) 
TadpoleValues(4) = Real(-Tad1Loop(4) + (-4*vd*Mu*Conjg(REps(2)) + 4*vu*Conjg(Beps(2)) & 
&  + 8*vd*mlHd2(2) + g1**2*vd**2*vL(2) + g2**2*vd**2*vL(2) - g1**2*vu**2*vL(2)           & 
&  - g2**2*vu**2*vL(2) + 4*(ml2(2,1)*vL(1) + ml2(2,2)*vL(2) + ml2(2,3)*vL(3))            & 
&  + 4*(ml2(1,2)*vL(1) + ml2(2,2)*vL(2) + ml2(3,2)*vL(3)) + g1**2*vL(2)*(vL(1)           & 
& **2 + vL(2)**2 + vL(3)**2) + g2**2*vL(2)*(vL(1)**2 + vL(2)**2 + vL(3)**2)              & 
&  - 4*vd*Mu*REps(2) + 4*(Conjg(REps(1))*vL(1) + Conjg(REps(2))*vL(2) + Conjg(REps(3))   & 
& *vL(3))*REps(2) + 4*Conjg(REps(2))*(vL(1)*REps(1) + vL(2)*REps(2) + vL(3)              & 
& *REps(3)) + 4*vu*Beps(2))/8._dp,dp) 
TadpoleValues(5) = Real(-Tad1Loop(5) + (-4*vd*Mu*Conjg(REps(3)) + 4*vu*Conjg(Beps(3)) & 
&  + 8*vd*mlHd2(3) + g1**2*vd**2*vL(3) + g2**2*vd**2*vL(3) - g1**2*vu**2*vL(3)           & 
&  - g2**2*vu**2*vL(3) + 4*(ml2(1,3)*vL(1) + ml2(2,3)*vL(2) + ml2(3,3)*vL(3))            & 
&  + 4*(ml2(3,1)*vL(1) + ml2(3,2)*vL(2) + ml2(3,3)*vL(3)) + g1**2*vL(3)*(vL(1)           & 
& **2 + vL(2)**2 + vL(3)**2) + g2**2*vL(3)*(vL(1)**2 + vL(2)**2 + vL(3)**2)              & 
&  - 4*vd*Mu*REps(3) + 4*(Conjg(REps(1))*vL(1) + Conjg(REps(2))*vL(2) + Conjg(REps(3))   & 
& *vL(3))*REps(3) + 4*Conjg(REps(3))*(vL(1)*REps(1) + vL(2)*REps(2) + vL(3)              & 
& *REps(3)) + 4*vu*Beps(3))/8._dp,dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_MSSMLV 
 
