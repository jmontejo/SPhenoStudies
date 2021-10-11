! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:49 on 24.8.2021   
! ----------------------------------------------------------------------  
 
 
Module RGEs_MSSMLV 
 
Use Control 
Use Settings 
Use Model_Data_MSSMLV 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters444(g,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,               & 
& T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3)

Implicit None 
Real(dp), Intent(in) :: g(444) 
Real(dp),Intent(out) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters444' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+4), g(SumI+5), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+22), g(SumI+23), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
L1(i1,i2,i3) = Cmplx( g(SumI+40), g(SumI+41), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
L2(i1,i2,i3) = Cmplx( g(SumI+94), g(SumI+95), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+148), g(SumI+149), dp) 
End Do 
 End Do 
 
Mu= Cmplx(g(166),g(167),dp) 
Do i1 = 1,3
SumI = (i1-1) 
SumI = SumI*2 
REps(i1) = Cmplx( g(SumI+168), g(SumI+169), dp) 
End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Td(i1,i2) = Cmplx( g(SumI+174), g(SumI+175), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Te(i1,i2) = Cmplx( g(SumI+192), g(SumI+193), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
T1(i1,i2,i3) = Cmplx( g(SumI+210), g(SumI+211), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
T2(i1,i2,i3) = Cmplx( g(SumI+264), g(SumI+265), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tu(i1,i2) = Cmplx( g(SumI+318), g(SumI+319), dp) 
End Do 
 End Do 
 
Bmu= Cmplx(g(336),g(337),dp) 
Do i1 = 1,3
SumI = (i1-1) 
SumI = SumI*2 
Beps(i1) = Cmplx( g(SumI+338), g(SumI+339), dp) 
End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mq2(i1,i2) = Cmplx( g(SumI+344), g(SumI+345), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
ml2(i1,i2) = Cmplx( g(SumI+362), g(SumI+363), dp) 
End Do 
 End Do 
 
mHd2= g(380) 
mHu2= g(381) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
md2(i1,i2) = Cmplx( g(SumI+382), g(SumI+383), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mu2(i1,i2) = Cmplx( g(SumI+400), g(SumI+401), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
me2(i1,i2) = Cmplx( g(SumI+418), g(SumI+419), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
SumI = (i1-1) 
mlHd2(i1) =  g(SumI+436) 
End Do 
 
M1= Cmplx(g(439),g(440),dp) 
M2= Cmplx(g(441),g(442),dp) 
M3= Cmplx(g(443),g(444),dp) 
Do i1=1,444 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters444

Subroutine ParametersToG444(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,              & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,g)

Implicit None 
Real(dp), Intent(out) :: g(444) 
Real(dp), Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3)

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG444' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+4) = Real(Yd(i1,i2), dp) 
g(SumI+5) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+22) = Real(Ye(i1,i2), dp) 
g(SumI+23) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+40) = Real(L1(i1,i2,i3), dp) 
g(SumI+41) = Aimag(L1(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+94) = Real(L2(i1,i2,i3), dp) 
g(SumI+95) = Aimag(L2(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+148) = Real(Yu(i1,i2), dp) 
g(SumI+149) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

g(166) = Real(Mu,dp)  
g(167) = Aimag(Mu)  
Do i1 = 1,3
SumI = (i1-1) 
SumI = SumI*2 
g(SumI+168) = Real(REps(i1), dp) 
g(SumI+169) = Aimag(REps(i1)) 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+174) = Real(Td(i1,i2), dp) 
g(SumI+175) = Aimag(Td(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+192) = Real(Te(i1,i2), dp) 
g(SumI+193) = Aimag(Te(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+210) = Real(T1(i1,i2,i3), dp) 
g(SumI+211) = Aimag(T1(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+264) = Real(T2(i1,i2,i3), dp) 
g(SumI+265) = Aimag(T2(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+318) = Real(Tu(i1,i2), dp) 
g(SumI+319) = Aimag(Tu(i1,i2)) 
End Do 
End Do 

g(336) = Real(Bmu,dp)  
g(337) = Aimag(Bmu)  
Do i1 = 1,3
SumI = (i1-1) 
SumI = SumI*2 
g(SumI+338) = Real(Beps(i1), dp) 
g(SumI+339) = Aimag(Beps(i1)) 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+344) = Real(mq2(i1,i2), dp) 
g(SumI+345) = Aimag(mq2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+362) = Real(ml2(i1,i2), dp) 
g(SumI+363) = Aimag(ml2(i1,i2)) 
End Do 
End Do 

g(380) = mHd2  
g(381) = mHu2  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+382) = Real(md2(i1,i2), dp) 
g(SumI+383) = Aimag(md2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+400) = Real(mu2(i1,i2), dp) 
g(SumI+401) = Aimag(mu2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+418) = Real(me2(i1,i2), dp) 
g(SumI+419) = Aimag(me2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
SumI = (i1-1) 
g(SumI+436) = mlHd2(i1) 
End Do 

g(439) = Real(M1,dp)  
g(440) = Aimag(M1)  
g(441) = Real(M2,dp)  
g(442) = Aimag(M2)  
g(443) = Real(M3,dp)  
g(444) = Aimag(M3)  
Iname = Iname - 1 
 
End Subroutine ParametersToG444

Subroutine rge444(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,mHd2,betamHd21,betamHd22,DmHd2,mHu2,betamHu21,betamHu22,DmHu2,mlHd2(3)             & 
& ,betamlHd21(3),betamlHd22(3),DmlHd2(3)
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),L1(3,3,3),betaL11(3,3,3),               & 
& betaL12(3,3,3),DL1(3,3,3),L2(3,3,3),betaL21(3,3,3),betaL22(3,3,3),DL2(3,3,3)           & 
& ,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Mu,betaMu1,betaMu2,             & 
& DMu,REps(3),betaREps1(3),betaREps2(3),DREps(3),Td(3,3),betaTd1(3,3),betaTd2(3,3)       & 
& ,DTd(3,3),adjTd(3,3),Te(3,3),betaTe1(3,3),betaTe2(3,3),DTe(3,3),adjTe(3,3)             & 
& ,T1(3,3,3),betaT11(3,3,3),betaT12(3,3,3),DT1(3,3,3),T2(3,3,3),betaT21(3,3,3)           & 
& ,betaT22(3,3,3),DT2(3,3,3),Tu(3,3),betaTu1(3,3),betaTu2(3,3),DTu(3,3),adjTu(3,3)       & 
& ,Bmu,betaBmu1,betaBmu2,DBmu,Beps(3),betaBeps1(3),betaBeps2(3),DBeps(3),mq2(3,3)        & 
& ,betamq21(3,3),betamq22(3,3),Dmq2(3,3),ml2(3,3),betaml21(3,3),betaml22(3,3)            & 
& ,Dml2(3,3),md2(3,3),betamd21(3,3),betamd22(3,3),Dmd2(3,3),mu2(3,3),betamu21(3,3)       & 
& ,betamu22(3,3),Dmu2(3,3),me2(3,3),betame21(3,3),betame22(3,3),Dme2(3,3),               & 
& M1,betaM11,betaM12,DM1,M2,betaM21,betaM22,DM2,M3,betaM31,betaM32,DM3
Real(dp) :: Tr1(3),Tr2(3),Tr3(3) 
Real(dp) :: Tr2U1(3,3) 
Real(dp) :: AbsM1,AbsM2,AbsM3
Complex(dp) :: md2Yd(3,3),me2Ye(3,3),ml2adjYe(3,3),ml2CL11(3,3),ml2CL12(3,3),ml2CL13(3,3),           & 
& mq2adjYd(3,3),mq2adjYu(3,3),mq2adjL21(3,3),mq2adjL22(3,3),mq2adjL23(3,3),              & 
& mu2Yu(3,3),Ydmq2(3,3),YdadjYd(3,3),YdadjL21(3,3),YdadjL22(3,3),YdadjL23(3,3),          & 
& Yeml2(3,3),YeadjYe(3,3),YeCL11(3,3),YeCL12(3,3),YeCL13(3,3),Yumq2(3,3),YuadjYu(3,3),   & 
& adjYdmd2(3,3),adjYdYd(3,3),adjYdTd(3,3),adjYeme2(3,3),adjYeYe(3,3),adjYeTe(3,3),       & 
& adjYumu2(3,3),adjYuYu(3,3),adjYuTu(3,3),adjL21mlHd2(3),adjL21REps(3),adjL21Beps(3),    & 
& adjL21L11(3,3),adjL21L12(3,3),adjL21L13(3,3),adjL21L21(3,3),adjL21L22(3,3),            & 
& adjL21L23(3,3),adjL21T11(3,3),adjL21T12(3,3),adjL21T13(3,3),adjL21T21(3,3),            & 
& adjL21T22(3,3),adjL21T23(3,3),adjL22mlHd2(3),adjL22REps(3),adjL22Beps(3),              & 
& adjL22L11(3,3),adjL22L12(3,3),adjL22L13(3,3),adjL22L21(3,3),adjL22L22(3,3),            & 
& adjL22L23(3,3),adjL22T11(3,3),adjL22T12(3,3),adjL22T13(3,3),adjL22T21(3,3),            & 
& adjL22T22(3,3),adjL22T23(3,3),adjL23mlHd2(3),adjL23REps(3),adjL23Beps(3),              & 
& adjL23L11(3,3),adjL23L12(3,3),adjL23L13(3,3),adjL23L21(3,3),adjL23L22(3,3),            & 
& adjL23L23(3,3),adjL23T11(3,3),adjL23T12(3,3),adjL23T13(3,3),adjL23T21(3,3),            & 
& adjL23T22(3,3),adjL23T23(3,3),adjTdTd(3,3),adjTeTe(3,3),adjTuTu(3,3),adjT21T21(3,3),   & 
& adjT22T22(3,3),adjT23T23(3,3),Cml2L11(3,3),Cml2L12(3,3),Cml2L13(3,3),Cml2L21(3,3),     & 
& Cml2L22(3,3),Cml2L23(3,3),Cmq2TpL21(3,3),Cmq2TpL22(3,3),Cmq2TpL23(3,3),CYdTpL21(3,3),  & 
& CYdTpL22(3,3),CYdTpL23(3,3),CYdTpTd(3,3),CYdTpT21(3,3),CYdTpT22(3,3),CYdTpT23(3,3),    & 
& CYeREps(3),CYeBeps(3),CYeL11(3,3),CYeL12(3,3),CYeL13(3,3),CYeL21(3,3),CYeL22(3,3),     & 
& CYeL23(3,3),CYeTpTe(3,3),CYeT11(3,3),CYeT12(3,3),CYeT13(3,3),CYeT21(3,3),              & 
& CYeT22(3,3),CYeT23(3,3),CL11mlHd2(3),CL11REps(3),CL11Beps(3),CL11Cml2(3,3),            & 
& CL11L11(3,3),CL11L12(3,3),CL11L13(3,3),CL11L21(3,3),CL11L22(3,3),CL11L23(3,3),         & 
& CL11TpYe(3,3),CL11TpTe(3,3),CL11T11(3,3),CL11T12(3,3),CL11T13(3,3),CL11T21(3,3),       & 
& CL11T22(3,3),CL11T23(3,3),CL12mlHd2(3),CL12REps(3),CL12Beps(3),CL12Cml2(3,3),          & 
& CL12L11(3,3),CL12L12(3,3),CL12L13(3,3),CL12L21(3,3),CL12L22(3,3),CL12L23(3,3),         & 
& CL12TpYe(3,3),CL12TpTe(3,3),CL12T11(3,3),CL12T12(3,3),CL12T13(3,3),CL12T21(3,3),       & 
& CL12T22(3,3),CL12T23(3,3),CL13mlHd2(3),CL13REps(3),CL13Beps(3),CL13Cml2(3,3),          & 
& CL13L11(3,3),CL13L12(3,3),CL13L13(3,3),CL13L21(3,3),CL13L22(3,3),CL13L23(3,3),         & 
& CL13TpYe(3,3),CL13TpTe(3,3),CL13T11(3,3),CL13T12(3,3),CL13T13(3,3),CL13T21(3,3),       & 
& CL13T22(3,3),CL13T23(3,3),CL21TpYd(3,3),CL21TpL21(3,3),CL21TpL22(3,3),CL21TpL23(3,3),  & 
& CL21TpTd(3,3),CL21TpT21(3,3),CL22TpYd(3,3),CL22TpL21(3,3),CL22TpL22(3,3),              & 
& CL22TpL23(3,3),CL22TpTd(3,3),CL22TpT22(3,3),CL23TpYd(3,3),CL23TpL21(3,3),              & 
& CL23TpL22(3,3),CL23TpL23(3,3),CL23TpTd(3,3),CL23TpT23(3,3),CTdTpTd(3,3),               & 
& CTeTpTe(3,3),CTuTpTu(3,3),CT11T11(3,3),CT11T12(3,3),CT11T13(3,3),CT12T11(3,3),         & 
& CT12T12(3,3),CT12T13(3,3),CT13T11(3,3),CT13T12(3,3),CT13T13(3,3),CT21TpT21(3,3),       & 
& CT21TpT22(3,3),CT21TpT23(3,3),CT22TpT21(3,3),CT22TpT22(3,3),CT22TpT23(3,3),            & 
& CT23TpT21(3,3),CT23TpT22(3,3),CT23TpT23(3,3),L11ml2(3,3),L12ml2(3,3),L13ml2(3,3)

Complex(dp) :: L21mq2(3,3),L22mq2(3,3),L23mq2(3,3),TdadjTd(3,3),TdadjT21(3,3),TdadjT22(3,3),          & 
& TdadjT23(3,3),TeadjTe(3,3),TeCT11(3,3),TeCT12(3,3),TeCT13(3,3),TuadjTu(3,3),           & 
& TpL21ml2(3,3),TpL22ml2(3,3),TpL23ml2(3,3),md2YdadjYd(3,3),md2YdadjL21(3,3),            & 
& md2YdadjL22(3,3),md2YdadjL23(3,3),me2YeadjYe(3,3),me2YeCL11(3,3),me2YeCL12(3,3),       & 
& me2YeCL13(3,3),ml2adjYeYe(3,3),ml2CL11L11(3,3),ml2CL11L12(3,3),ml2CL11L13(3,3),        & 
& ml2CL12L11(3,3),ml2CL12L12(3,3),ml2CL12L13(3,3),ml2CL13L11(3,3),ml2CL13L12(3,3),       & 
& ml2CL13L13(3,3),ml2CL21TpYd(3,3),ml2CL21TpL21(3,3),ml2CL21TpL22(3,3),ml2CL21TpL23(3,3),& 
& ml2CL22TpYd(3,3),ml2CL22TpL21(3,3),ml2CL22TpL22(3,3),ml2CL22TpL23(3,3),ml2CL23TpYd(3,3),& 
& ml2CL23TpL21(3,3),ml2CL23TpL22(3,3),ml2CL23TpL23(3,3),mq2adjYdYd(3,3),mq2adjYuYu(3,3), & 
& mq2adjL21L21(3,3),mq2adjL21L22(3,3),mq2adjL21L23(3,3),mq2adjL22L21(3,3),               & 
& mq2adjL22L22(3,3),mq2adjL22L23(3,3),mq2adjL23L21(3,3),mq2adjL23L22(3,3),               & 
& mq2adjL23L23(3,3),mu2YuadjYu(3,3),Ydmq2adjYd(3,3),Ydmq2adjL21(3,3),Ydmq2adjL22(3,3),   & 
& Ydmq2adjL23(3,3),YdadjYdmd2(3,3),YdadjYdYd(3,3),YdadjYdTd(3,3),YdadjYuYu(3,3),         & 
& YdadjYuTu(3,3),YdadjL21mlHd2(3),YdadjL21REps(3),YdadjL21Beps(3),YdadjL21L21(3,3),      & 
& YdadjL21L22(3,3),YdadjL21L23(3,3),YdadjL21T11(3,3),YdadjL21T12(3,3),YdadjL21T13(3,3),  & 
& YdadjL21T21(3,3),YdadjL21T22(3,3),YdadjL21T23(3,3),YdadjL22mlHd2(3),YdadjL22REps(3),   & 
& YdadjL22Beps(3),YdadjL22L21(3,3),YdadjL22L22(3,3),YdadjL22L23(3,3),YdadjL22T11(3,3),   & 
& YdadjL22T12(3,3),YdadjL22T13(3,3),YdadjL22T21(3,3),YdadjL22T22(3,3),YdadjL22T23(3,3),  & 
& YdadjL23mlHd2(3),YdadjL23REps(3),YdadjL23Beps(3),YdadjL23L21(3,3),YdadjL23L22(3,3),    & 
& YdadjL23L23(3,3),YdadjL23T11(3,3),YdadjL23T12(3,3),YdadjL23T13(3,3),YdadjL23T21(3,3),  & 
& YdadjL23T22(3,3),YdadjL23T23(3,3),Yeml2adjYe(3,3),Yeml2CL11(3,3),Yeml2CL12(3,3),       & 
& Yeml2CL13(3,3),YeadjYeme2(3,3),YeadjYeYe(3,3),YeadjYeTe(3,3),YeCL11mlHd2(3),           & 
& YeCL11REps(3),YeCL11Beps(3),YeCL11Cml2(3,3),YeCL11L11(3,3),YeCL11L21(3,3),             & 
& YeCL11L22(3,3),YeCL11L23(3,3),YeCL11T11(3,3),YeCL11T12(3,3),YeCL11T13(3,3),            & 
& YeCL11T21(3,3),YeCL11T22(3,3),YeCL11T23(3,3),YeCL12mlHd2(3),YeCL12REps(3),             & 
& YeCL12Beps(3),YeCL12Cml2(3,3),YeCL12L12(3,3),YeCL12L21(3,3),YeCL12L22(3,3),            & 
& YeCL12L23(3,3),YeCL12T11(3,3),YeCL12T12(3,3),YeCL12T13(3,3),YeCL12T21(3,3),            & 
& YeCL12T22(3,3),YeCL12T23(3,3),YeCL13mlHd2(3),YeCL13REps(3),YeCL13Beps(3),              & 
& YeCL13Cml2(3,3),YeCL13L13(3,3),YeCL13L21(3,3),YeCL13L22(3,3),YeCL13L23(3,3),           & 
& YeCL13T11(3,3),YeCL13T12(3,3),YeCL13T13(3,3),YeCL13T21(3,3),YeCL13T22(3,3),            & 
& YeCL13T23(3,3),YeCL21TpL21(3,3),YeCL21TpT21(3,3),YeCL22TpL22(3,3),YeCL22TpT22(3,3),    & 
& YeCL23TpL23(3,3),YeCL23TpT23(3,3),Yumq2adjYu(3,3),YuadjYdYd(3,3),YuadjYdTd(3,3),       & 
& YuadjYumu2(3,3),YuadjYuYu(3,3),YuadjYuTu(3,3),YuadjL21L21(3,3),YuadjL21T21(3,3),       & 
& YuadjL22L22(3,3),YuadjL22T22(3,3),YuadjL23L23(3,3),YuadjL23T23(3,3),adjYdmd2Yd(3,3),   & 
& adjYdYdmq2(3,3),adjYeme2Ye(3,3),adjYeYeml2(3,3),adjYumu2Yu(3,3),adjYuYumq2(3,3),       & 
& adjL21Cml2L21(3,3),adjL21L21mq2(3,3),adjL22Cml2L22(3,3),adjL22L22mq2(3,3),             & 
& adjL23Cml2L23(3,3),adjL23L23mq2(3,3),CL11Cml2L11(3,3),CL11L11ml2(3,3),CL12Cml2L12(3,3)

Complex(dp) :: CL12L12ml2(3,3),CL13Cml2L13(3,3),CL13L13ml2(3,3),CL21Cmq2TpL21(3,3),CL21TpL21ml2(3,3), & 
& CL22Cmq2TpL22(3,3),CL22TpL22ml2(3,3),CL23Cmq2TpL23(3,3),CL23TpL23ml2(3,3),             & 
& L11adjYeYe(3,3),L11adjYeTe(3,3),L11CL11REps(3),L11CL11Beps(3),L11CL11L11(3,3),         & 
& L11CL11L12(3,3),L11CL11L13(3,3),L11CL11L21(3,3),L11CL11L22(3,3),L11CL11L23(3,3),       & 
& L11CL11TpYe(3,3),L11CL11TpTe(3,3),L11CL11T11(3,3),L11CL11T12(3,3),L11CL11T13(3,3),     & 
& L11CL11T21(3,3),L11CL11T22(3,3),L11CL11T23(3,3),L11CL12L12(3,3),L11CL12TpYe(3,3),      & 
& L11CL12TpTe(3,3),L11CL12T12(3,3),L11CL13L13(3,3),L11CL13TpYe(3,3),L11CL13TpTe(3,3),    & 
& L11CL13T13(3,3),L11CL21TpYd(3,3),L11CL21TpL21(3,3),L11CL21TpTd(3,3),L11CL21TpT21(3,3), & 
& L11CL22TpYd(3,3),L11CL22TpL22(3,3),L11CL22TpTd(3,3),L11CL22TpT22(3,3),L11CL23TpYd(3,3),& 
& L11CL23TpL23(3,3),L11CL23TpTd(3,3),L11CL23TpT23(3,3),L12adjYeYe(3,3),L12adjYeTe(3,3),  & 
& L12CL11L11(3,3),L12CL11TpYe(3,3),L12CL11TpTe(3,3),L12CL11T11(3,3),L12CL12REps(3),      & 
& L12CL12Beps(3),L12CL12L11(3,3),L12CL12L12(3,3),L12CL12L13(3,3),L12CL12L21(3,3),        & 
& L12CL12L22(3,3),L12CL12L23(3,3),L12CL12TpYe(3,3),L12CL12TpTe(3,3),L12CL12T11(3,3),     & 
& L12CL12T12(3,3),L12CL12T13(3,3),L12CL12T21(3,3),L12CL12T22(3,3),L12CL12T23(3,3),       & 
& L12CL13L13(3,3),L12CL13TpYe(3,3),L12CL13TpTe(3,3),L12CL13T13(3,3),L12CL21TpYd(3,3),    & 
& L12CL21TpL21(3,3),L12CL21TpTd(3,3),L12CL21TpT21(3,3),L12CL22TpYd(3,3),L12CL22TpL22(3,3),& 
& L12CL22TpTd(3,3),L12CL22TpT22(3,3),L12CL23TpYd(3,3),L12CL23TpL23(3,3),L12CL23TpTd(3,3),& 
& L12CL23TpT23(3,3),L13adjYeYe(3,3),L13adjYeTe(3,3),L13CL11L11(3,3),L13CL11TpYe(3,3),    & 
& L13CL11TpTe(3,3),L13CL11T11(3,3),L13CL12L12(3,3),L13CL12TpYe(3,3),L13CL12TpTe(3,3),    & 
& L13CL12T12(3,3),L13CL13REps(3),L13CL13Beps(3),L13CL13L11(3,3),L13CL13L12(3,3),         & 
& L13CL13L13(3,3),L13CL13L21(3,3),L13CL13L22(3,3),L13CL13L23(3,3),L13CL13TpYe(3,3),      & 
& L13CL13TpTe(3,3),L13CL13T11(3,3),L13CL13T12(3,3),L13CL13T13(3,3),L13CL13T21(3,3),      & 
& L13CL13T22(3,3),L13CL13T23(3,3),L13CL21TpYd(3,3),L13CL21TpL21(3,3),L13CL21TpTd(3,3),   & 
& L13CL21TpT21(3,3),L13CL22TpYd(3,3),L13CL22TpL22(3,3),L13CL22TpTd(3,3),L13CL22TpT22(3,3),& 
& L13CL23TpYd(3,3),L13CL23TpL23(3,3),L13CL23TpTd(3,3),L13CL23TpT23(3,3),L21adjYdYd(3,3), & 
& L21adjYdTd(3,3),L21adjYuYu(3,3),L21adjYuTu(3,3),L21adjL21REps(3),L21adjL21Beps(3),     & 
& L21adjL21L11(3,3),L21adjL21L12(3,3),L21adjL21L13(3,3),L21adjL21L21(3,3),               & 
& L21adjL21L22(3,3),L21adjL21L23(3,3),L21adjL21T11(3,3),L21adjL21T12(3,3),               & 
& L21adjL21T13(3,3),L21adjL21T21(3,3),L21adjL21T22(3,3),L21adjL21T23(3,3),               & 
& L21adjL22L22(3,3),L21adjL22T22(3,3),L21adjL23L23(3,3),L21adjL23T23(3,3),               & 
& L22adjYdYd(3,3),L22adjYdTd(3,3),L22adjYuYu(3,3),L22adjYuTu(3,3),L22adjL21L21(3,3),     & 
& L22adjL21T21(3,3),L22adjL22REps(3),L22adjL22Beps(3),L22adjL22L11(3,3),L22adjL22L12(3,3),& 
& L22adjL22L13(3,3),L22adjL22L21(3,3),L22adjL22L22(3,3),L22adjL22L23(3,3),               & 
& L22adjL22T11(3,3),L22adjL22T12(3,3),L22adjL22T13(3,3),L22adjL22T21(3,3),               & 
& L22adjL22T22(3,3),L22adjL22T23(3,3),L22adjL23L23(3,3),L22adjL23T23(3,3),               & 
& L23adjYdYd(3,3),L23adjYdTd(3,3),L23adjYuYu(3,3),L23adjYuTu(3,3),L23adjL21L21(3,3),     & 
& L23adjL21T21(3,3),L23adjL22L22(3,3),L23adjL22T22(3,3),L23adjL23REps(3),L23adjL23Beps(3)

Complex(dp) :: L23adjL23L11(3,3),L23adjL23L12(3,3),L23adjL23L13(3,3),L23adjL23L21(3,3),               & 
& L23adjL23L22(3,3),L23adjL23L23(3,3),L23adjL23T11(3,3),L23adjL23T12(3,3),               & 
& L23adjL23T13(3,3),L23adjL23T21(3,3),L23adjL23T22(3,3),L23adjL23T23(3,3),               & 
& TdadjYdYd(3,3),TdadjYuYu(3,3),TdadjL21REps(3),TdadjL21L21(3,3),TdadjL22REps(3),        & 
& TdadjL22L22(3,3),TdadjL23REps(3),TdadjL23L23(3,3),TeadjYeYe(3,3),TeCL11REps(3),        & 
& TeCL11L11(3,3),TeCL12REps(3),TeCL12L12(3,3),TeCL13REps(3),TeCL13L13(3,3),              & 
& TeCL21TpL21(3,3),TeCL22TpL22(3,3),TeCL23TpL23(3,3),TuadjYdYd(3,3),TuadjYuYu(3,3),      & 
& TuadjL21L21(3,3),TuadjL22L22(3,3),TuadjL23L23(3,3),TpYeCYeREps(3),TpYeCYeBeps(3),      & 
& TpYeCYeL11(3,3),TpYeCYeL12(3,3),TpYeCYeL13(3,3),TpYeCYeL21(3,3),TpYeCYeL22(3,3),       & 
& TpYeCYeL23(3,3),TpYeCYeT11(3,3),TpYeCYeT12(3,3),TpYeCYeT13(3,3),TpYeCYeT21(3,3),       & 
& TpYeCYeT22(3,3),TpYeCYeT23(3,3),TpL21CL11TpTe(3,3),TpL21CL12TpTe(3,3),TpL21CL13TpTe(3,3),& 
& TpL21CL21TpTd(3,3),TpL21CL22TpTd(3,3),TpL21CL23TpTd(3,3),TpL22CL11TpTe(3,3),           & 
& TpL22CL12TpTe(3,3),TpL22CL13TpTe(3,3),TpL22CL21TpTd(3,3),TpL22CL22TpTd(3,3),           & 
& TpL22CL23TpTd(3,3),TpL23CL11TpTe(3,3),TpL23CL12TpTe(3,3),TpL23CL13TpTe(3,3),           & 
& TpL23CL21TpTd(3,3),TpL23CL22TpTd(3,3),TpL23CL23TpTd(3,3),TpTeCYeREps(3),               & 
& TpTeCYeL11(3,3),TpTeCYeL12(3,3),TpTeCYeL13(3,3),TpTeCYeL21(3,3),TpTeCYeL22(3,3),       & 
& TpTeCYeL23(3,3),T11adjYeYe(3,3),T11CL11REps(3),T11CL11L11(3,3),T11CL11L12(3,3),        & 
& T11CL11L13(3,3),T11CL11L21(3,3),T11CL11L22(3,3),T11CL11L23(3,3),T11CL12L12(3,3),       & 
& T11CL13L13(3,3),T11CL21TpL21(3,3),T11CL22TpL22(3,3),T11CL23TpL23(3,3),T12adjYeYe(3,3), & 
& T12CL11L11(3,3),T12CL12REps(3),T12CL12L11(3,3),T12CL12L12(3,3),T12CL12L13(3,3),        & 
& T12CL12L21(3,3),T12CL12L22(3,3),T12CL12L23(3,3),T12CL13L13(3,3),T12CL21TpL21(3,3),     & 
& T12CL22TpL22(3,3),T12CL23TpL23(3,3),T13adjYeYe(3,3),T13CL11L11(3,3),T13CL12L12(3,3),   & 
& T13CL13REps(3),T13CL13L11(3,3),T13CL13L12(3,3),T13CL13L13(3,3),T13CL13L21(3,3),        & 
& T13CL13L22(3,3),T13CL13L23(3,3),T13CL21TpL21(3,3),T13CL22TpL22(3,3),T13CL23TpL23(3,3), & 
& T21adjYdYd(3,3),T21adjYuYu(3,3),T21adjL21REps(3),T21adjL21L11(3,3),T21adjL21L12(3,3),  & 
& T21adjL21L13(3,3),T21adjL21L21(3,3),T21adjL21L22(3,3),T21adjL21L23(3,3),               & 
& T21adjL22L22(3,3),T21adjL23L23(3,3),T22adjYdYd(3,3),T22adjYuYu(3,3),T22adjL21L21(3,3), & 
& T22adjL22REps(3),T22adjL22L11(3,3),T22adjL22L12(3,3),T22adjL22L13(3,3),T22adjL22L21(3,3),& 
& T22adjL22L22(3,3),T22adjL22L23(3,3),T22adjL23L23(3,3),T23adjYdYd(3,3),T23adjYuYu(3,3), & 
& T23adjL21L21(3,3),T23adjL22L22(3,3),T23adjL23REps(3),T23adjL23L11(3,3),T23adjL23L12(3,3),& 
& T23adjL23L13(3,3),T23adjL23L21(3,3),T23adjL23L22(3,3),T23adjL23L23(3,3)

Complex(dp) :: Trmd2,Trme2,Trml2,Trmq2,Trmu2,TrYdadjYd,TrYeadjYe,TrYuadjYu,TradjYdTd,TradjYeTe,      & 
& TradjYuTu,TradjL21T21,TradjL21T22,TradjL21T23,TradjL22T21,TradjL22T22,TradjL22T23,     & 
& TradjL23T21,TradjL23T22,TradjL23T23,TrCL11L11,TrCL11L12,TrCL11L13,TrCL11T11,           & 
& TrCL11T12,TrCL11T13,TrCL12L11,TrCL12L12,TrCL12L13,TrCL12T11,TrCL12T12,TrCL12T13,       & 
& TrCL13L11,TrCL13L12,TrCL13L13,TrCL13T11,TrCL13T12,TrCL13T13,TrCL21TpL21,               & 
& TrCL21TpL22,TrCL21TpL23,TrCL22TpL21,TrCL22TpL22,TrCL22TpL23,TrCL23TpL21,               & 
& TrCL23TpL22,TrCL23TpL23,TrCTdTpTd,TrCTeTpTe,TrCTuTpTu,TrCT11T11,TrCT11T12,             & 
& TrCT11T13,TrCT12T11,TrCT12T12,TrCT12T13,TrCT13T11,TrCT13T12,TrCT13T13,TrCT21TpT21,     & 
& TrCT21TpT22,TrCT21TpT23,TrCT22TpT21,TrCT22TpT22,TrCT22TpT23,TrCT23TpT21,               & 
& TrCT23TpT22,TrCT23TpT23,Trmd2YdadjYd,Trme2YeadjYe,Trml2adjYeYe,Trml2CL11L11,           & 
& Trml2CL11L12,Trml2CL11L13,Trml2CL12L11,Trml2CL12L12,Trml2CL12L13,Trml2CL13L11,         & 
& Trml2CL13L12,Trml2CL13L13,Trml2CL21TpL21,Trml2CL21TpL22,Trml2CL21TpL23,Trml2CL22TpL21, & 
& Trml2CL22TpL22,Trml2CL22TpL23,Trml2CL23TpL21,Trml2CL23TpL22,Trml2CL23TpL23,            & 
& Trmq2adjYdYd,Trmq2adjYuYu,Trmq2adjL21L21,Trmq2adjL21L22,Trmq2adjL21L23,Trmq2adjL22L21, & 
& Trmq2adjL22L22,Trmq2adjL22L23,Trmq2adjL23L21,Trmq2adjL23L22,Trmq2adjL23L23,            & 
& Trmu2YuadjYu

Real(dp) :: g1p2,g1p3,g2p2,g2p3,g3p2,g3p3

Complex(dp) :: sqrt3ov5,ooSqrt15

Complex(dp) :: DyYdadjL211i1mlHd2i2(3,3),DyYdadjL222i1mlHd2i2(3,3),DyYdadjL233i1mlHd2i2(3,3),        & 
& DyYeCL111i1mlHd2i2(3,3),DyYeCL122i1mlHd2i2(3,3),DyYeCL133i1mlHd2i2(3,3),               & 
& DyadjL21mlHd2i1Yd1i2(3,3),DyadjL22mlHd2i1Yd2i2(3,3),DyadjL23mlHd2i1Yd3i2(3,3),         & 
& DyCL11mlHd2i1Ye1i2(3,3),DyCL12mlHd2i1Ye2i2(3,3),DyCL13mlHd2i1Ye3i2(3,3)

Complex(dp) :: L11(3,3), adjL11(3,3) 
Complex(dp) :: L12(3,3), adjL12(3,3) 
Complex(dp) :: L13(3,3), adjL13(3,3) 
Complex(dp) :: T11(3,3), adjT11(3,3) 
Complex(dp) :: T12(3,3), adjT12(3,3) 
Complex(dp) :: T13(3,3), adjT13(3,3) 
Complex(dp) :: L21(3,3), adjL21(3,3) 
Complex(dp) :: L22(3,3), adjL22(3,3) 
Complex(dp) :: L23(3,3), adjL23(3,3) 
Complex(dp) :: T21(3,3), adjT21(3,3) 
Complex(dp) :: T22(3,3), adjT22(3,3) 
Complex(dp) :: T23(3,3), adjT23(3,3) 
Iname = Iname +1 
NameOfUnit(Iname) = 'rge444' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters444(gy,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,              & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3)

L11=L1(:,:,1) 
Call Adjungate(L11,adjL11) 
L12=L1(:,:,2) 
Call Adjungate(L12,adjL12) 
L13=L1(:,:,3) 
Call Adjungate(L13,adjL13) 
T11=T1(:,:,1) 
Call Adjungate(T11,adjT11) 
T12=T1(:,:,2) 
Call Adjungate(T12,adjT12) 
T13=T1(:,:,3) 
Call Adjungate(T13,adjT13) 
L21=L2(:,:,1) 
Call Adjungate(L21,adjL21) 
L22=L2(:,:,2) 
Call Adjungate(L22,adjL22) 
L23=L2(:,:,3) 
Call Adjungate(L23,adjL23) 
T21=T2(:,:,1) 
Call Adjungate(T21,adjT21) 
T22=T2(:,:,2) 
Call Adjungate(T22,adjT22) 
T23=T2(:,:,3) 
Call Adjungate(T23,adjT23) 
AbsM1 = Conjg(M1)*M1
AbsM2 = Conjg(M2)*M2
AbsM3 = Conjg(M3)*M3
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yu,adjYu)
Call Adjungate(Td,adjTd)
Call Adjungate(Te,adjTe)
Call Adjungate(Tu,adjTu)
 md2Yd = Matmul(md2,Yd) 
 me2Ye = Matmul(me2,Ye) 
 ml2adjYe = Matmul(ml2,adjYe) 
 ml2CL11 = Matmul(ml2,Conjg(L11)) 
 ml2CL12 = Matmul(ml2,Conjg(L12)) 
 ml2CL13 = Matmul(ml2,Conjg(L13)) 
 mq2adjYd = Matmul(mq2,adjYd) 
 mq2adjYu = Matmul(mq2,adjYu) 
 mq2adjL21 = Matmul(mq2,adjL21) 
 mq2adjL22 = Matmul(mq2,adjL22) 
 mq2adjL23 = Matmul(mq2,adjL23) 
 mu2Yu = Matmul(mu2,Yu) 
 Ydmq2 = Matmul(Yd,mq2) 
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YdadjL21 = Matmul(Yd,adjL21) 
 YdadjL22 = Matmul(Yd,adjL22) 
 YdadjL23 = Matmul(Yd,adjL23) 
 Yeml2 = Matmul(Ye,ml2) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YeCL11 = Matmul(Ye,Conjg(L11)) 
 YeCL12 = Matmul(Ye,Conjg(L12)) 
 YeCL13 = Matmul(Ye,Conjg(L13)) 
 Yumq2 = Matmul(Yu,mq2) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjYdmd2 = Matmul(adjYd,md2) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYdTd = Matmul(adjYd,Td) 
 adjYeme2 = Matmul(adjYe,me2) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTe = Matmul(adjYe,Te) 
 adjYumu2 = Matmul(adjYu,mu2) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYuTu = Matmul(adjYu,Tu) 
 adjL21mlHd2 = Matmul(adjL21,mlHd2) 
 adjL21REps = Matmul(adjL21,REps) 
 adjL21Beps = Matmul(adjL21,Beps) 
 adjL21L11 = Matmul(adjL21,L11) 
 adjL21L12 = Matmul(adjL21,L12) 
 adjL21L13 = Matmul(adjL21,L13) 
 adjL21L21 = Matmul(adjL21,L21) 
 adjL21L22 = Matmul(adjL21,L22) 
 adjL21L23 = Matmul(adjL21,L23) 
 adjL21T11 = Matmul(adjL21,T11) 
 adjL21T12 = Matmul(adjL21,T12) 
 adjL21T13 = Matmul(adjL21,T13) 
 adjL21T21 = Matmul(adjL21,T21) 
 adjL21T22 = Matmul(adjL21,T22) 
 adjL21T23 = Matmul(adjL21,T23) 
 adjL22mlHd2 = Matmul(adjL22,mlHd2) 
 adjL22REps = Matmul(adjL22,REps) 
 adjL22Beps = Matmul(adjL22,Beps) 
 adjL22L11 = Matmul(adjL22,L11) 
 adjL22L12 = Matmul(adjL22,L12) 
 adjL22L13 = Matmul(adjL22,L13) 
 adjL22L21 = Matmul(adjL22,L21) 
 adjL22L22 = Matmul(adjL22,L22) 
 adjL22L23 = Matmul(adjL22,L23) 
 adjL22T11 = Matmul(adjL22,T11) 
 adjL22T12 = Matmul(adjL22,T12) 
 adjL22T13 = Matmul(adjL22,T13) 
 adjL22T21 = Matmul(adjL22,T21) 
 adjL22T22 = Matmul(adjL22,T22) 
 adjL22T23 = Matmul(adjL22,T23) 
 adjL23mlHd2 = Matmul(adjL23,mlHd2) 
 adjL23REps = Matmul(adjL23,REps) 
 adjL23Beps = Matmul(adjL23,Beps) 
 adjL23L11 = Matmul(adjL23,L11) 
 adjL23L12 = Matmul(adjL23,L12) 
 adjL23L13 = Matmul(adjL23,L13) 
 adjL23L21 = Matmul(adjL23,L21) 
 adjL23L22 = Matmul(adjL23,L22) 
 adjL23L23 = Matmul(adjL23,L23) 
 adjL23T11 = Matmul(adjL23,T11) 
 adjL23T12 = Matmul(adjL23,T12) 
 adjL23T13 = Matmul(adjL23,T13) 
 adjL23T21 = Matmul(adjL23,T21) 
 adjL23T22 = Matmul(adjL23,T22) 
 adjL23T23 = Matmul(adjL23,T23) 
 adjTdTd = Matmul(adjTd,Td) 
 adjTeTe = Matmul(adjTe,Te) 
 adjTuTu = Matmul(adjTu,Tu) 
 adjT21T21 = Matmul(adjT21,T21) 
 adjT22T22 = Matmul(adjT22,T22) 
 adjT23T23 = Matmul(adjT23,T23) 
 Cml2L11 = Matmul(Conjg(ml2),L11) 
 Cml2L12 = Matmul(Conjg(ml2),L12) 
 Cml2L13 = Matmul(Conjg(ml2),L13) 
 Cml2L21 = Matmul(Conjg(ml2),L21) 
 Cml2L22 = Matmul(Conjg(ml2),L22) 
 Cml2L23 = Matmul(Conjg(ml2),L23) 
 Cmq2TpL21 = Matmul(Conjg(mq2),Transpose(L21)) 
 Cmq2TpL22 = Matmul(Conjg(mq2),Transpose(L22)) 
 Cmq2TpL23 = Matmul(Conjg(mq2),Transpose(L23)) 
 CYdTpL21 = Matmul(Conjg(Yd),Transpose(L21)) 
 CYdTpL22 = Matmul(Conjg(Yd),Transpose(L22)) 
 CYdTpL23 = Matmul(Conjg(Yd),Transpose(L23)) 
 CYdTpTd = Matmul(Conjg(Yd),Transpose(Td)) 
 CYdTpT21 = Matmul(Conjg(Yd),Transpose(T21)) 
 CYdTpT22 = Matmul(Conjg(Yd),Transpose(T22)) 
 CYdTpT23 = Matmul(Conjg(Yd),Transpose(T23)) 
 CYeREps = Matmul(Conjg(Ye),REps) 
 CYeBeps = Matmul(Conjg(Ye),Beps) 
 CYeL11 = Matmul(Conjg(Ye),L11) 
 CYeL12 = Matmul(Conjg(Ye),L12) 
 CYeL13 = Matmul(Conjg(Ye),L13) 
 CYeL21 = Matmul(Conjg(Ye),L21) 
 CYeL22 = Matmul(Conjg(Ye),L22) 
 CYeL23 = Matmul(Conjg(Ye),L23) 
 CYeTpTe = Matmul(Conjg(Ye),Transpose(Te)) 
 CYeT11 = Matmul(Conjg(Ye),T11) 
 CYeT12 = Matmul(Conjg(Ye),T12) 
 CYeT13 = Matmul(Conjg(Ye),T13) 
 CYeT21 = Matmul(Conjg(Ye),T21) 
 CYeT22 = Matmul(Conjg(Ye),T22) 
 CYeT23 = Matmul(Conjg(Ye),T23) 
 CL11mlHd2 = Matmul(Conjg(L11),mlHd2) 
 CL11REps = Matmul(Conjg(L11),REps) 
 CL11Beps = Matmul(Conjg(L11),Beps) 
 CL11Cml2 = Matmul(Conjg(L11),Conjg(ml2)) 
 CL11L11 = Matmul(Conjg(L11),L11) 
 CL11L12 = Matmul(Conjg(L11),L12) 
 CL11L13 = Matmul(Conjg(L11),L13) 
 CL11L21 = Matmul(Conjg(L11),L21) 
 CL11L22 = Matmul(Conjg(L11),L22) 
 CL11L23 = Matmul(Conjg(L11),L23) 
 CL11TpYe = Matmul(Conjg(L11),Transpose(Ye)) 
 CL11TpTe = Matmul(Conjg(L11),Transpose(Te)) 
 CL11T11 = Matmul(Conjg(L11),T11) 
 CL11T12 = Matmul(Conjg(L11),T12) 
 CL11T13 = Matmul(Conjg(L11),T13) 
 CL11T21 = Matmul(Conjg(L11),T21) 
 CL11T22 = Matmul(Conjg(L11),T22) 
 CL11T23 = Matmul(Conjg(L11),T23) 
 CL12mlHd2 = Matmul(Conjg(L12),mlHd2) 
 CL12REps = Matmul(Conjg(L12),REps) 
 CL12Beps = Matmul(Conjg(L12),Beps) 
 CL12Cml2 = Matmul(Conjg(L12),Conjg(ml2)) 
 CL12L11 = Matmul(Conjg(L12),L11) 
 CL12L12 = Matmul(Conjg(L12),L12) 
 CL12L13 = Matmul(Conjg(L12),L13) 
 CL12L21 = Matmul(Conjg(L12),L21) 
 CL12L22 = Matmul(Conjg(L12),L22) 
 CL12L23 = Matmul(Conjg(L12),L23) 
 CL12TpYe = Matmul(Conjg(L12),Transpose(Ye)) 
 CL12TpTe = Matmul(Conjg(L12),Transpose(Te)) 
 CL12T11 = Matmul(Conjg(L12),T11) 
 CL12T12 = Matmul(Conjg(L12),T12) 
 CL12T13 = Matmul(Conjg(L12),T13) 
 CL12T21 = Matmul(Conjg(L12),T21) 
 CL12T22 = Matmul(Conjg(L12),T22) 
 CL12T23 = Matmul(Conjg(L12),T23) 
 CL13mlHd2 = Matmul(Conjg(L13),mlHd2) 
 CL13REps = Matmul(Conjg(L13),REps) 
 CL13Beps = Matmul(Conjg(L13),Beps) 
 CL13Cml2 = Matmul(Conjg(L13),Conjg(ml2)) 
 CL13L11 = Matmul(Conjg(L13),L11) 
 CL13L12 = Matmul(Conjg(L13),L12) 
 CL13L13 = Matmul(Conjg(L13),L13) 
 CL13L21 = Matmul(Conjg(L13),L21) 
 CL13L22 = Matmul(Conjg(L13),L22) 
 CL13L23 = Matmul(Conjg(L13),L23) 
 CL13TpYe = Matmul(Conjg(L13),Transpose(Ye)) 
 CL13TpTe = Matmul(Conjg(L13),Transpose(Te)) 
 CL13T11 = Matmul(Conjg(L13),T11) 
 CL13T12 = Matmul(Conjg(L13),T12) 
 CL13T13 = Matmul(Conjg(L13),T13) 
 CL13T21 = Matmul(Conjg(L13),T21) 
 CL13T22 = Matmul(Conjg(L13),T22) 
 CL13T23 = Matmul(Conjg(L13),T23) 
 CL21TpYd = Matmul(Conjg(L21),Transpose(Yd)) 
 CL21TpL21 = Matmul(Conjg(L21),Transpose(L21)) 
Forall(i2=1:3)  CL21TpL21(i2,i2) =  Real(CL21TpL21(i2,i2),dp) 
 CL21TpL22 = Matmul(Conjg(L21),Transpose(L22)) 
 CL21TpL23 = Matmul(Conjg(L21),Transpose(L23)) 
 CL21TpTd = Matmul(Conjg(L21),Transpose(Td)) 
 CL21TpT21 = Matmul(Conjg(L21),Transpose(T21)) 
 CL22TpYd = Matmul(Conjg(L22),Transpose(Yd)) 
 CL22TpL21 = Matmul(Conjg(L22),Transpose(L21)) 
 CL22TpL22 = Matmul(Conjg(L22),Transpose(L22)) 
Forall(i2=1:3)  CL22TpL22(i2,i2) =  Real(CL22TpL22(i2,i2),dp) 
 CL22TpL23 = Matmul(Conjg(L22),Transpose(L23)) 
 CL22TpTd = Matmul(Conjg(L22),Transpose(Td)) 
 CL22TpT22 = Matmul(Conjg(L22),Transpose(T22)) 
 CL23TpYd = Matmul(Conjg(L23),Transpose(Yd)) 
 CL23TpL21 = Matmul(Conjg(L23),Transpose(L21)) 
 CL23TpL22 = Matmul(Conjg(L23),Transpose(L22)) 
 CL23TpL23 = Matmul(Conjg(L23),Transpose(L23)) 
Forall(i2=1:3)  CL23TpL23(i2,i2) =  Real(CL23TpL23(i2,i2),dp) 
 CL23TpTd = Matmul(Conjg(L23),Transpose(Td)) 
 CL23TpT23 = Matmul(Conjg(L23),Transpose(T23)) 
 CTdTpTd = Matmul(Conjg(Td),Transpose(Td)) 
Forall(i2=1:3)  CTdTpTd(i2,i2) =  Real(CTdTpTd(i2,i2),dp) 
 CTeTpTe = Matmul(Conjg(Te),Transpose(Te)) 
Forall(i2=1:3)  CTeTpTe(i2,i2) =  Real(CTeTpTe(i2,i2),dp) 
 CTuTpTu = Matmul(Conjg(Tu),Transpose(Tu)) 
Forall(i2=1:3)  CTuTpTu(i2,i2) =  Real(CTuTpTu(i2,i2),dp) 
 CT11T11 = Matmul(Conjg(T11),T11) 
 CT11T12 = Matmul(Conjg(T11),T12) 
 CT11T13 = Matmul(Conjg(T11),T13) 
 CT12T11 = Matmul(Conjg(T12),T11) 
 CT12T12 = Matmul(Conjg(T12),T12) 
 CT12T13 = Matmul(Conjg(T12),T13) 
 CT13T11 = Matmul(Conjg(T13),T11) 
 CT13T12 = Matmul(Conjg(T13),T12) 
 CT13T13 = Matmul(Conjg(T13),T13) 
 CT21TpT21 = Matmul(Conjg(T21),Transpose(T21)) 
Forall(i2=1:3)  CT21TpT21(i2,i2) =  Real(CT21TpT21(i2,i2),dp) 
 CT21TpT22 = Matmul(Conjg(T21),Transpose(T22)) 
 CT21TpT23 = Matmul(Conjg(T21),Transpose(T23)) 
 CT22TpT21 = Matmul(Conjg(T22),Transpose(T21)) 
 CT22TpT22 = Matmul(Conjg(T22),Transpose(T22)) 
Forall(i2=1:3)  CT22TpT22(i2,i2) =  Real(CT22TpT22(i2,i2),dp) 
 CT22TpT23 = Matmul(Conjg(T22),Transpose(T23)) 
 CT23TpT21 = Matmul(Conjg(T23),Transpose(T21)) 
 CT23TpT22 = Matmul(Conjg(T23),Transpose(T22)) 
 CT23TpT23 = Matmul(Conjg(T23),Transpose(T23)) 
Forall(i2=1:3)  CT23TpT23(i2,i2) =  Real(CT23TpT23(i2,i2),dp) 
 L11ml2 = Matmul(L11,ml2) 
 L12ml2 = Matmul(L12,ml2) 
 L13ml2 = Matmul(L13,ml2) 
 L21mq2 = Matmul(L21,mq2) 
 L22mq2 = Matmul(L22,mq2) 
 L23mq2 = Matmul(L23,mq2) 
 TdadjTd = Matmul(Td,adjTd) 
 TdadjT21 = Matmul(Td,adjT21) 
 TdadjT22 = Matmul(Td,adjT22) 
 TdadjT23 = Matmul(Td,adjT23) 
 TeadjTe = Matmul(Te,adjTe) 
 TeCT11 = Matmul(Te,Conjg(T11)) 
 TeCT12 = Matmul(Te,Conjg(T12)) 
 TeCT13 = Matmul(Te,Conjg(T13)) 
 TuadjTu = Matmul(Tu,adjTu) 
 TpL21ml2 = Matmul(Transpose(L21),ml2) 
 TpL22ml2 = Matmul(Transpose(L22),ml2) 
 TpL23ml2 = Matmul(Transpose(L23),ml2) 
 md2YdadjYd = Matmul(md2,YdadjYd) 
 md2YdadjL21 = Matmul(md2,YdadjL21) 
 md2YdadjL22 = Matmul(md2,YdadjL22) 
 md2YdadjL23 = Matmul(md2,YdadjL23) 
 me2YeadjYe = Matmul(me2,YeadjYe) 
 me2YeCL11 = Matmul(me2,YeCL11) 
 me2YeCL12 = Matmul(me2,YeCL12) 
 me2YeCL13 = Matmul(me2,YeCL13) 
 ml2adjYeYe = Matmul(ml2,adjYeYe) 
 ml2CL11L11 = Matmul(ml2,CL11L11) 
 ml2CL11L12 = Matmul(ml2,CL11L12) 
 ml2CL11L13 = Matmul(ml2,CL11L13) 
 ml2CL12L11 = Matmul(ml2,CL12L11) 
 ml2CL12L12 = Matmul(ml2,CL12L12) 
 ml2CL12L13 = Matmul(ml2,CL12L13) 
 ml2CL13L11 = Matmul(ml2,CL13L11) 
 ml2CL13L12 = Matmul(ml2,CL13L12) 
 ml2CL13L13 = Matmul(ml2,CL13L13) 
 ml2CL21TpYd = Matmul(ml2,CL21TpYd) 
 ml2CL21TpL21 = Matmul(ml2,CL21TpL21) 
 ml2CL21TpL22 = Matmul(ml2,CL21TpL22) 
 ml2CL21TpL23 = Matmul(ml2,CL21TpL23) 
 ml2CL22TpYd = Matmul(ml2,CL22TpYd) 
 ml2CL22TpL21 = Matmul(ml2,CL22TpL21) 
 ml2CL22TpL22 = Matmul(ml2,CL22TpL22) 
 ml2CL22TpL23 = Matmul(ml2,CL22TpL23) 
 ml2CL23TpYd = Matmul(ml2,CL23TpYd) 
 ml2CL23TpL21 = Matmul(ml2,CL23TpL21) 
 ml2CL23TpL22 = Matmul(ml2,CL23TpL22) 
 ml2CL23TpL23 = Matmul(ml2,CL23TpL23) 
 mq2adjYdYd = Matmul(mq2,adjYdYd) 
 mq2adjYuYu = Matmul(mq2,adjYuYu) 
 mq2adjL21L21 = Matmul(mq2,adjL21L21) 
 mq2adjL21L22 = Matmul(mq2,adjL21L22) 
 mq2adjL21L23 = Matmul(mq2,adjL21L23) 
 mq2adjL22L21 = Matmul(mq2,adjL22L21) 
 mq2adjL22L22 = Matmul(mq2,adjL22L22) 
 mq2adjL22L23 = Matmul(mq2,adjL22L23) 
 mq2adjL23L21 = Matmul(mq2,adjL23L21) 
 mq2adjL23L22 = Matmul(mq2,adjL23L22) 
 mq2adjL23L23 = Matmul(mq2,adjL23L23) 
 mu2YuadjYu = Matmul(mu2,YuadjYu) 
 Ydmq2adjYd = Matmul(Yd,mq2adjYd) 
Forall(i2=1:3)  Ydmq2adjYd(i2,i2) =  Real(Ydmq2adjYd(i2,i2),dp) 
 Ydmq2adjL21 = Matmul(Yd,mq2adjL21) 
 Ydmq2adjL22 = Matmul(Yd,mq2adjL22) 
 Ydmq2adjL23 = Matmul(Yd,mq2adjL23) 
 YdadjYdmd2 = Matmul(Yd,adjYdmd2) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYdTd = Matmul(Yd,adjYdTd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YdadjYuTu = Matmul(Yd,adjYuTu) 
 YdadjL21mlHd2 = Matmul(Yd,adjL21mlHd2) 
 YdadjL21REps = Matmul(Yd,adjL21REps) 
 YdadjL21Beps = Matmul(Yd,adjL21Beps) 
 YdadjL21L21 = Matmul(Yd,adjL21L21) 
 YdadjL21L22 = Matmul(Yd,adjL21L22) 
 YdadjL21L23 = Matmul(Yd,adjL21L23) 
 YdadjL21T11 = Matmul(Yd,adjL21T11) 
 YdadjL21T12 = Matmul(Yd,adjL21T12) 
 YdadjL21T13 = Matmul(Yd,adjL21T13) 
 YdadjL21T21 = Matmul(Yd,adjL21T21) 
 YdadjL21T22 = Matmul(Yd,adjL21T22) 
 YdadjL21T23 = Matmul(Yd,adjL21T23) 
 YdadjL22mlHd2 = Matmul(Yd,adjL22mlHd2) 
 YdadjL22REps = Matmul(Yd,adjL22REps) 
 YdadjL22Beps = Matmul(Yd,adjL22Beps) 
 YdadjL22L21 = Matmul(Yd,adjL22L21) 
 YdadjL22L22 = Matmul(Yd,adjL22L22) 
 YdadjL22L23 = Matmul(Yd,adjL22L23) 
 YdadjL22T11 = Matmul(Yd,adjL22T11) 
 YdadjL22T12 = Matmul(Yd,adjL22T12) 
 YdadjL22T13 = Matmul(Yd,adjL22T13) 
 YdadjL22T21 = Matmul(Yd,adjL22T21) 
 YdadjL22T22 = Matmul(Yd,adjL22T22) 
 YdadjL22T23 = Matmul(Yd,adjL22T23) 
 YdadjL23mlHd2 = Matmul(Yd,adjL23mlHd2) 
 YdadjL23REps = Matmul(Yd,adjL23REps) 
 YdadjL23Beps = Matmul(Yd,adjL23Beps) 
 YdadjL23L21 = Matmul(Yd,adjL23L21) 
 YdadjL23L22 = Matmul(Yd,adjL23L22) 
 YdadjL23L23 = Matmul(Yd,adjL23L23) 
 YdadjL23T11 = Matmul(Yd,adjL23T11) 
 YdadjL23T12 = Matmul(Yd,adjL23T12) 
 YdadjL23T13 = Matmul(Yd,adjL23T13) 
 YdadjL23T21 = Matmul(Yd,adjL23T21) 
 YdadjL23T22 = Matmul(Yd,adjL23T22) 
 YdadjL23T23 = Matmul(Yd,adjL23T23) 
 Yeml2adjYe = Matmul(Ye,ml2adjYe) 
Forall(i2=1:3)  Yeml2adjYe(i2,i2) =  Real(Yeml2adjYe(i2,i2),dp) 
 Yeml2CL11 = Matmul(Ye,ml2CL11) 
 Yeml2CL12 = Matmul(Ye,ml2CL12) 
 Yeml2CL13 = Matmul(Ye,ml2CL13) 
 YeadjYeme2 = Matmul(Ye,adjYeme2) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YeadjYeTe = Matmul(Ye,adjYeTe) 
 YeCL11mlHd2 = Matmul(Ye,CL11mlHd2) 
 YeCL11REps = Matmul(Ye,CL11REps) 
 YeCL11Beps = Matmul(Ye,CL11Beps) 
 YeCL11Cml2 = Matmul(Ye,CL11Cml2) 
 YeCL11L11 = Matmul(Ye,CL11L11) 
 YeCL11L21 = Matmul(Ye,CL11L21) 
 YeCL11L22 = Matmul(Ye,CL11L22) 
 YeCL11L23 = Matmul(Ye,CL11L23) 
 YeCL11T11 = Matmul(Ye,CL11T11) 
 YeCL11T12 = Matmul(Ye,CL11T12) 
 YeCL11T13 = Matmul(Ye,CL11T13) 
 YeCL11T21 = Matmul(Ye,CL11T21) 
 YeCL11T22 = Matmul(Ye,CL11T22) 
 YeCL11T23 = Matmul(Ye,CL11T23) 
 YeCL12mlHd2 = Matmul(Ye,CL12mlHd2) 
 YeCL12REps = Matmul(Ye,CL12REps) 
 YeCL12Beps = Matmul(Ye,CL12Beps) 
 YeCL12Cml2 = Matmul(Ye,CL12Cml2) 
 YeCL12L12 = Matmul(Ye,CL12L12) 
 YeCL12L21 = Matmul(Ye,CL12L21) 
 YeCL12L22 = Matmul(Ye,CL12L22) 
 YeCL12L23 = Matmul(Ye,CL12L23) 
 YeCL12T11 = Matmul(Ye,CL12T11) 
 YeCL12T12 = Matmul(Ye,CL12T12) 
 YeCL12T13 = Matmul(Ye,CL12T13) 
 YeCL12T21 = Matmul(Ye,CL12T21) 
 YeCL12T22 = Matmul(Ye,CL12T22) 
 YeCL12T23 = Matmul(Ye,CL12T23) 
 YeCL13mlHd2 = Matmul(Ye,CL13mlHd2) 
 YeCL13REps = Matmul(Ye,CL13REps) 
 YeCL13Beps = Matmul(Ye,CL13Beps) 
 YeCL13Cml2 = Matmul(Ye,CL13Cml2) 
 YeCL13L13 = Matmul(Ye,CL13L13) 
 YeCL13L21 = Matmul(Ye,CL13L21) 
 YeCL13L22 = Matmul(Ye,CL13L22) 
 YeCL13L23 = Matmul(Ye,CL13L23) 
 YeCL13T11 = Matmul(Ye,CL13T11) 
 YeCL13T12 = Matmul(Ye,CL13T12) 
 YeCL13T13 = Matmul(Ye,CL13T13) 
 YeCL13T21 = Matmul(Ye,CL13T21) 
 YeCL13T22 = Matmul(Ye,CL13T22) 
 YeCL13T23 = Matmul(Ye,CL13T23) 
 YeCL21TpL21 = Matmul(Ye,CL21TpL21) 
 YeCL21TpT21 = Matmul(Ye,CL21TpT21) 
 YeCL22TpL22 = Matmul(Ye,CL22TpL22) 
 YeCL22TpT22 = Matmul(Ye,CL22TpT22) 
 YeCL23TpL23 = Matmul(Ye,CL23TpL23) 
 YeCL23TpT23 = Matmul(Ye,CL23TpT23) 
 Yumq2adjYu = Matmul(Yu,mq2adjYu) 
Forall(i2=1:3)  Yumq2adjYu(i2,i2) =  Real(Yumq2adjYu(i2,i2),dp) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYdTd = Matmul(Yu,adjYdTd) 
 YuadjYumu2 = Matmul(Yu,adjYumu2) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 YuadjYuTu = Matmul(Yu,adjYuTu) 
 YuadjL21L21 = Matmul(Yu,adjL21L21) 
 YuadjL21T21 = Matmul(Yu,adjL21T21) 
 YuadjL22L22 = Matmul(Yu,adjL22L22) 
 YuadjL22T22 = Matmul(Yu,adjL22T22) 
 YuadjL23L23 = Matmul(Yu,adjL23L23) 
 YuadjL23T23 = Matmul(Yu,adjL23T23) 
 adjYdmd2Yd = Matmul(adjYd,md2Yd) 
Forall(i2=1:3)  adjYdmd2Yd(i2,i2) =  Real(adjYdmd2Yd(i2,i2),dp) 
 adjYdYdmq2 = Matmul(adjYd,Ydmq2) 
 adjYeme2Ye = Matmul(adjYe,me2Ye) 
Forall(i2=1:3)  adjYeme2Ye(i2,i2) =  Real(adjYeme2Ye(i2,i2),dp) 
 adjYeYeml2 = Matmul(adjYe,Yeml2) 
 adjYumu2Yu = Matmul(adjYu,mu2Yu) 
Forall(i2=1:3)  adjYumu2Yu(i2,i2) =  Real(adjYumu2Yu(i2,i2),dp) 
 adjYuYumq2 = Matmul(adjYu,Yumq2) 
 adjL21Cml2L21 = Matmul(adjL21,Cml2L21) 
 adjL21L21mq2 = Matmul(adjL21,L21mq2) 
 adjL22Cml2L22 = Matmul(adjL22,Cml2L22) 
 adjL22L22mq2 = Matmul(adjL22,L22mq2) 
 adjL23Cml2L23 = Matmul(adjL23,Cml2L23) 
 adjL23L23mq2 = Matmul(adjL23,L23mq2) 
 CL11Cml2L11 = Matmul(Conjg(L11),Cml2L11) 
 CL11L11ml2 = Matmul(Conjg(L11),L11ml2) 
 CL12Cml2L12 = Matmul(Conjg(L12),Cml2L12) 
 CL12L12ml2 = Matmul(Conjg(L12),L12ml2) 
 CL13Cml2L13 = Matmul(Conjg(L13),Cml2L13) 
 CL13L13ml2 = Matmul(Conjg(L13),L13ml2) 
 CL21Cmq2TpL21 = Matmul(Conjg(L21),Cmq2TpL21) 
Forall(i2=1:3)  CL21Cmq2TpL21(i2,i2) =  Real(CL21Cmq2TpL21(i2,i2),dp) 
 CL21TpL21ml2 = Matmul(Conjg(L21),TpL21ml2) 
 CL22Cmq2TpL22 = Matmul(Conjg(L22),Cmq2TpL22) 
Forall(i2=1:3)  CL22Cmq2TpL22(i2,i2) =  Real(CL22Cmq2TpL22(i2,i2),dp) 
 CL22TpL22ml2 = Matmul(Conjg(L22),TpL22ml2) 
 CL23Cmq2TpL23 = Matmul(Conjg(L23),Cmq2TpL23) 
Forall(i2=1:3)  CL23Cmq2TpL23(i2,i2) =  Real(CL23Cmq2TpL23(i2,i2),dp) 
 CL23TpL23ml2 = Matmul(Conjg(L23),TpL23ml2) 
 L11adjYeYe = Matmul(L11,adjYeYe) 
 L11adjYeTe = Matmul(L11,adjYeTe) 
 L11CL11REps = Matmul(L11,CL11REps) 
 L11CL11Beps = Matmul(L11,CL11Beps) 
 L11CL11L11 = Matmul(L11,CL11L11) 
 L11CL11L12 = Matmul(L11,CL11L12) 
 L11CL11L13 = Matmul(L11,CL11L13) 
 L11CL11L21 = Matmul(L11,CL11L21) 
 L11CL11L22 = Matmul(L11,CL11L22) 
 L11CL11L23 = Matmul(L11,CL11L23) 
 L11CL11TpYe = Matmul(L11,CL11TpYe) 
 L11CL11TpTe = Matmul(L11,CL11TpTe) 
 L11CL11T11 = Matmul(L11,CL11T11) 
 L11CL11T12 = Matmul(L11,CL11T12) 
 L11CL11T13 = Matmul(L11,CL11T13) 
 L11CL11T21 = Matmul(L11,CL11T21) 
 L11CL11T22 = Matmul(L11,CL11T22) 
 L11CL11T23 = Matmul(L11,CL11T23) 
 L11CL12L12 = Matmul(L11,CL12L12) 
 L11CL12TpYe = Matmul(L11,CL12TpYe) 
 L11CL12TpTe = Matmul(L11,CL12TpTe) 
 L11CL12T12 = Matmul(L11,CL12T12) 
 L11CL13L13 = Matmul(L11,CL13L13) 
 L11CL13TpYe = Matmul(L11,CL13TpYe) 
 L11CL13TpTe = Matmul(L11,CL13TpTe) 
 L11CL13T13 = Matmul(L11,CL13T13) 
 L11CL21TpYd = Matmul(L11,CL21TpYd) 
 L11CL21TpL21 = Matmul(L11,CL21TpL21) 
 L11CL21TpTd = Matmul(L11,CL21TpTd) 
 L11CL21TpT21 = Matmul(L11,CL21TpT21) 
 L11CL22TpYd = Matmul(L11,CL22TpYd) 
 L11CL22TpL22 = Matmul(L11,CL22TpL22) 
 L11CL22TpTd = Matmul(L11,CL22TpTd) 
 L11CL22TpT22 = Matmul(L11,CL22TpT22) 
 L11CL23TpYd = Matmul(L11,CL23TpYd) 
 L11CL23TpL23 = Matmul(L11,CL23TpL23) 
 L11CL23TpTd = Matmul(L11,CL23TpTd) 
 L11CL23TpT23 = Matmul(L11,CL23TpT23) 
 L12adjYeYe = Matmul(L12,adjYeYe) 
 L12adjYeTe = Matmul(L12,adjYeTe) 
 L12CL11L11 = Matmul(L12,CL11L11) 
 L12CL11TpYe = Matmul(L12,CL11TpYe) 
 L12CL11TpTe = Matmul(L12,CL11TpTe) 
 L12CL11T11 = Matmul(L12,CL11T11) 
 L12CL12REps = Matmul(L12,CL12REps) 
 L12CL12Beps = Matmul(L12,CL12Beps) 
 L12CL12L11 = Matmul(L12,CL12L11) 
 L12CL12L12 = Matmul(L12,CL12L12) 
 L12CL12L13 = Matmul(L12,CL12L13) 
 L12CL12L21 = Matmul(L12,CL12L21) 
 L12CL12L22 = Matmul(L12,CL12L22) 
 L12CL12L23 = Matmul(L12,CL12L23) 
 L12CL12TpYe = Matmul(L12,CL12TpYe) 
 L12CL12TpTe = Matmul(L12,CL12TpTe) 
 L12CL12T11 = Matmul(L12,CL12T11) 
 L12CL12T12 = Matmul(L12,CL12T12) 
 L12CL12T13 = Matmul(L12,CL12T13) 
 L12CL12T21 = Matmul(L12,CL12T21) 
 L12CL12T22 = Matmul(L12,CL12T22) 
 L12CL12T23 = Matmul(L12,CL12T23) 
 L12CL13L13 = Matmul(L12,CL13L13) 
 L12CL13TpYe = Matmul(L12,CL13TpYe) 
 L12CL13TpTe = Matmul(L12,CL13TpTe) 
 L12CL13T13 = Matmul(L12,CL13T13) 
 L12CL21TpYd = Matmul(L12,CL21TpYd) 
 L12CL21TpL21 = Matmul(L12,CL21TpL21) 
 L12CL21TpTd = Matmul(L12,CL21TpTd) 
 L12CL21TpT21 = Matmul(L12,CL21TpT21) 
 L12CL22TpYd = Matmul(L12,CL22TpYd) 
 L12CL22TpL22 = Matmul(L12,CL22TpL22) 
 L12CL22TpTd = Matmul(L12,CL22TpTd) 
 L12CL22TpT22 = Matmul(L12,CL22TpT22) 
 L12CL23TpYd = Matmul(L12,CL23TpYd) 
 L12CL23TpL23 = Matmul(L12,CL23TpL23) 
 L12CL23TpTd = Matmul(L12,CL23TpTd) 
 L12CL23TpT23 = Matmul(L12,CL23TpT23) 
 L13adjYeYe = Matmul(L13,adjYeYe) 
 L13adjYeTe = Matmul(L13,adjYeTe) 
 L13CL11L11 = Matmul(L13,CL11L11) 
 L13CL11TpYe = Matmul(L13,CL11TpYe) 
 L13CL11TpTe = Matmul(L13,CL11TpTe) 
 L13CL11T11 = Matmul(L13,CL11T11) 
 L13CL12L12 = Matmul(L13,CL12L12) 
 L13CL12TpYe = Matmul(L13,CL12TpYe) 
 L13CL12TpTe = Matmul(L13,CL12TpTe) 
 L13CL12T12 = Matmul(L13,CL12T12) 
 L13CL13REps = Matmul(L13,CL13REps) 
 L13CL13Beps = Matmul(L13,CL13Beps) 
 L13CL13L11 = Matmul(L13,CL13L11) 
 L13CL13L12 = Matmul(L13,CL13L12) 
 L13CL13L13 = Matmul(L13,CL13L13) 
 L13CL13L21 = Matmul(L13,CL13L21) 
 L13CL13L22 = Matmul(L13,CL13L22) 
 L13CL13L23 = Matmul(L13,CL13L23) 
 L13CL13TpYe = Matmul(L13,CL13TpYe) 
 L13CL13TpTe = Matmul(L13,CL13TpTe) 
 L13CL13T11 = Matmul(L13,CL13T11) 
 L13CL13T12 = Matmul(L13,CL13T12) 
 L13CL13T13 = Matmul(L13,CL13T13) 
 L13CL13T21 = Matmul(L13,CL13T21) 
 L13CL13T22 = Matmul(L13,CL13T22) 
 L13CL13T23 = Matmul(L13,CL13T23) 
 L13CL21TpYd = Matmul(L13,CL21TpYd) 
 L13CL21TpL21 = Matmul(L13,CL21TpL21) 
 L13CL21TpTd = Matmul(L13,CL21TpTd) 
 L13CL21TpT21 = Matmul(L13,CL21TpT21) 
 L13CL22TpYd = Matmul(L13,CL22TpYd) 
 L13CL22TpL22 = Matmul(L13,CL22TpL22) 
 L13CL22TpTd = Matmul(L13,CL22TpTd) 
 L13CL22TpT22 = Matmul(L13,CL22TpT22) 
 L13CL23TpYd = Matmul(L13,CL23TpYd) 
 L13CL23TpL23 = Matmul(L13,CL23TpL23) 
 L13CL23TpTd = Matmul(L13,CL23TpTd) 
 L13CL23TpT23 = Matmul(L13,CL23TpT23) 
 L21adjYdYd = Matmul(L21,adjYdYd) 
 L21adjYdTd = Matmul(L21,adjYdTd) 
 L21adjYuYu = Matmul(L21,adjYuYu) 
 L21adjYuTu = Matmul(L21,adjYuTu) 
 L21adjL21REps = Matmul(L21,adjL21REps) 
 L21adjL21Beps = Matmul(L21,adjL21Beps) 
 L21adjL21L11 = Matmul(L21,adjL21L11) 
 L21adjL21L12 = Matmul(L21,adjL21L12) 
 L21adjL21L13 = Matmul(L21,adjL21L13) 
 L21adjL21L21 = Matmul(L21,adjL21L21) 
 L21adjL21L22 = Matmul(L21,adjL21L22) 
 L21adjL21L23 = Matmul(L21,adjL21L23) 
 L21adjL21T11 = Matmul(L21,adjL21T11) 
 L21adjL21T12 = Matmul(L21,adjL21T12) 
 L21adjL21T13 = Matmul(L21,adjL21T13) 
 L21adjL21T21 = Matmul(L21,adjL21T21) 
 L21adjL21T22 = Matmul(L21,adjL21T22) 
 L21adjL21T23 = Matmul(L21,adjL21T23) 
 L21adjL22L22 = Matmul(L21,adjL22L22) 
 L21adjL22T22 = Matmul(L21,adjL22T22) 
 L21adjL23L23 = Matmul(L21,adjL23L23) 
 L21adjL23T23 = Matmul(L21,adjL23T23) 
 L22adjYdYd = Matmul(L22,adjYdYd) 
 L22adjYdTd = Matmul(L22,adjYdTd) 
 L22adjYuYu = Matmul(L22,adjYuYu) 
 L22adjYuTu = Matmul(L22,adjYuTu) 
 L22adjL21L21 = Matmul(L22,adjL21L21) 
 L22adjL21T21 = Matmul(L22,adjL21T21) 
 L22adjL22REps = Matmul(L22,adjL22REps) 
 L22adjL22Beps = Matmul(L22,adjL22Beps) 
 L22adjL22L11 = Matmul(L22,adjL22L11) 
 L22adjL22L12 = Matmul(L22,adjL22L12) 
 L22adjL22L13 = Matmul(L22,adjL22L13) 
 L22adjL22L21 = Matmul(L22,adjL22L21) 
 L22adjL22L22 = Matmul(L22,adjL22L22) 
 L22adjL22L23 = Matmul(L22,adjL22L23) 
 L22adjL22T11 = Matmul(L22,adjL22T11) 
 L22adjL22T12 = Matmul(L22,adjL22T12) 
 L22adjL22T13 = Matmul(L22,adjL22T13) 
 L22adjL22T21 = Matmul(L22,adjL22T21) 
 L22adjL22T22 = Matmul(L22,adjL22T22) 
 L22adjL22T23 = Matmul(L22,adjL22T23) 
 L22adjL23L23 = Matmul(L22,adjL23L23) 
 L22adjL23T23 = Matmul(L22,adjL23T23) 
 L23adjYdYd = Matmul(L23,adjYdYd) 
 L23adjYdTd = Matmul(L23,adjYdTd) 
 L23adjYuYu = Matmul(L23,adjYuYu) 
 L23adjYuTu = Matmul(L23,adjYuTu) 
 L23adjL21L21 = Matmul(L23,adjL21L21) 
 L23adjL21T21 = Matmul(L23,adjL21T21) 
 L23adjL22L22 = Matmul(L23,adjL22L22) 
 L23adjL22T22 = Matmul(L23,adjL22T22) 
 L23adjL23REps = Matmul(L23,adjL23REps) 
 L23adjL23Beps = Matmul(L23,adjL23Beps) 
 L23adjL23L11 = Matmul(L23,adjL23L11) 
 L23adjL23L12 = Matmul(L23,adjL23L12) 
 L23adjL23L13 = Matmul(L23,adjL23L13) 
 L23adjL23L21 = Matmul(L23,adjL23L21) 
 L23adjL23L22 = Matmul(L23,adjL23L22) 
 L23adjL23L23 = Matmul(L23,adjL23L23) 
 L23adjL23T11 = Matmul(L23,adjL23T11) 
 L23adjL23T12 = Matmul(L23,adjL23T12) 
 L23adjL23T13 = Matmul(L23,adjL23T13) 
 L23adjL23T21 = Matmul(L23,adjL23T21) 
 L23adjL23T22 = Matmul(L23,adjL23T22) 
 L23adjL23T23 = Matmul(L23,adjL23T23) 
 TdadjYdYd = Matmul(Td,adjYdYd) 
 TdadjYuYu = Matmul(Td,adjYuYu) 
 TdadjL21REps = Matmul(Td,adjL21REps) 
 TdadjL21L21 = Matmul(Td,adjL21L21) 
 TdadjL22REps = Matmul(Td,adjL22REps) 
 TdadjL22L22 = Matmul(Td,adjL22L22) 
 TdadjL23REps = Matmul(Td,adjL23REps) 
 TdadjL23L23 = Matmul(Td,adjL23L23) 
 TeadjYeYe = Matmul(Te,adjYeYe) 
 TeCL11REps = Matmul(Te,CL11REps) 
 TeCL11L11 = Matmul(Te,CL11L11) 
 TeCL12REps = Matmul(Te,CL12REps) 
 TeCL12L12 = Matmul(Te,CL12L12) 
 TeCL13REps = Matmul(Te,CL13REps) 
 TeCL13L13 = Matmul(Te,CL13L13) 
 TeCL21TpL21 = Matmul(Te,CL21TpL21) 
 TeCL22TpL22 = Matmul(Te,CL22TpL22) 
 TeCL23TpL23 = Matmul(Te,CL23TpL23) 
 TuadjYdYd = Matmul(Tu,adjYdYd) 
 TuadjYuYu = Matmul(Tu,adjYuYu) 
 TuadjL21L21 = Matmul(Tu,adjL21L21) 
 TuadjL22L22 = Matmul(Tu,adjL22L22) 
 TuadjL23L23 = Matmul(Tu,adjL23L23) 
 TpYeCYeREps = Matmul(Transpose(Ye),CYeREps) 
 TpYeCYeBeps = Matmul(Transpose(Ye),CYeBeps) 
 TpYeCYeL11 = Matmul(Transpose(Ye),CYeL11) 
 TpYeCYeL12 = Matmul(Transpose(Ye),CYeL12) 
 TpYeCYeL13 = Matmul(Transpose(Ye),CYeL13) 
 TpYeCYeL21 = Matmul(Transpose(Ye),CYeL21) 
 TpYeCYeL22 = Matmul(Transpose(Ye),CYeL22) 
 TpYeCYeL23 = Matmul(Transpose(Ye),CYeL23) 
 TpYeCYeT11 = Matmul(Transpose(Ye),CYeT11) 
 TpYeCYeT12 = Matmul(Transpose(Ye),CYeT12) 
 TpYeCYeT13 = Matmul(Transpose(Ye),CYeT13) 
 TpYeCYeT21 = Matmul(Transpose(Ye),CYeT21) 
 TpYeCYeT22 = Matmul(Transpose(Ye),CYeT22) 
 TpYeCYeT23 = Matmul(Transpose(Ye),CYeT23) 
 TpL21CL11TpTe = Matmul(Transpose(L21),CL11TpTe) 
 TpL21CL12TpTe = Matmul(Transpose(L21),CL12TpTe) 
 TpL21CL13TpTe = Matmul(Transpose(L21),CL13TpTe) 
 TpL21CL21TpTd = Matmul(Transpose(L21),CL21TpTd) 
 TpL21CL22TpTd = Matmul(Transpose(L21),CL22TpTd) 
 TpL21CL23TpTd = Matmul(Transpose(L21),CL23TpTd) 
 TpL22CL11TpTe = Matmul(Transpose(L22),CL11TpTe) 
 TpL22CL12TpTe = Matmul(Transpose(L22),CL12TpTe) 
 TpL22CL13TpTe = Matmul(Transpose(L22),CL13TpTe) 
 TpL22CL21TpTd = Matmul(Transpose(L22),CL21TpTd) 
 TpL22CL22TpTd = Matmul(Transpose(L22),CL22TpTd) 
 TpL22CL23TpTd = Matmul(Transpose(L22),CL23TpTd) 
 TpL23CL11TpTe = Matmul(Transpose(L23),CL11TpTe) 
 TpL23CL12TpTe = Matmul(Transpose(L23),CL12TpTe) 
 TpL23CL13TpTe = Matmul(Transpose(L23),CL13TpTe) 
 TpL23CL21TpTd = Matmul(Transpose(L23),CL21TpTd) 
 TpL23CL22TpTd = Matmul(Transpose(L23),CL22TpTd) 
 TpL23CL23TpTd = Matmul(Transpose(L23),CL23TpTd) 
 TpTeCYeREps = Matmul(Transpose(Te),CYeREps) 
 TpTeCYeL11 = Matmul(Transpose(Te),CYeL11) 
 TpTeCYeL12 = Matmul(Transpose(Te),CYeL12) 
 TpTeCYeL13 = Matmul(Transpose(Te),CYeL13) 
 TpTeCYeL21 = Matmul(Transpose(Te),CYeL21) 
 TpTeCYeL22 = Matmul(Transpose(Te),CYeL22) 
 TpTeCYeL23 = Matmul(Transpose(Te),CYeL23) 
 T11adjYeYe = Matmul(T11,adjYeYe) 
 T11CL11REps = Matmul(T11,CL11REps) 
 T11CL11L11 = Matmul(T11,CL11L11) 
 T11CL11L12 = Matmul(T11,CL11L12) 
 T11CL11L13 = Matmul(T11,CL11L13) 
 T11CL11L21 = Matmul(T11,CL11L21) 
 T11CL11L22 = Matmul(T11,CL11L22) 
 T11CL11L23 = Matmul(T11,CL11L23) 
 T11CL12L12 = Matmul(T11,CL12L12) 
 T11CL13L13 = Matmul(T11,CL13L13) 
 T11CL21TpL21 = Matmul(T11,CL21TpL21) 
 T11CL22TpL22 = Matmul(T11,CL22TpL22) 
 T11CL23TpL23 = Matmul(T11,CL23TpL23) 
 T12adjYeYe = Matmul(T12,adjYeYe) 
 T12CL11L11 = Matmul(T12,CL11L11) 
 T12CL12REps = Matmul(T12,CL12REps) 
 T12CL12L11 = Matmul(T12,CL12L11) 
 T12CL12L12 = Matmul(T12,CL12L12) 
 T12CL12L13 = Matmul(T12,CL12L13) 
 T12CL12L21 = Matmul(T12,CL12L21) 
 T12CL12L22 = Matmul(T12,CL12L22) 
 T12CL12L23 = Matmul(T12,CL12L23) 
 T12CL13L13 = Matmul(T12,CL13L13) 
 T12CL21TpL21 = Matmul(T12,CL21TpL21) 
 T12CL22TpL22 = Matmul(T12,CL22TpL22) 
 T12CL23TpL23 = Matmul(T12,CL23TpL23) 
 T13adjYeYe = Matmul(T13,adjYeYe) 
 T13CL11L11 = Matmul(T13,CL11L11) 
 T13CL12L12 = Matmul(T13,CL12L12) 
 T13CL13REps = Matmul(T13,CL13REps) 
 T13CL13L11 = Matmul(T13,CL13L11) 
 T13CL13L12 = Matmul(T13,CL13L12) 
 T13CL13L13 = Matmul(T13,CL13L13) 
 T13CL13L21 = Matmul(T13,CL13L21) 
 T13CL13L22 = Matmul(T13,CL13L22) 
 T13CL13L23 = Matmul(T13,CL13L23) 
 T13CL21TpL21 = Matmul(T13,CL21TpL21) 
 T13CL22TpL22 = Matmul(T13,CL22TpL22) 
 T13CL23TpL23 = Matmul(T13,CL23TpL23) 
 T21adjYdYd = Matmul(T21,adjYdYd) 
 T21adjYuYu = Matmul(T21,adjYuYu) 
 T21adjL21REps = Matmul(T21,adjL21REps) 
 T21adjL21L11 = Matmul(T21,adjL21L11) 
 T21adjL21L12 = Matmul(T21,adjL21L12) 
 T21adjL21L13 = Matmul(T21,adjL21L13) 
 T21adjL21L21 = Matmul(T21,adjL21L21) 
 T21adjL21L22 = Matmul(T21,adjL21L22) 
 T21adjL21L23 = Matmul(T21,adjL21L23) 
 T21adjL22L22 = Matmul(T21,adjL22L22) 
 T21adjL23L23 = Matmul(T21,adjL23L23) 
 T22adjYdYd = Matmul(T22,adjYdYd) 
 T22adjYuYu = Matmul(T22,adjYuYu) 
 T22adjL21L21 = Matmul(T22,adjL21L21) 
 T22adjL22REps = Matmul(T22,adjL22REps) 
 T22adjL22L11 = Matmul(T22,adjL22L11) 
 T22adjL22L12 = Matmul(T22,adjL22L12) 
 T22adjL22L13 = Matmul(T22,adjL22L13) 
 T22adjL22L21 = Matmul(T22,adjL22L21) 
 T22adjL22L22 = Matmul(T22,adjL22L22) 
 T22adjL22L23 = Matmul(T22,adjL22L23) 
 T22adjL23L23 = Matmul(T22,adjL23L23) 
 T23adjYdYd = Matmul(T23,adjYdYd) 
 T23adjYuYu = Matmul(T23,adjYuYu) 
 T23adjL21L21 = Matmul(T23,adjL21L21) 
 T23adjL22L22 = Matmul(T23,adjL22L22) 
 T23adjL23REps = Matmul(T23,adjL23REps) 
 T23adjL23L11 = Matmul(T23,adjL23L11) 
 T23adjL23L12 = Matmul(T23,adjL23L12) 
 T23adjL23L13 = Matmul(T23,adjL23L13) 
 T23adjL23L21 = Matmul(T23,adjL23L21) 
 T23adjL23L22 = Matmul(T23,adjL23L22) 
 T23adjL23L23 = Matmul(T23,adjL23L23) 
 Trmd2 = Real(cTrace(md2),dp) 
 Trme2 = Real(cTrace(me2),dp) 
 Trml2 = Real(cTrace(ml2),dp) 
 Trmq2 = Real(cTrace(mq2),dp) 
 Trmu2 = Real(cTrace(mu2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TradjYdTd = cTrace(adjYdTd) 
 TradjYeTe = cTrace(adjYeTe) 
 TradjYuTu = cTrace(adjYuTu) 
 TradjL21T21 = cTrace(adjL21T21) 
 TradjL21T22 = cTrace(adjL21T22) 
 TradjL21T23 = cTrace(adjL21T23) 
 TradjL22T21 = cTrace(adjL22T21) 
 TradjL22T22 = cTrace(adjL22T22) 
 TradjL22T23 = cTrace(adjL22T23) 
 TradjL23T21 = cTrace(adjL23T21) 
 TradjL23T22 = cTrace(adjL23T22) 
 TradjL23T23 = cTrace(adjL23T23) 
 TrCL11L11 = cTrace(CL11L11) 
 TrCL11L12 = cTrace(CL11L12) 
 TrCL11L13 = cTrace(CL11L13) 
 TrCL11T11 = cTrace(CL11T11) 
 TrCL11T12 = cTrace(CL11T12) 
 TrCL11T13 = cTrace(CL11T13) 
 TrCL12L11 = cTrace(CL12L11) 
 TrCL12L12 = cTrace(CL12L12) 
 TrCL12L13 = cTrace(CL12L13) 
 TrCL12T11 = cTrace(CL12T11) 
 TrCL12T12 = cTrace(CL12T12) 
 TrCL12T13 = cTrace(CL12T13) 
 TrCL13L11 = cTrace(CL13L11) 
 TrCL13L12 = cTrace(CL13L12) 
 TrCL13L13 = cTrace(CL13L13) 
 TrCL13T11 = cTrace(CL13T11) 
 TrCL13T12 = cTrace(CL13T12) 
 TrCL13T13 = cTrace(CL13T13) 
 TrCL21TpL21 = Real(cTrace(CL21TpL21),dp) 
 TrCL21TpL22 = cTrace(CL21TpL22) 
 TrCL21TpL23 = cTrace(CL21TpL23) 
 TrCL22TpL21 = cTrace(CL22TpL21) 
 TrCL22TpL22 = Real(cTrace(CL22TpL22),dp) 
 TrCL22TpL23 = cTrace(CL22TpL23) 
 TrCL23TpL21 = cTrace(CL23TpL21) 
 TrCL23TpL22 = cTrace(CL23TpL22) 
 TrCL23TpL23 = Real(cTrace(CL23TpL23),dp) 
 TrCTdTpTd = Real(cTrace(CTdTpTd),dp) 
 TrCTeTpTe = Real(cTrace(CTeTpTe),dp) 
 TrCTuTpTu = Real(cTrace(CTuTpTu),dp) 
 TrCT11T11 = cTrace(CT11T11) 
 TrCT11T12 = cTrace(CT11T12) 
 TrCT11T13 = cTrace(CT11T13) 
 TrCT12T11 = cTrace(CT12T11) 
 TrCT12T12 = cTrace(CT12T12) 
 TrCT12T13 = cTrace(CT12T13) 
 TrCT13T11 = cTrace(CT13T11) 
 TrCT13T12 = cTrace(CT13T12) 
 TrCT13T13 = cTrace(CT13T13) 
 TrCT21TpT21 = Real(cTrace(CT21TpT21),dp) 
 TrCT21TpT22 = cTrace(CT21TpT22) 
 TrCT21TpT23 = cTrace(CT21TpT23) 
 TrCT22TpT21 = cTrace(CT22TpT21) 
 TrCT22TpT22 = Real(cTrace(CT22TpT22),dp) 
 TrCT22TpT23 = cTrace(CT22TpT23) 
 TrCT23TpT21 = cTrace(CT23TpT21) 
 TrCT23TpT22 = cTrace(CT23TpT22) 
 TrCT23TpT23 = Real(cTrace(CT23TpT23),dp) 
 Trmd2YdadjYd = cTrace(md2YdadjYd) 
 Trme2YeadjYe = cTrace(me2YeadjYe) 
 Trml2adjYeYe = cTrace(ml2adjYeYe) 
 Trml2CL11L11 = cTrace(ml2CL11L11) 
 Trml2CL11L12 = cTrace(ml2CL11L12) 
 Trml2CL11L13 = cTrace(ml2CL11L13) 
 Trml2CL12L11 = cTrace(ml2CL12L11) 
 Trml2CL12L12 = cTrace(ml2CL12L12) 
 Trml2CL12L13 = cTrace(ml2CL12L13) 
 Trml2CL13L11 = cTrace(ml2CL13L11) 
 Trml2CL13L12 = cTrace(ml2CL13L12) 
 Trml2CL13L13 = cTrace(ml2CL13L13) 
 Trml2CL21TpL21 = cTrace(ml2CL21TpL21) 
 Trml2CL21TpL22 = cTrace(ml2CL21TpL22) 
 Trml2CL21TpL23 = cTrace(ml2CL21TpL23) 
 Trml2CL22TpL21 = cTrace(ml2CL22TpL21) 
 Trml2CL22TpL22 = cTrace(ml2CL22TpL22) 
 Trml2CL22TpL23 = cTrace(ml2CL22TpL23) 
 Trml2CL23TpL21 = cTrace(ml2CL23TpL21) 
 Trml2CL23TpL22 = cTrace(ml2CL23TpL22) 
 Trml2CL23TpL23 = cTrace(ml2CL23TpL23) 
 Trmq2adjYdYd = cTrace(mq2adjYdYd) 
 Trmq2adjYuYu = cTrace(mq2adjYuYu) 
 Trmq2adjL21L21 = cTrace(mq2adjL21L21) 
 Trmq2adjL21L22 = cTrace(mq2adjL21L22) 
 Trmq2adjL21L23 = cTrace(mq2adjL21L23) 
 Trmq2adjL22L21 = cTrace(mq2adjL22L21) 
 Trmq2adjL22L22 = cTrace(mq2adjL22L22) 
 Trmq2adjL22L23 = cTrace(mq2adjL22L23) 
 Trmq2adjL23L21 = cTrace(mq2adjL23L21) 
 Trmq2adjL23L22 = cTrace(mq2adjL23L22) 
 Trmq2adjL23L23 = cTrace(mq2adjL23L23) 
 Trmu2YuadjYu = cTrace(mu2YuadjYu) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
Do i1=1,3
  Do i2=1,3
DyYdadjL211i1mlHd2i2(i1,i2) = mlHd2(i2)*YdadjL21(1,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYdadjL222i1mlHd2i2(i1,i2) = mlHd2(i2)*YdadjL22(2,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYdadjL233i1mlHd2i2(i1,i2) = mlHd2(i2)*YdadjL23(3,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYeCL111i1mlHd2i2(i1,i2) = mlHd2(i2)*YeCL11(1,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYeCL122i1mlHd2i2(i1,i2) = mlHd2(i2)*YeCL12(2,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYeCL133i1mlHd2i2(i1,i2) = mlHd2(i2)*YeCL13(3,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyadjL21mlHd2i1Yd1i2(i1,i2) = adjL21mlHd2(i1)*Yd(1,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyadjL22mlHd2i1Yd2i2(i1,i2) = adjL22mlHd2(i1)*Yd(2,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyadjL23mlHd2i1Yd3i2(i1,i2) = adjL23mlHd2(i1)*Yd(3,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyCL11mlHd2i1Ye1i2(i1,i2) = CL11mlHd2(i1)*Ye(1,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyCL12mlHd2i1Ye2i2(i1,i2) = CL12mlHd2(i1)*Ye(2,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyCL13mlHd2i1Ye3i2(i1,i2) = CL13mlHd2(i1)*Ye(3,i2) 
  End Do 
End Do 


If (TwoLoopRGE) Then 
End If 
 
 
Tr1(1) = g1*sqrt3ov5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 + Trmq2 -          & 
&  2._dp*(Trmu2))

If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 33._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaYd1(i1,i2) = (-7*g1p2*Yd(i1,i2))/15._dp - 3*g2p2*Yd(i1,i2) - (16*g3p2*Yd(i1,i2))/3._dp +           & 
&  3*TrYdadjYd*Yd(i1,i2) + TrYeadjYe*Yd(i1,i2) + YdadjL21L21(i1,i2) + YdadjL22L22(i1,    & 
& i2) + YdadjL23L23(i1,i2) + 3*YdadjYdYd(i1,i2) + YdadjYuYu(i1,i2)
If (1.eq.i1) Then 
betaYd1(i1,i2) = betaYd1(i1,i2)+2*TrCL21TpL21*Yd(1,i2) + 2*TrCL22TpL21*Yd(2,i2) + 2*TrCL23TpL21*Yd(3,i2) +            & 
&  3*YdadjL21L21(1,i2) + 3*YdadjL22L21(2,i2) + 3*YdadjL23L21(3,i2) - YeCL11L21(1,        & 
& i2) - YeCL12L21(2,i2) - YeCL13L21(3,i2)
End If 
If (2.eq.i1) Then 
betaYd1(i1,i2) = betaYd1(i1,i2)+2*TrCL21TpL22*Yd(1,i2) + 2*TrCL22TpL22*Yd(2,i2) + 2*TrCL23TpL22*Yd(3,i2) +            & 
&  3*YdadjL21L22(1,i2) + 3*YdadjL22L22(2,i2) + 3*YdadjL23L22(3,i2) - YeCL11L22(1,        & 
& i2) - YeCL12L22(2,i2) - YeCL13L22(3,i2)
End If 
If (3.eq.i1) Then 
betaYd1(i1,i2) = betaYd1(i1,i2)+2*TrCL21TpL23*Yd(1,i2) + 2*TrCL22TpL23*Yd(2,i2) + 2*TrCL23TpL23*Yd(3,i2) +            & 
&  3*YdadjL21L23(1,i2) + 3*YdadjL22L23(2,i2) + 3*YdadjL23L23(3,i2) - YeCL11L23(1,        & 
& i2) - YeCL12L23(2,i2) - YeCL13L23(3,i2)
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaYd2(i1,i2) = 0
End Do
End Do

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaYe1(i1,i2) = (-9*g1p2*Ye(i1,i2))/5._dp - 3*g2p2*Ye(i1,i2) + 3*TrYdadjYd*Ye(i1,i2) + TrYeadjYe*Ye(i1,& 
& i2) + 3*YeadjYeYe(i1,i2) - YeCL11L11(i1,i2) - YeCL12L12(i1,i2) - YeCL13L13(i1,         & 
& i2) + 3*YeCL21TpL21(i1,i2) + 3*YeCL22TpL22(i1,i2) + 3*YeCL23TpL23(i1,i2)
If (1.eq.i1) Then 
betaYe1(i1,i2) = betaYe1(i1,i2)-L11CL11TpYe(i2,1) - L11CL12TpYe(i2,2) - L11CL13TpYe(i2,3) - 3*L11CL21TpYd(i2,        & 
& 1) - 3*L11CL22TpYd(i2,2) - 3*L11CL23TpYd(i2,3) - TrCL11L11*Ye(1,i2) - TrCL12L11*Ye(2,  & 
& i2) - TrCL13L11*Ye(3,i2)
End If 
If (2.eq.i1) Then 
betaYe1(i1,i2) = betaYe1(i1,i2)-L12CL11TpYe(i2,1) - L12CL12TpYe(i2,2) - L12CL13TpYe(i2,3) - 3*L12CL21TpYd(i2,        & 
& 1) - 3*L12CL22TpYd(i2,2) - 3*L12CL23TpYd(i2,3) - TrCL11L12*Ye(1,i2) - TrCL12L12*Ye(2,  & 
& i2) - TrCL13L12*Ye(3,i2)
End If 
If (3.eq.i1) Then 
betaYe1(i1,i2) = betaYe1(i1,i2)-L13CL11TpYe(i2,1) - L13CL12TpYe(i2,2) - L13CL13TpYe(i2,3) - 3*L13CL21TpYd(i2,        & 
& 1) - 3*L13CL22TpYd(i2,2) - 3*L13CL23TpYd(i2,3) - TrCL11L13*Ye(1,i2) - TrCL12L13*Ye(2,  & 
& i2) - TrCL13L13*Ye(3,i2)
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaYe2(i1,i2) = 0
End Do
End Do

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! L1 
!-------------------- 
 
Do i1 = 1,3
Do i2 = 1,3
betaL11(i1,i2,1) = L11adjYeYe(i1,i2) - 2*L11CL11L11(i1,i2) - L11CL12L12(i1,i2) - L11CL13L13(i1,          & 
& i2) + 3*L11CL21TpL21(i1,i2) + 3*L11CL22TpL22(i1,i2) + 3*L11CL23TpL23(i1,               & 
& i2) - L12CL12L11(i1,i2) - L13CL13L11(i1,i2) + 3*L21adjL21L11(i1,i2) + 3*L22adjL22L11(i1,& 
& i2) + 3*L23adjL23L11(i1,i2) + TpYeCYeL11(i1,i2) - (9*g1p2*L11(i1,i2))/5._dp -          & 
&  3*g2p2*L11(i1,i2) - TrCL11L11*L11(i1,i2) - TrCL12L11*L12(i1,i2) - TrCL13L11*L13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL11(i1,i2,2) = -L11CL11L12(i1,i2) + L12adjYeYe(i1,i2) - L12CL11L11(i1,i2) - 2*L12CL12L12(i1,         & 
& i2) - L12CL13L13(i1,i2) + 3*L12CL21TpL21(i1,i2) + 3*L12CL22TpL22(i1,i2) +              & 
&  3*L12CL23TpL23(i1,i2) - L13CL13L12(i1,i2) + 3*L21adjL21L12(i1,i2) + 3*L22adjL22L12(i1,& 
& i2) + 3*L23adjL23L12(i1,i2) + TpYeCYeL12(i1,i2) - TrCL11L12*L11(i1,i2) -               & 
&  (9*g1p2*L12(i1,i2))/5._dp - 3*g2p2*L12(i1,i2) - TrCL12L12*L12(i1,i2) - TrCL13L12*L13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL11(i1,i2,3) = -L11CL11L13(i1,i2) - L12CL12L13(i1,i2) + L13adjYeYe(i1,i2) - L13CL11L11(i1,           & 
& i2) - L13CL12L12(i1,i2) - 2*L13CL13L13(i1,i2) + 3*L13CL21TpL21(i1,i2) + 3*L13CL22TpL22(i1,& 
& i2) + 3*L13CL23TpL23(i1,i2) + 3*L21adjL21L13(i1,i2) + 3*L22adjL22L13(i1,               & 
& i2) + 3*L23adjL23L13(i1,i2) + TpYeCYeL13(i1,i2) - TrCL11L13*L11(i1,i2) -               & 
&  TrCL12L13*L12(i1,i2) - (9*g1p2*L13(i1,i2))/5._dp - 3*g2p2*L13(i1,i2) - TrCL13L13*L13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaL11(i1,i2,i3) = betaL11(i1,i2,i3)-3*CYdTpL21(1,i2)*Ye(i3,i1) - 3*CYdTpL22(2,i2)*Ye(i3,i1) - 3*CYdTpL23(3,              & 
& i2)*Ye(i3,i1) + CYeL11(1,i2)*Ye(i3,i1) + CYeL12(2,i2)*Ye(i3,i1) + CYeL13(3,            & 
& i2)*Ye(i3,i1) + 3*CYdTpL21(1,i1)*Ye(i3,i2) + 3*CYdTpL22(2,i1)*Ye(i3,i2) +              & 
&  3*CYdTpL23(3,i1)*Ye(i3,i2) - CYeL11(1,i1)*Ye(i3,i2) - CYeL12(2,i1)*Ye(i3,             & 
& i2) - CYeL13(3,i1)*Ye(i3,i2) + 2*YeadjYe(i3,1)*L11(i1,i2) + 2*YeadjYe(i3,              & 
& 2)*L12(i1,i2) + 2*YeadjYe(i3,3)*L13(i1,i2)
End Do
End Do
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
Do i2 = 1,3
betaL12(i1,i2,1) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL12(i1,i2,2) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL12(i1,i2,3) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaL12(i1,i2,i3) = betaL12(i1,i2,i3)+(0)
End Do
End Do
End Do

 
DL1 = oo16pi2*( betaL11 + oo16pi2 * betaL12 ) 

 
Else 
DL1 = oo16pi2* betaL11 
End If 
 
 
!-------------------- 
! L2 
!-------------------- 
 
Do i1 = 1,3
Do i2 = 1,3
betaL21(i1,i2,1) = -L11CL11L21(i1,i2) - L12CL12L21(i1,i2) - L13CL13L21(i1,i2) + 4*L21adjL21L21(i1,       & 
& i2) + L21adjL22L22(i1,i2) + L21adjL23L23(i1,i2) + L21adjYdYd(i1,i2) + L21adjYuYu(i1,   & 
& i2) + 3*L22adjL22L21(i1,i2) + 3*L23adjL23L21(i1,i2) + TpYeCYeL21(i1,i2) -              & 
&  (7*g1p2*L21(i1,i2))/15._dp - 3*g2p2*L21(i1,i2) - (16*g3p2*L21(i1,i2))/3._dp +         & 
&  2*TrCL21TpL21*L21(i1,i2) + 2*TrCL22TpL21*L22(i1,i2) + 2*TrCL23TpL21*L23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL21(i1,i2,2) = -L11CL11L22(i1,i2) - L12CL12L22(i1,i2) - L13CL13L22(i1,i2) + 3*L21adjL21L22(i1,       & 
& i2) + L22adjL21L21(i1,i2) + 4*L22adjL22L22(i1,i2) + L22adjL23L23(i1,i2) +              & 
&  L22adjYdYd(i1,i2) + L22adjYuYu(i1,i2) + 3*L23adjL23L22(i1,i2) + TpYeCYeL22(i1,        & 
& i2) + 2*TrCL21TpL22*L21(i1,i2) - (7*g1p2*L22(i1,i2))/15._dp - 3*g2p2*L22(i1,           & 
& i2) - (16*g3p2*L22(i1,i2))/3._dp + 2*TrCL22TpL22*L22(i1,i2) + 2*TrCL23TpL22*L23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL21(i1,i2,3) = -L11CL11L23(i1,i2) - L12CL12L23(i1,i2) - L13CL13L23(i1,i2) + 3*L21adjL21L23(i1,       & 
& i2) + 3*L22adjL22L23(i1,i2) + L23adjL21L21(i1,i2) + L23adjL22L22(i1,i2) +              & 
&  4*L23adjL23L23(i1,i2) + L23adjYdYd(i1,i2) + L23adjYuYu(i1,i2) + TpYeCYeL23(i1,        & 
& i2) + 2*TrCL21TpL23*L21(i1,i2) + 2*TrCL22TpL23*L22(i1,i2) - (7*g1p2*L23(i1,            & 
& i2))/15._dp - 3*g2p2*L23(i1,i2) - (16*g3p2*L23(i1,i2))/3._dp + 2*TrCL23TpL23*L23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaL21(i1,i2,i3) = betaL21(i1,i2,i3)+3*CYdTpL21(1,i1)*Yd(i3,i2) + 3*CYdTpL22(2,i1)*Yd(i3,i2) + 3*CYdTpL23(3,               & 
& i1)*Yd(i3,i2) - CYeL11(1,i1)*Yd(i3,i2) - CYeL12(2,i1)*Yd(i3,i2) - CYeL13(3,            & 
& i1)*Yd(i3,i2) + 2*YdadjYd(i3,1)*L21(i1,i2) + 2*YdadjYd(i3,2)*L22(i1,i2) +              & 
&  2*YdadjYd(i3,3)*L23(i1,i2)
End Do
End Do
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
Do i2 = 1,3
betaL22(i1,i2,1) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL22(i1,i2,2) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL22(i1,i2,3) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaL22(i1,i2,i3) = betaL22(i1,i2,i3)+(0)
End Do
End Do
End Do

 
DL2 = oo16pi2*( betaL21 + oo16pi2 * betaL22 ) 

 
Else 
DL2 = oo16pi2* betaL21 
End If 
 
 
!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = -((13._dp*(g1p2) + 45._dp*(g2p2) + 80._dp*(g3p2) - 45._dp*(TrYuadjYu))     & 
& *Yu)/15._dp + YuadjL21L21 + YuadjL22L22 + YuadjL23L23 + YuadjYdYd + 3._dp*(YuadjYuYu)

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Mu 
!-------------------- 
 
betaMu1  = (-3*g1p2*Mu)/5._dp - 3*g2p2*Mu + 3*TrYdadjYd*Mu + TrYeadjYe*Mu +           & 
&  3*TrYuadjYu*Mu - 3*YdadjL21REps(1) - 3*YdadjL22REps(2) - 3*YdadjL23REps(3)            & 
&  + YeCL11REps(1) + YeCL12REps(2) + YeCL13REps(3)

 
 
If (TwoLoopRGE) Then 
betaMu2 = 0

 
DMu = oo16pi2*( betaMu1 + oo16pi2 * betaMu2 ) 

 
Else 
DMu = oo16pi2* betaMu1 
End If 
 
 
Call Chop(DMu) 

!-------------------- 
! REps 
!-------------------- 
 
Do i1 = 1,3
betaREps1(i1) = -3*Mu*CYdTpL21(1,i1) - 3*Mu*CYdTpL22(2,i1) - 3*Mu*CYdTpL23(3,i1) + Mu*CYeL11(1,       & 
& i1) + Mu*CYeL12(2,i1) + Mu*CYeL13(3,i1) - L11CL11REps(i1) - L12CL12REps(i1) -          & 
&  L13CL13REps(i1) + 3*L21adjL21REps(i1) + 3*L22adjL22REps(i1) + 3*L23adjL23REps(i1) +   & 
&  TpYeCYeREps(i1) - (3*g1p2*REps(i1))/5._dp - 3*g2p2*REps(i1) + 3*TrYuadjYu*REps(i1)
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
betaREps2(i1) = 0
End Do

 
DREps = oo16pi2*( betaREps1 + oo16pi2 * betaREps2 ) 

 
Else 
DREps = oo16pi2* betaREps1 
End If 
 
 
Call Chop(DREps) 

!-------------------- 
! Td 
!-------------------- 
 
betaTd1 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaTd1(i1,i2) = TdadjL21L21(i1,i2) + TdadjL22L22(i1,i2) + TdadjL23L23(i1,i2) + 5*TdadjYdYd(i1,        & 
& i2) + TdadjYuYu(i1,i2) + (14*g1p2*M1*Yd(i1,i2))/15._dp + (32*g3p2*M3*Yd(i1,            & 
& i2))/3._dp + 6*g2p2*M2*Yd(i1,i2) + 6*TradjYdTd*Yd(i1,i2) + 2*TradjYeTe*Yd(i1,          & 
& i2) + 2*YdadjL21T21(i1,i2) + 2*YdadjL22T22(i1,i2) + 2*YdadjL23T23(i1,i2) +             & 
&  4*YdadjYdTd(i1,i2) + 2*YdadjYuTu(i1,i2) - (7*g1p2*Td(i1,i2))/15._dp - 3*g2p2*Td(i1,   & 
& i2) - (16*g3p2*Td(i1,i2))/3._dp + 3*TrYdadjYd*Td(i1,i2) + TrYeadjYe*Td(i1,i2)
If (1.eq.i1) Then 
betaTd1(i1,i2) = betaTd1(i1,i2)+2*TpL21CL11TpTe(i2,1) + 2*TpL21CL12TpTe(i2,2) + 2*TpL21CL13TpTe(i2,3) +               & 
&  6*TpL21CL21TpTd(i2,1) + 6*TpL21CL22TpTd(i2,2) + 6*TpL21CL23TpTd(i2,3) +               & 
&  4*TradjL21T21*Yd(1,i2) + 4*TradjL22T21*Yd(2,i2) + 4*TradjL23T21*Yd(3,i2) +            & 
&  3*YdadjL21T21(1,i2) + 3*YdadjL22T21(2,i2) + 3*YdadjL23T21(3,i2) - YeCL11T21(1,        & 
& i2) - YeCL12T21(2,i2) - YeCL13T21(3,i2) + 2*TrCL21TpL21*Td(1,i2) + 2*TrCL22TpL21*Td(2, & 
& i2) + 2*TrCL23TpL21*Td(3,i2)
End If 
If (2.eq.i1) Then 
betaTd1(i1,i2) = betaTd1(i1,i2)+2*TpL22CL11TpTe(i2,1) + 2*TpL22CL12TpTe(i2,2) + 2*TpL22CL13TpTe(i2,3) +               & 
&  6*TpL22CL21TpTd(i2,1) + 6*TpL22CL22TpTd(i2,2) + 6*TpL22CL23TpTd(i2,3) +               & 
&  4*TradjL21T22*Yd(1,i2) + 4*TradjL22T22*Yd(2,i2) + 4*TradjL23T22*Yd(3,i2) +            & 
&  3*YdadjL21T22(1,i2) + 3*YdadjL22T22(2,i2) + 3*YdadjL23T22(3,i2) - YeCL11T22(1,        & 
& i2) - YeCL12T22(2,i2) - YeCL13T22(3,i2) + 2*TrCL21TpL22*Td(1,i2) + 2*TrCL22TpL22*Td(2, & 
& i2) + 2*TrCL23TpL22*Td(3,i2)
End If 
If (3.eq.i1) Then 
betaTd1(i1,i2) = betaTd1(i1,i2)+2*TpL23CL11TpTe(i2,1) + 2*TpL23CL12TpTe(i2,2) + 2*TpL23CL13TpTe(i2,3) +               & 
&  6*TpL23CL21TpTd(i2,1) + 6*TpL23CL22TpTd(i2,2) + 6*TpL23CL23TpTd(i2,3) +               & 
&  4*TradjL21T23*Yd(1,i2) + 4*TradjL22T23*Yd(2,i2) + 4*TradjL23T23*Yd(3,i2) +            & 
&  3*YdadjL21T23(1,i2) + 3*YdadjL22T23(2,i2) + 3*YdadjL23T23(3,i2) - YeCL11T23(1,        & 
& i2) - YeCL12T23(2,i2) - YeCL13T23(3,i2) + 2*TrCL21TpL23*Td(1,i2) + 2*TrCL22TpL23*Td(2, & 
& i2) + 2*TrCL23TpL23*Td(3,i2)
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betaTd2 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaTd2(i1,i2) = 0
End Do
End Do

 
DTd = oo16pi2*( betaTd1 + oo16pi2 * betaTd2 ) 

 
Else 
DTd = oo16pi2* betaTd1 
End If 
 
 
Call Chop(DTd) 

!-------------------- 
! Te 
!-------------------- 
 
betaTe1 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaTe1(i1,i2) = 5*TeadjYeYe(i1,i2) - TeCL11L11(i1,i2) - TeCL12L12(i1,i2) - TeCL13L13(i1,              & 
& i2) + 3*TeCL21TpL21(i1,i2) + 3*TeCL22TpL22(i1,i2) + 3*TeCL23TpL23(i1,i2) +             & 
&  (18*g1p2*M1*Ye(i1,i2))/5._dp + 6*g2p2*M2*Ye(i1,i2) + 6*TradjYdTd*Ye(i1,               & 
& i2) + 2*TradjYeTe*Ye(i1,i2) + 4*YeadjYeTe(i1,i2) - 2*YeCL11T11(i1,i2) - 2*YeCL12T12(i1,& 
& i2) - 2*YeCL13T13(i1,i2) + 6*YeCL21TpT21(i1,i2) + 6*YeCL22TpT22(i1,i2) +               & 
&  6*YeCL23TpT23(i1,i2) - (9*g1p2*Te(i1,i2))/5._dp - 3*g2p2*Te(i1,i2) + 3*TrYdadjYd*Te(i1,& 
& i2) + TrYeadjYe*Te(i1,i2)
If (1.eq.i1) Then 
betaTe1(i1,i2) = betaTe1(i1,i2)-2*L11CL11TpTe(i2,1) - 2*L11CL12TpTe(i2,2) - 2*L11CL13TpTe(i2,3) - 6*L11CL21TpTd(i2,  & 
& 1) - 6*L11CL22TpTd(i2,2) - 6*L11CL23TpTd(i2,3) + 3*YdadjL21T11(1,i2) + 3*YdadjL22T11(2,& 
& i2) + 3*YdadjL23T11(3,i2) - 2*TrCL11T11*Ye(1,i2) - 2*TrCL12T11*Ye(2,i2) -              & 
&  2*TrCL13T11*Ye(3,i2) - YeCL11T11(1,i2) - YeCL12T11(2,i2) - YeCL13T11(3,               & 
& i2) - TrCL11L11*Te(1,i2) - TrCL12L11*Te(2,i2) - TrCL13L11*Te(3,i2)
End If 
If (2.eq.i1) Then 
betaTe1(i1,i2) = betaTe1(i1,i2)-2*L12CL11TpTe(i2,1) - 2*L12CL12TpTe(i2,2) - 2*L12CL13TpTe(i2,3) - 6*L12CL21TpTd(i2,  & 
& 1) - 6*L12CL22TpTd(i2,2) - 6*L12CL23TpTd(i2,3) + 3*YdadjL21T12(1,i2) + 3*YdadjL22T12(2,& 
& i2) + 3*YdadjL23T12(3,i2) - 2*TrCL11T12*Ye(1,i2) - 2*TrCL12T12*Ye(2,i2) -              & 
&  2*TrCL13T12*Ye(3,i2) - YeCL11T12(1,i2) - YeCL12T12(2,i2) - YeCL13T12(3,               & 
& i2) - TrCL11L12*Te(1,i2) - TrCL12L12*Te(2,i2) - TrCL13L12*Te(3,i2)
End If 
If (3.eq.i1) Then 
betaTe1(i1,i2) = betaTe1(i1,i2)-2*L13CL11TpTe(i2,1) - 2*L13CL12TpTe(i2,2) - 2*L13CL13TpTe(i2,3) - 6*L13CL21TpTd(i2,  & 
& 1) - 6*L13CL22TpTd(i2,2) - 6*L13CL23TpTd(i2,3) + 3*YdadjL21T13(1,i2) + 3*YdadjL22T13(2,& 
& i2) + 3*YdadjL23T13(3,i2) - 2*TrCL11T13*Ye(1,i2) - 2*TrCL12T13*Ye(2,i2) -              & 
&  2*TrCL13T13*Ye(3,i2) - YeCL11T13(1,i2) - YeCL12T13(2,i2) - YeCL13T13(3,               & 
& i2) - TrCL11L13*Te(1,i2) - TrCL12L13*Te(2,i2) - TrCL13L13*Te(3,i2)
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betaTe2 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaTe2(i1,i2) = 0
End Do
End Do

 
DTe = oo16pi2*( betaTe1 + oo16pi2 * betaTe2 ) 

 
Else 
DTe = oo16pi2* betaTe1 
End If 
 
 
Call Chop(DTe) 

!-------------------- 
! T1 
!-------------------- 
 
Do i1 = 1,3
Do i2 = 1,3
betaT11(i1,i2,1) = 2*L11adjYeTe(i1,i2) - 3*L11CL11T11(i1,i2) - 2*L11CL12T12(i1,i2) - 2*L11CL13T13(i1,    & 
& i2) + 6*L11CL21TpT21(i1,i2) + 6*L11CL22TpT22(i1,i2) + 6*L11CL23TpT23(i1,               & 
& i2) - L12CL12T11(i1,i2) - L13CL13T11(i1,i2) + 3*L21adjL21T11(i1,i2) + 3*L22adjL22T11(i1,& 
& i2) + 3*L23adjL23T11(i1,i2) + T11adjYeYe(i1,i2) - 3*T11CL11L11(i1,i2) - T11CL12L12(i1, & 
& i2) - T11CL13L13(i1,i2) + 3*T11CL21TpL21(i1,i2) + 3*T11CL22TpL22(i1,i2) +              & 
&  3*T11CL23TpL23(i1,i2) - 2*T12CL12L11(i1,i2) - 2*T13CL13L11(i1,i2) + 6*T21adjL21L11(i1,& 
& i2) + 6*T22adjL22L11(i1,i2) + 6*T23adjL23L11(i1,i2) + 2*TpTeCYeL11(i1,i2) +            & 
&  TpYeCYeT11(i1,i2) + (18*g1p2*M1*L11(i1,i2))/5._dp + 6*g2p2*M2*L11(i1,i2) -            & 
&  2*TrCL11T11*L11(i1,i2) - 2*TrCL12T11*L12(i1,i2) - 2*TrCL13T11*L13(i1,i2) -            & 
&  (9*g1p2*T11(i1,i2))/5._dp - 3*g2p2*T11(i1,i2) - TrCL11L11*T11(i1,i2) - TrCL12L11*T12(i1,& 
& i2) - TrCL13L11*T13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT11(i1,i2,2) = -L11CL11T12(i1,i2) + 2*L12adjYeTe(i1,i2) - 2*L12CL11T11(i1,i2) - 3*L12CL12T12(i1,     & 
& i2) - 2*L12CL13T13(i1,i2) + 6*L12CL21TpT21(i1,i2) + 6*L12CL22TpT22(i1,i2) +            & 
&  6*L12CL23TpT23(i1,i2) - L13CL13T12(i1,i2) + 3*L21adjL21T12(i1,i2) + 3*L22adjL22T12(i1,& 
& i2) + 3*L23adjL23T12(i1,i2) - 2*T11CL11L12(i1,i2) + T12adjYeYe(i1,i2) - T12CL11L11(i1, & 
& i2) - 3*T12CL12L12(i1,i2) - T12CL13L13(i1,i2) + 3*T12CL21TpL21(i1,i2) + 3*T12CL22TpL22(i1,& 
& i2) + 3*T12CL23TpL23(i1,i2) - 2*T13CL13L12(i1,i2) + 6*T21adjL21L12(i1,i2) +            & 
&  6*T22adjL22L12(i1,i2) + 6*T23adjL23L12(i1,i2) + 2*TpTeCYeL12(i1,i2) + TpYeCYeT12(i1,  & 
& i2) - 2*TrCL11T12*L11(i1,i2) + (18*g1p2*M1*L12(i1,i2))/5._dp + 6*g2p2*M2*L12(i1,       & 
& i2) - 2*TrCL12T12*L12(i1,i2) - 2*TrCL13T12*L13(i1,i2) - TrCL11L12*T11(i1,              & 
& i2) - (9*g1p2*T12(i1,i2))/5._dp - 3*g2p2*T12(i1,i2) - TrCL12L12*T12(i1,i2) -           & 
&  TrCL13L12*T13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT11(i1,i2,3) = -L11CL11T13(i1,i2) - L12CL12T13(i1,i2) + 2*L13adjYeTe(i1,i2) - 2*L13CL11T11(i1,       & 
& i2) - 2*L13CL12T12(i1,i2) - 3*L13CL13T13(i1,i2) + 6*L13CL21TpT21(i1,i2) +              & 
&  6*L13CL22TpT22(i1,i2) + 6*L13CL23TpT23(i1,i2) + 3*L21adjL21T13(i1,i2) +               & 
&  3*L22adjL22T13(i1,i2) + 3*L23adjL23T13(i1,i2) - 2*T11CL11L13(i1,i2) - 2*T12CL12L13(i1,& 
& i2) + T13adjYeYe(i1,i2) - T13CL11L11(i1,i2) - T13CL12L12(i1,i2) - 3*T13CL13L13(i1,     & 
& i2) + 3*T13CL21TpL21(i1,i2) + 3*T13CL22TpL22(i1,i2) + 3*T13CL23TpL23(i1,               & 
& i2) + 6*T21adjL21L13(i1,i2) + 6*T22adjL22L13(i1,i2) + 6*T23adjL23L13(i1,               & 
& i2) + 2*TpTeCYeL13(i1,i2) + TpYeCYeT13(i1,i2) - 2*TrCL11T13*L11(i1,i2) -               & 
&  2*TrCL12T13*L12(i1,i2) + (18*g1p2*M1*L13(i1,i2))/5._dp + 6*g2p2*M2*L13(i1,            & 
& i2) - 2*TrCL13T13*L13(i1,i2) - TrCL11L13*T11(i1,i2) - TrCL12L13*T12(i1,i2) -           & 
&  (9*g1p2*T13(i1,i2))/5._dp - 3*g2p2*T13(i1,i2) - TrCL13L13*T13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaT11(i1,i2,i3) = betaT11(i1,i2,i3)-6*CYdTpT21(1,i2)*Ye(i3,i1) - 6*CYdTpT22(2,i2)*Ye(i3,i1) - 6*CYdTpT23(3,              & 
& i2)*Ye(i3,i1) + 2*CYeT11(1,i2)*Ye(i3,i1) + 2*CYeT12(2,i2)*Ye(i3,i1) + 2*CYeT13(3,      & 
& i2)*Ye(i3,i1) + 6*CYdTpT21(1,i1)*Ye(i3,i2) + 6*CYdTpT22(2,i1)*Ye(i3,i2) +              & 
&  6*CYdTpT23(3,i1)*Ye(i3,i2) - 2*CYeT11(1,i1)*Ye(i3,i2) - 2*CYeT12(2,i1)*Ye(i3,         & 
& i2) - 2*CYeT13(3,i1)*Ye(i3,i2) + 4*CYeTpTe(1,i3)*L11(i1,i2) + 4*CYeTpTe(2,             & 
& i3)*L12(i1,i2) + 4*CYeTpTe(3,i3)*L13(i1,i2) - 3*CYdTpL21(1,i2)*Te(i3,i1) -             & 
&  3*CYdTpL22(2,i2)*Te(i3,i1) - 3*CYdTpL23(3,i2)*Te(i3,i1) + CYeL11(1,i2)*Te(i3,         & 
& i1) + CYeL12(2,i2)*Te(i3,i1) + CYeL13(3,i2)*Te(i3,i1) + 3*CYdTpL21(1,i1)*Te(i3,        & 
& i2) + 3*CYdTpL22(2,i1)*Te(i3,i2) + 3*CYdTpL23(3,i1)*Te(i3,i2) - CYeL11(1,              & 
& i1)*Te(i3,i2) - CYeL12(2,i1)*Te(i3,i2) - CYeL13(3,i1)*Te(i3,i2) + 2*YeadjYe(i3,        & 
& 1)*T11(i1,i2) + 2*YeadjYe(i3,2)*T12(i1,i2) + 2*YeadjYe(i3,3)*T13(i1,i2)
End Do
End Do
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
Do i2 = 1,3
betaT12(i1,i2,1) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT12(i1,i2,2) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT12(i1,i2,3) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaT12(i1,i2,i3) = betaT12(i1,i2,i3)+(0)
End Do
End Do
End Do

 
DT1 = oo16pi2*( betaT11 + oo16pi2 * betaT12 ) 

 
Else 
DT1 = oo16pi2* betaT11 
End If 
 
 
!-------------------- 
! T2 
!-------------------- 
 
Do i1 = 1,3
Do i2 = 1,3
betaT21(i1,i2,1) = -L11CL11T21(i1,i2) - L12CL12T21(i1,i2) - L13CL13T21(i1,i2) + 5*L21adjL21T21(i1,       & 
& i2) + 2*L21adjL22T22(i1,i2) + 2*L21adjL23T23(i1,i2) + 2*L21adjYdTd(i1,i2) +            & 
&  2*L21adjYuTu(i1,i2) + 3*L22adjL22T21(i1,i2) + 3*L23adjL23T21(i1,i2) - 2*T11CL11L21(i1,& 
& i2) - 2*T12CL12L21(i1,i2) - 2*T13CL13L21(i1,i2) + 7*T21adjL21L21(i1,i2) +              & 
&  T21adjL22L22(i1,i2) + T21adjL23L23(i1,i2) + T21adjYdYd(i1,i2) + T21adjYuYu(i1,        & 
& i2) + 6*T22adjL22L21(i1,i2) + 6*T23adjL23L21(i1,i2) + 2*TpTeCYeL21(i1,i2) +            & 
&  TpYeCYeT21(i1,i2) + (14*g1p2*M1*L21(i1,i2))/15._dp + (32*g3p2*M3*L21(i1,              & 
& i2))/3._dp + 6*g2p2*M2*L21(i1,i2) + 4*TradjL21T21*L21(i1,i2) + 4*TradjL22T21*L22(i1,   & 
& i2) + 4*TradjL23T21*L23(i1,i2) - (7*g1p2*T21(i1,i2))/15._dp - 3*g2p2*T21(i1,           & 
& i2) - (16*g3p2*T21(i1,i2))/3._dp + 2*TrCL21TpL21*T21(i1,i2) + 2*TrCL22TpL21*T22(i1,    & 
& i2) + 2*TrCL23TpL21*T23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT21(i1,i2,2) = -L11CL11T22(i1,i2) - L12CL12T22(i1,i2) - L13CL13T22(i1,i2) + 3*L21adjL21T22(i1,       & 
& i2) + 2*L22adjL21T21(i1,i2) + 5*L22adjL22T22(i1,i2) + 2*L22adjL23T23(i1,               & 
& i2) + 2*L22adjYdTd(i1,i2) + 2*L22adjYuTu(i1,i2) + 3*L23adjL23T22(i1,i2) -              & 
&  2*T11CL11L22(i1,i2) - 2*T12CL12L22(i1,i2) - 2*T13CL13L22(i1,i2) + 6*T21adjL21L22(i1,  & 
& i2) + T22adjL21L21(i1,i2) + 7*T22adjL22L22(i1,i2) + T22adjL23L23(i1,i2) +              & 
&  T22adjYdYd(i1,i2) + T22adjYuYu(i1,i2) + 6*T23adjL23L22(i1,i2) + 2*TpTeCYeL22(i1,      & 
& i2) + TpYeCYeT22(i1,i2) + 4*TradjL21T22*L21(i1,i2) + (14*g1p2*M1*L22(i1,               & 
& i2))/15._dp + (32*g3p2*M3*L22(i1,i2))/3._dp + 6*g2p2*M2*L22(i1,i2) + 4*TradjL22T22*L22(i1,& 
& i2) + 4*TradjL23T22*L23(i1,i2) + 2*TrCL21TpL22*T21(i1,i2) - (7*g1p2*T22(i1,            & 
& i2))/15._dp - 3*g2p2*T22(i1,i2) - (16*g3p2*T22(i1,i2))/3._dp + 2*TrCL22TpL22*T22(i1,   & 
& i2) + 2*TrCL23TpL22*T23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT21(i1,i2,3) = -L11CL11T23(i1,i2) - L12CL12T23(i1,i2) - L13CL13T23(i1,i2) + 3*L21adjL21T23(i1,       & 
& i2) + 3*L22adjL22T23(i1,i2) + 2*L23adjL21T21(i1,i2) + 2*L23adjL22T22(i1,               & 
& i2) + 5*L23adjL23T23(i1,i2) + 2*L23adjYdTd(i1,i2) + 2*L23adjYuTu(i1,i2) -              & 
&  2*T11CL11L23(i1,i2) - 2*T12CL12L23(i1,i2) - 2*T13CL13L23(i1,i2) + 6*T21adjL21L23(i1,  & 
& i2) + 6*T22adjL22L23(i1,i2) + T23adjL21L21(i1,i2) + T23adjL22L22(i1,i2) +              & 
&  7*T23adjL23L23(i1,i2) + T23adjYdYd(i1,i2) + T23adjYuYu(i1,i2) + 2*TpTeCYeL23(i1,      & 
& i2) + TpYeCYeT23(i1,i2) + 4*TradjL21T23*L21(i1,i2) + 4*TradjL22T23*L22(i1,             & 
& i2) + (14*g1p2*M1*L23(i1,i2))/15._dp + (32*g3p2*M3*L23(i1,i2))/3._dp + 6*g2p2*M2*L23(i1,& 
& i2) + 4*TradjL23T23*L23(i1,i2) + 2*TrCL21TpL23*T21(i1,i2) + 2*TrCL22TpL23*T22(i1,      & 
& i2) - (7*g1p2*T23(i1,i2))/15._dp - 3*g2p2*T23(i1,i2) - (16*g3p2*T23(i1,i2))/3._dp +    & 
&  2*TrCL23TpL23*T23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaT21(i1,i2,i3) = betaT21(i1,i2,i3)+6*CYdTpT21(1,i1)*Yd(i3,i2) + 6*CYdTpT22(2,i1)*Yd(i3,i2) + 6*CYdTpT23(3,               & 
& i1)*Yd(i3,i2) - 2*CYeT11(1,i1)*Yd(i3,i2) - 2*CYeT12(2,i1)*Yd(i3,i2) - 2*CYeT13(3,      & 
& i1)*Yd(i3,i2) + 4*CYdTpTd(1,i3)*L21(i1,i2) + 4*CYdTpTd(2,i3)*L22(i1,i2) +              & 
&  4*CYdTpTd(3,i3)*L23(i1,i2) + 3*CYdTpL21(1,i1)*Td(i3,i2) + 3*CYdTpL22(2,               & 
& i1)*Td(i3,i2) + 3*CYdTpL23(3,i1)*Td(i3,i2) - CYeL11(1,i1)*Td(i3,i2) - CYeL12(2,        & 
& i1)*Td(i3,i2) - CYeL13(3,i1)*Td(i3,i2) + 2*YdadjYd(i3,1)*T21(i1,i2) + 2*YdadjYd(i3,    & 
& 2)*T22(i1,i2) + 2*YdadjYd(i3,3)*T23(i1,i2)
End Do
End Do
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
Do i2 = 1,3
betaT22(i1,i2,1) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT22(i1,i2,2) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT22(i1,i2,3) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaT22(i1,i2,i3) = betaT22(i1,i2,i3)+(0)
End Do
End Do
End Do

 
DT2 = oo16pi2*( betaT21 + oo16pi2 * betaT22 ) 

 
Else 
DT2 = oo16pi2* betaT21 
End If 
 
 
!-------------------- 
! Tu 
!-------------------- 
 
betaTu1  = TuadjL21L21 + TuadjL22L22 + TuadjL23L23 + TuadjYdYd + 5._dp*(TuadjYuYu)    & 
&  + (26*g1p2*M1*Yu)/15._dp + (32*g3p2*M3*Yu)/3._dp + 6*g2p2*M2*Yu + 6*TradjYuTu*Yu +    & 
&  2._dp*(YuadjL21T21) + 2._dp*(YuadjL22T22) + 2._dp*(YuadjL23T23) + 2._dp*(YuadjYdTd)   & 
&  + 4._dp*(YuadjYuTu) - (13*g1p2*Tu)/15._dp - 3*g2p2*Tu - (16*g3p2*Tu)/3._dp +          & 
&  3*TrYuadjYu*Tu

 
 
If (TwoLoopRGE) Then 
betaTu2 = 0

 
DTu = oo16pi2*( betaTu1 + oo16pi2 * betaTu2 ) 

 
Else 
DTu = oo16pi2* betaTu1 
End If 
 
 
Call Chop(DTu) 

!-------------------- 
! Bmu 
!-------------------- 
 
betaBmu1  = (6*g1p2*M1*Mu)/5._dp + 6*g2p2*M2*Mu + 6*TradjYdTd*Mu + 2*TradjYeTe*Mu +   & 
&  6*TradjYuTu*Mu - (3*g1p2*Bmu)/5._dp - 3*g2p2*Bmu + 3*TrYdadjYd*Bmu + TrYeadjYe*Bmu +  & 
&  3*TrYuadjYu*Bmu - 6*TdadjL21REps(1) - 6*TdadjL22REps(2) - 6*TdadjL23REps(3)           & 
&  + 2*TeCL11REps(1) + 2*TeCL12REps(2) + 2*TeCL13REps(3) - 3*YdadjL21Beps(1)             & 
&  - 3*YdadjL22Beps(2) - 3*YdadjL23Beps(3) + YeCL11Beps(1) + YeCL12Beps(2)               & 
&  + YeCL13Beps(3)

 
 
If (TwoLoopRGE) Then 
betaBmu2 = 0

 
DBmu = oo16pi2*( betaBmu1 + oo16pi2 * betaBmu2 ) 

 
Else 
DBmu = oo16pi2* betaBmu1 
End If 
 
 
Call Chop(DBmu) 

!-------------------- 
! Beps 
!-------------------- 
 
Do i1 = 1,3
betaBeps1(i1) = -3*Bmu*CYdTpL21(1,i1) - 3*Bmu*CYdTpL22(2,i1) - 3*Bmu*CYdTpL23(3,i1) - 6*Mu*CYdTpT21(1,& 
& i1) - 6*Mu*CYdTpT22(2,i1) - 6*Mu*CYdTpT23(3,i1) + Bmu*CYeL11(1,i1) + Bmu*CYeL12(2,     & 
& i1) + Bmu*CYeL13(3,i1) + 2*Mu*CYeT11(1,i1) + 2*Mu*CYeT12(2,i1) + 2*Mu*CYeT13(3,        & 
& i1) - L11CL11Beps(i1) - L12CL12Beps(i1) - L13CL13Beps(i1) + 3*L21adjL21Beps(i1) +      & 
&  3*L22adjL22Beps(i1) + 3*L23adjL23Beps(i1) - 2*T11CL11REps(i1) - 2*T12CL12REps(i1) -   & 
&  2*T13CL13REps(i1) + 6*T21adjL21REps(i1) + 6*T22adjL22REps(i1) + 6*T23adjL23REps(i1) + & 
&  2*TpTeCYeREps(i1) + TpYeCYeBeps(i1) + (6*g1p2*M1*REps(i1))/5._dp + 6*g2p2*M2*REps(i1) +& 
&  6*TradjYuTu*REps(i1) - (3*g1p2*Beps(i1))/5._dp - 3*g2p2*Beps(i1) + 3*TrYuadjYu*Beps(i1)
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
betaBeps2(i1) = 0
End Do

 
DBeps = oo16pi2*( betaBeps1 + oo16pi2 * betaBeps2 ) 

 
Else 
DBeps = oo16pi2* betaBeps1 
End If 
 
 
Call Chop(DBeps) 

!-------------------- 
! mq2 
!-------------------- 
 
betamq21  = 2._dp*(adjL21Cml2L21) + adjL21L21mq2 + 2._dp*(adjL22Cml2L22)              & 
&  + adjL22L22mq2 + 2._dp*(adjL23Cml2L23) + adjL23L23mq2 + 2._dp*(adjT21T21)             & 
&  + 2._dp*(adjT22T22) + 2._dp*(adjT23T23) + 2._dp*(adjTdTd) + 2._dp*(adjTuTu)           & 
&  + 2._dp*(adjYdmd2Yd) + adjYdYdmq2 + 2._dp*(adjYumu2Yu) + adjYuYumq2 + 2._dp*(DyadjL21mlHd2i1Yd1i2)& 
&  + 2._dp*(DyadjL22mlHd2i1Yd2i2) + 2._dp*(DyadjL23mlHd2i1Yd3i2) - (2*AbsM1*g1p2*id3R)   & 
& /15._dp - 6*AbsM2*g2p2*id3R - (32*AbsM3*g3p2*id3R)/3._dp + 2*adjYdYd*mHd2 +            & 
&  2*adjYuYu*mHu2 + mq2adjL21L21 + mq2adjL22L22 + mq2adjL23L23 + mq2adjYdYd +            & 
&  mq2adjYuYu + 2*adjL21L21*md2(1,1) + 2*adjL21L22*md2(1,2) + 2*adjL21L23*md2(1,         & 
& 3) + 2*adjL22L21*md2(2,1) + 2*adjL22L22*md2(2,2) + 2*adjL22L23*md2(2,3) +              & 
&  2*adjL23L21*md2(3,1) + 2*adjL23L22*md2(3,2) + 2*adjL23L23*md2(3,3) + g1*id3R*ooSqrt15*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamq22 = 0

 
Dmq2 = oo16pi2*( betamq21 + oo16pi2 * betamq22 ) 

 
Else 
Dmq2 = oo16pi2* betamq21 
End If 
 
 
Call Chop(Dmq2) 

Forall(i1=1:3) Dmq2(i1,i1) =  Real(Dmq2(i1,i1),dp) 
Dmq2 = 0.5_dp*(Dmq2+ Conjg(Transpose(Dmq2)) ) 
!-------------------- 
! ml2 
!-------------------- 
 
betaml21  = 2._dp*(adjTeTe) + 2._dp*(adjYeme2Ye) + adjYeYeml2 - 2._dp*(CL11Cml2L11)   & 
&  - CL11L11ml2 - 2._dp*(CL12Cml2L12) - CL12L12ml2 - 2._dp*(CL13Cml2L13) -               & 
&  CL13L13ml2 + 6._dp*(CL21Cmq2TpL21) + 3._dp*(CL21TpL21ml2) + 6._dp*(CL22Cmq2TpL22)     & 
&  + 3._dp*(CL22TpL22ml2) + 6._dp*(CL23Cmq2TpL23) + 3._dp*(CL23TpL23ml2) -               & 
&  2._dp*(CT11T11) - 2._dp*(CT12T12) - 2._dp*(CT13T13) + 6._dp*(CT21TpT21)               & 
&  + 6._dp*(CT22TpT22) + 6._dp*(CT23TpT23) - 2._dp*(DyCL11mlHd2i1Ye1i2) - 2._dp*(DyCL12mlHd2i1Ye2i2)& 
&  - 2._dp*(DyCL13mlHd2i1Ye3i2) + 3._dp*(DyYdadjL211i1mlHd2i2) + 3._dp*(DyYdadjL222i1mlHd2i2)& 
&  + 3._dp*(DyYdadjL233i1mlHd2i2) - DyYeCL111i1mlHd2i2 - DyYeCL122i1mlHd2i2 -            & 
&  DyYeCL133i1mlHd2i2 - (6*AbsM1*g1p2*id3R)/5._dp - 6*AbsM2*g2p2*id3R + 2*adjYeYe*mHd2 + & 
&  ml2adjYeYe - ml2CL11L11 - ml2CL12L12 - ml2CL13L13 + 3._dp*(ml2CL21TpL21)              & 
&  + 3._dp*(ml2CL22TpL22) + 3._dp*(ml2CL23TpL23) + 6*CL21TpL21*md2(1,1) + 6*CL21TpL22*md2(1,& 
& 2) + 6*CL21TpL23*md2(1,3) + 6*CL22TpL21*md2(2,1) + 6*CL22TpL22*md2(2,2) +              & 
&  6*CL22TpL23*md2(2,3) + 6*CL23TpL21*md2(3,1) + 6*CL23TpL22*md2(3,2) + 6*CL23TpL23*md2(3,& 
& 3) - 2*CL11L11*me2(1,1) - 2*CL11L12*me2(1,2) - 2*CL11L13*me2(1,3) - 2*CL12L11*me2(2,   & 
& 1) - 2*CL12L12*me2(2,2) - 2*CL12L13*me2(2,3) - 2*CL13L11*me2(3,1) - 2*CL13L12*me2(3,   & 
& 2) - 2*CL13L13*me2(3,3) - g1*id3R*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betaml22 = 0

 
Dml2 = oo16pi2*( betaml21 + oo16pi2 * betaml22 ) 

 
Else 
Dml2 = oo16pi2* betaml21 
End If 
 
 
Call Chop(Dml2) 

Forall(i1=1:3) Dml2(i1,i1) =  Real(Dml2(i1,i1),dp) 
Dml2 = 0.5_dp*(Dml2+ Conjg(Transpose(Dml2)) ) 
!-------------------- 
! mHd2 
!-------------------- 
 
betamHd21  = (-6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 6._dp*(TrCTdTpTd) +               & 
&  2._dp*(TrCTeTpTe) + 6._dp*(Trmd2YdadjYd) + 2._dp*(Trme2YeadjYe) + 2._dp*(Trml2adjYeYe)& 
&  + 6._dp*(Trmq2adjYdYd) + 6*mHd2*TrYdadjYd + 2*mHd2*TrYeadjYe - g1*sqrt3ov5*Tr1(1)     & 
&  + 3*YdadjL21mlHd2(1) + 3*YdadjL22mlHd2(2) + 3*YdadjL23mlHd2(3) - YeCL11mlHd2(1)       & 
&  - YeCL12mlHd2(2) - YeCL13mlHd2(3)

 
 
If (TwoLoopRGE) Then 
betamHd22 = 0

 
DmHd2 = oo16pi2*( betamHd21 + oo16pi2 * betamHd22 ) 

 
Else 
DmHd2 = oo16pi2* betamHd21 
End If 
 
 
!-------------------- 
! mHu2 
!-------------------- 
 
betamHu21  = (-6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 6._dp*(TrCTuTpTu) +               & 
&  6._dp*(Trmq2adjYuYu) + 6._dp*(Trmu2YuadjYu) + 6*mHu2*TrYuadjYu + g1*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamHu22 = 0

 
DmHu2 = oo16pi2*( betamHu21 + oo16pi2 * betamHu22 ) 

 
Else 
DmHu2 = oo16pi2* betamHu21 
End If 
 
 
!-------------------- 
! md2 
!-------------------- 
 
betamd21 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betamd21(i1,i2) = 2*md2YdadjYd(i1,i2) + 4*TdadjTd(i1,i2) + 4*mHd2*YdadjYd(i1,i2) + 2*YdadjYdmd2(i1,     & 
& i2) + 4*Ydmq2adjYd(i1,i2)
If (1.eq.i1) Then 
betamd21(i1,i2) = betamd21(i1,i2)+4*TrCT21TpT21*Kronecker(1,i2) + 4*Trml2CL21TpL21*Kronecker(1,i2) + 4*Trmq2adjL21L21*Kronecker(1,& 
& i2) + 4*TrCT22TpT21*Kronecker(2,i2) + 4*Trml2CL22TpL21*Kronecker(2,i2) +               & 
&  4*Trmq2adjL22L21*Kronecker(2,i2) + 4*TrCT23TpT21*Kronecker(3,i2) + 4*Trml2CL23TpL21*Kronecker(3,& 
& i2) + 4*Trmq2adjL23L21*Kronecker(3,i2) + 2*TrCL21TpL21*md2(1,i2) + 2*TrCL22TpL21*md2(2,& 
& i2) + 2*TrCL23TpL21*md2(3,i2)
End If 
If (2.eq.i1) Then 
betamd21(i1,i2) = betamd21(i1,i2)+4*TrCT21TpT22*Kronecker(1,i2) + 4*Trml2CL21TpL22*Kronecker(1,i2) + 4*Trmq2adjL21L22*Kronecker(1,& 
& i2) + 4*TrCT22TpT22*Kronecker(2,i2) + 4*Trml2CL22TpL22*Kronecker(2,i2) +               & 
&  4*Trmq2adjL22L22*Kronecker(2,i2) + 4*TrCT23TpT22*Kronecker(3,i2) + 4*Trml2CL23TpL22*Kronecker(3,& 
& i2) + 4*Trmq2adjL23L22*Kronecker(3,i2) + 2*TrCL21TpL22*md2(1,i2) + 2*TrCL22TpL22*md2(2,& 
& i2) + 2*TrCL23TpL22*md2(3,i2)
End If 
If (3.eq.i1) Then 
betamd21(i1,i2) = betamd21(i1,i2)+4*TrCT21TpT23*Kronecker(1,i2) + 4*Trml2CL21TpL23*Kronecker(1,i2) + 4*Trmq2adjL21L23*Kronecker(1,& 
& i2) + 4*TrCT22TpT23*Kronecker(2,i2) + 4*Trml2CL22TpL23*Kronecker(2,i2) +               & 
&  4*Trmq2adjL22L23*Kronecker(2,i2) + 4*TrCT23TpT23*Kronecker(3,i2) + 4*Trml2CL23TpL23*Kronecker(3,& 
& i2) + 4*Trmq2adjL23L23*Kronecker(3,i2) + 2*TrCL21TpL23*md2(1,i2) + 2*TrCL22TpL23*md2(2,& 
& i2) + 2*TrCL23TpL23*md2(3,i2)
End If 
If (1.eq.i2) Then 
betamd21(i1,i2) = betamd21(i1,i2)+2*TrCL21TpL21*md2(i1,1) + 2*TrCL21TpL22*md2(i1,2) + 2*TrCL21TpL23*md2(i1,             & 
& 3) + 4*YdadjL21mlHd2(i1)
End If 
If (2.eq.i2) Then 
betamd21(i1,i2) = betamd21(i1,i2)+2*TrCL22TpL21*md2(i1,1) + 2*TrCL22TpL22*md2(i1,2) + 2*TrCL22TpL23*md2(i1,             & 
& 3) + 4*YdadjL22mlHd2(i1)
End If 
If (3.eq.i2) Then 
betamd21(i1,i2) = betamd21(i1,i2)+2*TrCL23TpL21*md2(i1,1) + 2*TrCL23TpL22*md2(i1,2) + 2*TrCL23TpL23*md2(i1,             & 
& 3) + 4*YdadjL23mlHd2(i1)
End If 
If (i2.eq.i1) Then 
betamd21(i1,i2) = betamd21(i1,i2)+((-8*AbsM1*g1p2)/15._dp - (32*AbsM3*g3p2)/3._dp + 2*g1*ooSqrt15*Tr1(1))
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betamd22 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betamd22(i1,i2) = 0
End Do
End Do

 
Dmd2 = oo16pi2*( betamd21 + oo16pi2 * betamd22 ) 

 
Else 
Dmd2 = oo16pi2* betamd21 
End If 
 
 
Call Chop(Dmd2) 

Forall(i1=1:3) Dmd2(i1,i1) =  Real(Dmd2(i1,i1),dp) 
Dmd2 = 0.5_dp*(Dmd2+ Conjg(Transpose(Dmd2)) ) 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 2*(mu2YuadjYu + 2._dp*(TuadjTu) + 2*mHu2*YuadjYu + YuadjYumu2 +           & 
&  2._dp*(Yumq2adjYu)) - (4*id3R*(8*AbsM1*g1p2 + 40*AbsM3*g3p2 + 15*g1*ooSqrt15*Tr1(1)))/15._dp

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Forall(i1=1:3) Dmu2(i1,i1) =  Real(Dmu2(i1,i1),dp) 
Dmu2 = 0.5_dp*(Dmu2+ Conjg(Transpose(Dmu2)) ) 
!-------------------- 
! me2 
!-------------------- 
 
betame21 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betame21(i1,i2) = 2*me2YeadjYe(i1,i2) + 4*TeadjTe(i1,i2) + 4*mHd2*YeadjYe(i1,i2) + 2*YeadjYeme2(i1,     & 
& i2) + 4*Yeml2adjYe(i1,i2)
If (1.eq.i1) Then 
betame21(i1,i2) = betame21(i1,i2)-2*TrCT11T11*Kronecker(1,i2) - 4*Trml2CL11L11*Kronecker(1,i2) - 2*TrCT12T11*Kronecker(2,& 
& i2) - 4*Trml2CL12L11*Kronecker(2,i2) - 2*TrCT13T11*Kronecker(3,i2) - 4*Trml2CL13L11*Kronecker(3,& 
& i2) - TrCL11L11*me2(1,i2) - TrCL12L11*me2(2,i2) - TrCL13L11*me2(3,i2)
End If 
If (2.eq.i1) Then 
betame21(i1,i2) = betame21(i1,i2)-2*TrCT11T12*Kronecker(1,i2) - 4*Trml2CL11L12*Kronecker(1,i2) - 2*TrCT12T12*Kronecker(2,& 
& i2) - 4*Trml2CL12L12*Kronecker(2,i2) - 2*TrCT13T12*Kronecker(3,i2) - 4*Trml2CL13L12*Kronecker(3,& 
& i2) - TrCL11L12*me2(1,i2) - TrCL12L12*me2(2,i2) - TrCL13L12*me2(3,i2)
End If 
If (3.eq.i1) Then 
betame21(i1,i2) = betame21(i1,i2)-2*TrCT11T13*Kronecker(1,i2) - 4*Trml2CL11L13*Kronecker(1,i2) - 2*TrCT12T13*Kronecker(2,& 
& i2) - 4*Trml2CL12L13*Kronecker(2,i2) - 2*TrCT13T13*Kronecker(3,i2) - 4*Trml2CL13L13*Kronecker(3,& 
& i2) - TrCL11L13*me2(1,i2) - TrCL12L13*me2(2,i2) - TrCL13L13*me2(3,i2)
End If 
If (1.eq.i2) Then 
betame21(i1,i2) = betame21(i1,i2)-(TrCL11L11*me2(i1,1)) - TrCL11L12*me2(i1,2) - TrCL11L13*me2(i1,3) - 4*YeCL11mlHd2(i1)
End If 
If (2.eq.i2) Then 
betame21(i1,i2) = betame21(i1,i2)-(TrCL12L11*me2(i1,1)) - TrCL12L12*me2(i1,2) - TrCL12L13*me2(i1,3) - 4*YeCL12mlHd2(i1)
End If 
If (3.eq.i2) Then 
betame21(i1,i2) = betame21(i1,i2)-(TrCL13L11*me2(i1,1)) - TrCL13L12*me2(i1,2) - TrCL13L13*me2(i1,3) - 4*YeCL13mlHd2(i1)
End If 
If (i2.eq.i1) Then 
betame21(i1,i2) = betame21(i1,i2)+((-24*AbsM1*g1p2)/5._dp + 2*g1*sqrt3ov5*Tr1(1))
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betame22 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betame22(i1,i2) = 0
End Do
End Do

 
Dme2 = oo16pi2*( betame21 + oo16pi2 * betame22 ) 

 
Else 
Dme2 = oo16pi2* betame21 
End If 
 
 
Call Chop(Dme2) 

Forall(i1=1:3) Dme2(i1,i1) =  Real(Dme2(i1,i1),dp) 
Dme2 = 0.5_dp*(Dme2+ Conjg(Transpose(Dme2)) ) 
!-------------------- 
! mlHd2 
!-------------------- 
 
Do i1 = 1,3
betamlHd21(i1) = 6*md2YdadjL21(1,i1) + 6*md2YdadjL22(2,i1) + 6*md2YdadjL23(3,i1) - 2*me2YeCL11(1,      & 
& i1) - 2*me2YeCL12(2,i1) - 2*me2YeCL13(3,i1) + 3*ml2CL21TpYd(i1,1) + 3*ml2CL22TpYd(i1,  & 
& 2) + 3*ml2CL23TpYd(i1,3) + 6*TdadjT21(1,i1) + 6*TdadjT22(2,i1) + 6*TdadjT23(3,         & 
& i1) - 2*TeCT11(1,i1) - 2*TeCT12(2,i1) - 2*TeCT13(3,i1) + 3*mHd2*YdadjL21(1,            & 
& i1) + 3*mHd2*YdadjL22(2,i1) + 3*mHd2*YdadjL23(3,i1) + 6*Ydmq2adjL21(1,i1) +            & 
&  6*Ydmq2adjL22(2,i1) + 6*Ydmq2adjL23(3,i1) - mHd2*YeCL11(1,i1) - YeCL11Cml2(1,         & 
& i1) - mHd2*YeCL12(2,i1) - YeCL12Cml2(2,i1) - mHd2*YeCL13(3,i1) - YeCL13Cml2(3,         & 
& i1) - 2*Yeml2CL11(1,i1) - 2*Yeml2CL12(2,i1) - 2*Yeml2CL13(3,i1)
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
betamlHd22(i1) = 0
End Do

 
DmlHd2 = oo16pi2*( betamlHd21 + oo16pi2 * betamlHd22 ) 

 
Else 
DmlHd2 = oo16pi2* betamlHd21 
End If 
 
 
!-------------------- 
! M1 
!-------------------- 
 
betaM11  = (66*g1p2*M1)/5._dp

 
 
If (TwoLoopRGE) Then 
betaM12 = 0

 
DM1 = oo16pi2*( betaM11 + oo16pi2 * betaM12 ) 

 
Else 
DM1 = oo16pi2* betaM11 
End If 
 
 
Call Chop(DM1) 

!-------------------- 
! M2 
!-------------------- 
 
betaM21  = 2*g2p2*M2

 
 
If (TwoLoopRGE) Then 
betaM22 = 0

 
DM2 = oo16pi2*( betaM21 + oo16pi2 * betaM22 ) 

 
Else 
DM2 = oo16pi2* betaM21 
End If 
 
 
Call Chop(DM2) 

!-------------------- 
! M3 
!-------------------- 
 
betaM31  = -6*g3p2*M3

 
 
If (TwoLoopRGE) Then 
betaM32 = 0

 
DM3 = oo16pi2*( betaM31 + oo16pi2 * betaM32 ) 

 
Else 
DM3 = oo16pi2* betaM31 
End If 
 
 
Call Chop(DM3) 

Call ParametersToG444(Dg1,Dg2,Dg3,DYd,DYe,DL1,DL2,DYu,DMu,DREps,DTd,DTe,              & 
& DT1,DT2,DTu,DBmu,DBeps,Dmq2,Dml2,DmHd2,DmHu2,Dmd2,Dmu2,Dme2,DmlHd2,DM1,DM2,DM3,f)

Iname = Iname - 1 
 
End Subroutine rge444  

Subroutine GToParameters449(g,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,               & 
& T2,Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)

Implicit None 
Real(dp), Intent(in) :: g(449) 
Real(dp),Intent(out) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters449' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+4), g(SumI+5), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+22), g(SumI+23), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
L1(i1,i2,i3) = Cmplx( g(SumI+40), g(SumI+41), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
L2(i1,i2,i3) = Cmplx( g(SumI+94), g(SumI+95), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+148), g(SumI+149), dp) 
End Do 
 End Do 
 
Mu= Cmplx(g(166),g(167),dp) 
Do i1 = 1,3
SumI = (i1-1) 
SumI = SumI*2 
REps(i1) = Cmplx( g(SumI+168), g(SumI+169), dp) 
End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Td(i1,i2) = Cmplx( g(SumI+174), g(SumI+175), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Te(i1,i2) = Cmplx( g(SumI+192), g(SumI+193), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
T1(i1,i2,i3) = Cmplx( g(SumI+210), g(SumI+211), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
T2(i1,i2,i3) = Cmplx( g(SumI+264), g(SumI+265), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tu(i1,i2) = Cmplx( g(SumI+318), g(SumI+319), dp) 
End Do 
 End Do 
 
Bmu= Cmplx(g(336),g(337),dp) 
Do i1 = 1,3
SumI = (i1-1) 
SumI = SumI*2 
Beps(i1) = Cmplx( g(SumI+338), g(SumI+339), dp) 
End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mq2(i1,i2) = Cmplx( g(SumI+344), g(SumI+345), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
ml2(i1,i2) = Cmplx( g(SumI+362), g(SumI+363), dp) 
End Do 
 End Do 
 
mHd2= g(380) 
mHu2= g(381) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
md2(i1,i2) = Cmplx( g(SumI+382), g(SumI+383), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mu2(i1,i2) = Cmplx( g(SumI+400), g(SumI+401), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
me2(i1,i2) = Cmplx( g(SumI+418), g(SumI+419), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
SumI = (i1-1) 
mlHd2(i1) =  g(SumI+436) 
End Do 
 
M1= Cmplx(g(439),g(440),dp) 
M2= Cmplx(g(441),g(442),dp) 
M3= Cmplx(g(443),g(444),dp) 
vd= g(445) 
vu= g(446) 
Do i1 = 1,3
SumI = (i1-1) 
vL(i1) =  g(SumI+447) 
End Do 
 
Do i1=1,449 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters449

Subroutine ParametersToG449(g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,              & 
& Tu,Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL,g)

Implicit None 
Real(dp), Intent(out) :: g(449) 
Real(dp), Intent(in) :: g1,g2,g3,mHd2,mHu2,mlHd2(3),vd,vu,vL(3)

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),L1(3,3,3),L2(3,3,3),Yu(3,3),Mu,REps(3),Td(3,3),Te(3,3),               & 
& T1(3,3,3),T2(3,3,3),Tu(3,3),Bmu,Beps(3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),           & 
& me2(3,3),M1,M2,M3

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG449' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+4) = Real(Yd(i1,i2), dp) 
g(SumI+5) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+22) = Real(Ye(i1,i2), dp) 
g(SumI+23) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+40) = Real(L1(i1,i2,i3), dp) 
g(SumI+41) = Aimag(L1(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+94) = Real(L2(i1,i2,i3), dp) 
g(SumI+95) = Aimag(L2(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+148) = Real(Yu(i1,i2), dp) 
g(SumI+149) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

g(166) = Real(Mu,dp)  
g(167) = Aimag(Mu)  
Do i1 = 1,3
SumI = (i1-1) 
SumI = SumI*2 
g(SumI+168) = Real(REps(i1), dp) 
g(SumI+169) = Aimag(REps(i1)) 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+174) = Real(Td(i1,i2), dp) 
g(SumI+175) = Aimag(Td(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+192) = Real(Te(i1,i2), dp) 
g(SumI+193) = Aimag(Te(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+210) = Real(T1(i1,i2,i3), dp) 
g(SumI+211) = Aimag(T1(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
SumI = (i3-1) + (i2-1)*3 + (i1-1)*9
SumI = SumI*2 
g(SumI+264) = Real(T2(i1,i2,i3), dp) 
g(SumI+265) = Aimag(T2(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+318) = Real(Tu(i1,i2), dp) 
g(SumI+319) = Aimag(Tu(i1,i2)) 
End Do 
End Do 

g(336) = Real(Bmu,dp)  
g(337) = Aimag(Bmu)  
Do i1 = 1,3
SumI = (i1-1) 
SumI = SumI*2 
g(SumI+338) = Real(Beps(i1), dp) 
g(SumI+339) = Aimag(Beps(i1)) 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+344) = Real(mq2(i1,i2), dp) 
g(SumI+345) = Aimag(mq2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+362) = Real(ml2(i1,i2), dp) 
g(SumI+363) = Aimag(ml2(i1,i2)) 
End Do 
End Do 

g(380) = mHd2  
g(381) = mHu2  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+382) = Real(md2(i1,i2), dp) 
g(SumI+383) = Aimag(md2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+400) = Real(mu2(i1,i2), dp) 
g(SumI+401) = Aimag(mu2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+418) = Real(me2(i1,i2), dp) 
g(SumI+419) = Aimag(me2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
SumI = (i1-1) 
g(SumI+436) = mlHd2(i1) 
End Do 

g(439) = Real(M1,dp)  
g(440) = Aimag(M1)  
g(441) = Real(M2,dp)  
g(442) = Aimag(M2)  
g(443) = Real(M3,dp)  
g(444) = Aimag(M3)  
g(445) = vd  
g(446) = vu  
Do i1 = 1,3
SumI = (i1-1) 
g(SumI+447) = vL(i1) 
End Do 

Iname = Iname - 1 
 
End Subroutine ParametersToG449

Subroutine rge449(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,mHd2,betamHd21,betamHd22,DmHd2,mHu2,betamHu21,betamHu22,DmHu2,mlHd2(3)             & 
& ,betamlHd21(3),betamlHd22(3),DmlHd2(3),vd,betavd1,betavd2,Dvd,vu,betavu1,              & 
& betavu2,Dvu,vL(3),betavL1(3),betavL2(3),DvL(3)
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),L1(3,3,3),betaL11(3,3,3),               & 
& betaL12(3,3,3),DL1(3,3,3),L2(3,3,3),betaL21(3,3,3),betaL22(3,3,3),DL2(3,3,3)           & 
& ,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Mu,betaMu1,betaMu2,             & 
& DMu,REps(3),betaREps1(3),betaREps2(3),DREps(3),Td(3,3),betaTd1(3,3),betaTd2(3,3)       & 
& ,DTd(3,3),adjTd(3,3),Te(3,3),betaTe1(3,3),betaTe2(3,3),DTe(3,3),adjTe(3,3)             & 
& ,T1(3,3,3),betaT11(3,3,3),betaT12(3,3,3),DT1(3,3,3),T2(3,3,3),betaT21(3,3,3)           & 
& ,betaT22(3,3,3),DT2(3,3,3),Tu(3,3),betaTu1(3,3),betaTu2(3,3),DTu(3,3),adjTu(3,3)       & 
& ,Bmu,betaBmu1,betaBmu2,DBmu,Beps(3),betaBeps1(3),betaBeps2(3),DBeps(3),mq2(3,3)        & 
& ,betamq21(3,3),betamq22(3,3),Dmq2(3,3),ml2(3,3),betaml21(3,3),betaml22(3,3)            & 
& ,Dml2(3,3),md2(3,3),betamd21(3,3),betamd22(3,3),Dmd2(3,3),mu2(3,3),betamu21(3,3)       & 
& ,betamu22(3,3),Dmu2(3,3),me2(3,3),betame21(3,3),betame22(3,3),Dme2(3,3),               & 
& M1,betaM11,betaM12,DM1,M2,betaM21,betaM22,DM2,M3,betaM31,betaM32,DM3
Real(dp) :: Tr1(3),Tr2(3),Tr3(3) 
Real(dp) :: Tr2U1(3,3) 
Real(dp) :: AbsM1,AbsM2,AbsM3
Complex(dp) :: md2Yd(3,3),me2Ye(3,3),ml2adjYe(3,3),ml2CL11(3,3),ml2CL12(3,3),ml2CL13(3,3),           & 
& mq2adjYd(3,3),mq2adjYu(3,3),mq2adjL21(3,3),mq2adjL22(3,3),mq2adjL23(3,3),              & 
& mu2Yu(3,3),Ydmq2(3,3),YdadjYd(3,3),YdadjL21(3,3),YdadjL22(3,3),YdadjL23(3,3),          & 
& Yeml2(3,3),YeadjYe(3,3),YeCL11(3,3),YeCL12(3,3),YeCL13(3,3),Yumq2(3,3),YuadjYu(3,3),   & 
& adjYdmd2(3,3),adjYdYd(3,3),adjYdTd(3,3),adjYeme2(3,3),adjYeYe(3,3),adjYeTe(3,3),       & 
& adjYumu2(3,3),adjYuYu(3,3),adjYuTu(3,3),adjL21mlHd2(3),adjL21vL(3),adjL21REps(3),      & 
& adjL21Beps(3),adjL21L11(3,3),adjL21L12(3,3),adjL21L13(3,3),adjL21L21(3,3),             & 
& adjL21L22(3,3),adjL21L23(3,3),adjL21T11(3,3),adjL21T12(3,3),adjL21T13(3,3),            & 
& adjL21T21(3,3),adjL21T22(3,3),adjL21T23(3,3),adjL22mlHd2(3),adjL22vL(3),               & 
& adjL22REps(3),adjL22Beps(3),adjL22L11(3,3),adjL22L12(3,3),adjL22L13(3,3),              & 
& adjL22L21(3,3),adjL22L22(3,3),adjL22L23(3,3),adjL22T11(3,3),adjL22T12(3,3),            & 
& adjL22T13(3,3),adjL22T21(3,3),adjL22T22(3,3),adjL22T23(3,3),adjL23mlHd2(3),            & 
& adjL23vL(3),adjL23REps(3),adjL23Beps(3),adjL23L11(3,3),adjL23L12(3,3),adjL23L13(3,3),  & 
& adjL23L21(3,3),adjL23L22(3,3),adjL23L23(3,3),adjL23T11(3,3),adjL23T12(3,3),            & 
& adjL23T13(3,3),adjL23T21(3,3),adjL23T22(3,3),adjL23T23(3,3),adjTdTd(3,3),              & 
& adjTeTe(3,3),adjTuTu(3,3),adjT21T21(3,3),adjT22T22(3,3),adjT23T23(3,3),Cml2L11(3,3),   & 
& Cml2L12(3,3),Cml2L13(3,3),Cml2L21(3,3),Cml2L22(3,3),Cml2L23(3,3),Cmq2TpL21(3,3),       & 
& Cmq2TpL22(3,3),Cmq2TpL23(3,3),CYdTpL21(3,3),CYdTpL22(3,3),CYdTpL23(3,3),               & 
& CYdTpTd(3,3),CYdTpT21(3,3),CYdTpT22(3,3),CYdTpT23(3,3),CYevL(3),CYeREps(3),            & 
& CYeBeps(3),CYeL11(3,3),CYeL12(3,3),CYeL13(3,3),CYeL21(3,3),CYeL22(3,3),CYeL23(3,3),    & 
& CYeTpTe(3,3),CYeT11(3,3),CYeT12(3,3),CYeT13(3,3),CYeT21(3,3),CYeT22(3,3),              & 
& CYeT23(3,3),CL11mlHd2(3),CL11vL(3),CL11REps(3),CL11Beps(3),CL11Cml2(3,3),              & 
& CL11L11(3,3),CL11L12(3,3),CL11L13(3,3),CL11L21(3,3),CL11L22(3,3),CL11L23(3,3),         & 
& CL11TpYe(3,3),CL11TpTe(3,3),CL11T11(3,3),CL11T12(3,3),CL11T13(3,3),CL11T21(3,3),       & 
& CL11T22(3,3),CL11T23(3,3),CL12mlHd2(3),CL12vL(3),CL12REps(3),CL12Beps(3),              & 
& CL12Cml2(3,3),CL12L11(3,3),CL12L12(3,3),CL12L13(3,3),CL12L21(3,3),CL12L22(3,3),        & 
& CL12L23(3,3),CL12TpYe(3,3),CL12TpTe(3,3),CL12T11(3,3),CL12T12(3,3),CL12T13(3,3),       & 
& CL12T21(3,3),CL12T22(3,3),CL12T23(3,3),CL13mlHd2(3),CL13vL(3),CL13REps(3),             & 
& CL13Beps(3),CL13Cml2(3,3),CL13L11(3,3),CL13L12(3,3),CL13L13(3,3),CL13L21(3,3),         & 
& CL13L22(3,3),CL13L23(3,3),CL13TpYe(3,3),CL13TpTe(3,3),CL13T11(3,3),CL13T12(3,3),       & 
& CL13T13(3,3),CL13T21(3,3),CL13T22(3,3),CL13T23(3,3),CL21TpYd(3,3),CL21TpL21(3,3),      & 
& CL21TpL22(3,3),CL21TpL23(3,3),CL21TpTd(3,3),CL21TpT21(3,3),CL22TpYd(3,3),              & 
& CL22TpL21(3,3),CL22TpL22(3,3),CL22TpL23(3,3),CL22TpTd(3,3),CL22TpT22(3,3),             & 
& CL23TpYd(3,3),CL23TpL21(3,3),CL23TpL22(3,3),CL23TpL23(3,3),CL23TpTd(3,3),              & 
& CL23TpT23(3,3),CTdTpTd(3,3),CTeTpTe(3,3),CTuTpTu(3,3),CT11T11(3,3),CT11T12(3,3),       & 
& CT11T13(3,3),CT12T11(3,3),CT12T12(3,3),CT12T13(3,3),CT13T11(3,3),CT13T12(3,3),         & 
& CT13T13(3,3),CT21TpT21(3,3),CT21TpT22(3,3),CT21TpT23(3,3),CT22TpT21(3,3)

Complex(dp) :: CT22TpT22(3,3),CT22TpT23(3,3),CT23TpT21(3,3),CT23TpT22(3,3),CT23TpT23(3,3),            & 
& L11ml2(3,3),L12ml2(3,3),L13ml2(3,3),L21mq2(3,3),L22mq2(3,3),L23mq2(3,3),               & 
& TdadjTd(3,3),TdadjT21(3,3),TdadjT22(3,3),TdadjT23(3,3),TeadjTe(3,3),TeCT11(3,3),       & 
& TeCT12(3,3),TeCT13(3,3),TuadjTu(3,3),TpL21ml2(3,3),TpL22ml2(3,3),TpL23ml2(3,3),        & 
& md2YdadjYd(3,3),md2YdadjL21(3,3),md2YdadjL22(3,3),md2YdadjL23(3,3),me2YeadjYe(3,3),    & 
& me2YeCL11(3,3),me2YeCL12(3,3),me2YeCL13(3,3),ml2adjYeYe(3,3),ml2CL11L11(3,3),          & 
& ml2CL11L12(3,3),ml2CL11L13(3,3),ml2CL12L11(3,3),ml2CL12L12(3,3),ml2CL12L13(3,3),       & 
& ml2CL13L11(3,3),ml2CL13L12(3,3),ml2CL13L13(3,3),ml2CL21TpYd(3,3),ml2CL21TpL21(3,3),    & 
& ml2CL21TpL22(3,3),ml2CL21TpL23(3,3),ml2CL22TpYd(3,3),ml2CL22TpL21(3,3),ml2CL22TpL22(3,3),& 
& ml2CL22TpL23(3,3),ml2CL23TpYd(3,3),ml2CL23TpL21(3,3),ml2CL23TpL22(3,3),ml2CL23TpL23(3,3),& 
& mq2adjYdYd(3,3),mq2adjYuYu(3,3),mq2adjL21L21(3,3),mq2adjL21L22(3,3),mq2adjL21L23(3,3), & 
& mq2adjL22L21(3,3),mq2adjL22L22(3,3),mq2adjL22L23(3,3),mq2adjL23L21(3,3),               & 
& mq2adjL23L22(3,3),mq2adjL23L23(3,3),mu2YuadjYu(3,3),Ydmq2adjYd(3,3),Ydmq2adjL21(3,3),  & 
& Ydmq2adjL22(3,3),Ydmq2adjL23(3,3),YdadjYdmd2(3,3),YdadjYdYd(3,3),YdadjYdTd(3,3),       & 
& YdadjYuYu(3,3),YdadjYuTu(3,3),YdadjL21mlHd2(3),YdadjL21vL(3),YdadjL21REps(3),          & 
& YdadjL21Beps(3),YdadjL21L21(3,3),YdadjL21L22(3,3),YdadjL21L23(3,3),YdadjL21T11(3,3),   & 
& YdadjL21T12(3,3),YdadjL21T13(3,3),YdadjL21T21(3,3),YdadjL21T22(3,3),YdadjL21T23(3,3),  & 
& YdadjL22mlHd2(3),YdadjL22vL(3),YdadjL22REps(3),YdadjL22Beps(3),YdadjL22L21(3,3),       & 
& YdadjL22L22(3,3),YdadjL22L23(3,3),YdadjL22T11(3,3),YdadjL22T12(3,3),YdadjL22T13(3,3),  & 
& YdadjL22T21(3,3),YdadjL22T22(3,3),YdadjL22T23(3,3),YdadjL23mlHd2(3),YdadjL23vL(3),     & 
& YdadjL23REps(3),YdadjL23Beps(3),YdadjL23L21(3,3),YdadjL23L22(3,3),YdadjL23L23(3,3),    & 
& YdadjL23T11(3,3),YdadjL23T12(3,3),YdadjL23T13(3,3),YdadjL23T21(3,3),YdadjL23T22(3,3),  & 
& YdadjL23T23(3,3),Yeml2adjYe(3,3),Yeml2CL11(3,3),Yeml2CL12(3,3),Yeml2CL13(3,3),         & 
& YeadjYeme2(3,3),YeadjYeYe(3,3),YeadjYeTe(3,3),YeCL11mlHd2(3),YeCL11vL(3),              & 
& YeCL11REps(3),YeCL11Beps(3),YeCL11Cml2(3,3),YeCL11L11(3,3),YeCL11L21(3,3),             & 
& YeCL11L22(3,3),YeCL11L23(3,3),YeCL11T11(3,3),YeCL11T12(3,3),YeCL11T13(3,3),            & 
& YeCL11T21(3,3),YeCL11T22(3,3),YeCL11T23(3,3),YeCL12mlHd2(3),YeCL12vL(3),               & 
& YeCL12REps(3),YeCL12Beps(3),YeCL12Cml2(3,3),YeCL12L12(3,3),YeCL12L21(3,3),             & 
& YeCL12L22(3,3),YeCL12L23(3,3),YeCL12T11(3,3),YeCL12T12(3,3),YeCL12T13(3,3),            & 
& YeCL12T21(3,3),YeCL12T22(3,3),YeCL12T23(3,3),YeCL13mlHd2(3),YeCL13vL(3),               & 
& YeCL13REps(3),YeCL13Beps(3),YeCL13Cml2(3,3),YeCL13L13(3,3),YeCL13L21(3,3),             & 
& YeCL13L22(3,3),YeCL13L23(3,3),YeCL13T11(3,3),YeCL13T12(3,3),YeCL13T13(3,3),            & 
& YeCL13T21(3,3),YeCL13T22(3,3),YeCL13T23(3,3),YeCL21TpL21(3,3),YeCL21TpT21(3,3),        & 
& YeCL22TpL22(3,3),YeCL22TpT22(3,3),YeCL23TpL23(3,3),YeCL23TpT23(3,3),Yumq2adjYu(3,3),   & 
& YuadjYdYd(3,3),YuadjYdTd(3,3),YuadjYumu2(3,3),YuadjYuYu(3,3),YuadjYuTu(3,3),           & 
& YuadjL21L21(3,3),YuadjL21T21(3,3),YuadjL22L22(3,3),YuadjL22T22(3,3),YuadjL23L23(3,3),  & 
& YuadjL23T23(3,3),adjYdmd2Yd(3,3),adjYdYdmq2(3,3),adjYeme2Ye(3,3),adjYeYeml2(3,3)

Complex(dp) :: adjYumu2Yu(3,3),adjYuYumq2(3,3),adjL21Cml2L21(3,3),adjL21L21mq2(3,3),adjL22Cml2L22(3,3),& 
& adjL22L22mq2(3,3),adjL23Cml2L23(3,3),adjL23L23mq2(3,3),CL11Cml2L11(3,3),               & 
& CL11L11ml2(3,3),CL12Cml2L12(3,3),CL12L12ml2(3,3),CL13Cml2L13(3,3),CL13L13ml2(3,3),     & 
& CL21Cmq2TpL21(3,3),CL21TpL21ml2(3,3),CL22Cmq2TpL22(3,3),CL22TpL22ml2(3,3),             & 
& CL23Cmq2TpL23(3,3),CL23TpL23ml2(3,3),L11adjYeYe(3,3),L11adjYeTe(3,3),L11CL11vL(3),     & 
& L11CL11REps(3),L11CL11Beps(3),L11CL11L11(3,3),L11CL11L12(3,3),L11CL11L13(3,3),         & 
& L11CL11L21(3,3),L11CL11L22(3,3),L11CL11L23(3,3),L11CL11TpYe(3,3),L11CL11TpTe(3,3),     & 
& L11CL11T11(3,3),L11CL11T12(3,3),L11CL11T13(3,3),L11CL11T21(3,3),L11CL11T22(3,3),       & 
& L11CL11T23(3,3),L11CL12L12(3,3),L11CL12TpYe(3,3),L11CL12TpTe(3,3),L11CL12T12(3,3),     & 
& L11CL13L13(3,3),L11CL13TpYe(3,3),L11CL13TpTe(3,3),L11CL13T13(3,3),L11CL21TpYd(3,3),    & 
& L11CL21TpL21(3,3),L11CL21TpTd(3,3),L11CL21TpT21(3,3),L11CL22TpYd(3,3),L11CL22TpL22(3,3),& 
& L11CL22TpTd(3,3),L11CL22TpT22(3,3),L11CL23TpYd(3,3),L11CL23TpL23(3,3),L11CL23TpTd(3,3),& 
& L11CL23TpT23(3,3),L12adjYeYe(3,3),L12adjYeTe(3,3),L12CL11L11(3,3),L12CL11TpYe(3,3),    & 
& L12CL11TpTe(3,3),L12CL11T11(3,3),L12CL12vL(3),L12CL12REps(3),L12CL12Beps(3),           & 
& L12CL12L11(3,3),L12CL12L12(3,3),L12CL12L13(3,3),L12CL12L21(3,3),L12CL12L22(3,3),       & 
& L12CL12L23(3,3),L12CL12TpYe(3,3),L12CL12TpTe(3,3),L12CL12T11(3,3),L12CL12T12(3,3),     & 
& L12CL12T13(3,3),L12CL12T21(3,3),L12CL12T22(3,3),L12CL12T23(3,3),L12CL13L13(3,3),       & 
& L12CL13TpYe(3,3),L12CL13TpTe(3,3),L12CL13T13(3,3),L12CL21TpYd(3,3),L12CL21TpL21(3,3),  & 
& L12CL21TpTd(3,3),L12CL21TpT21(3,3),L12CL22TpYd(3,3),L12CL22TpL22(3,3),L12CL22TpTd(3,3),& 
& L12CL22TpT22(3,3),L12CL23TpYd(3,3),L12CL23TpL23(3,3),L12CL23TpTd(3,3),L12CL23TpT23(3,3),& 
& L13adjYeYe(3,3),L13adjYeTe(3,3),L13CL11L11(3,3),L13CL11TpYe(3,3),L13CL11TpTe(3,3),     & 
& L13CL11T11(3,3),L13CL12L12(3,3),L13CL12TpYe(3,3),L13CL12TpTe(3,3),L13CL12T12(3,3),     & 
& L13CL13vL(3),L13CL13REps(3),L13CL13Beps(3),L13CL13L11(3,3),L13CL13L12(3,3),            & 
& L13CL13L13(3,3),L13CL13L21(3,3),L13CL13L22(3,3),L13CL13L23(3,3),L13CL13TpYe(3,3),      & 
& L13CL13TpTe(3,3),L13CL13T11(3,3),L13CL13T12(3,3),L13CL13T13(3,3),L13CL13T21(3,3),      & 
& L13CL13T22(3,3),L13CL13T23(3,3),L13CL21TpYd(3,3),L13CL21TpL21(3,3),L13CL21TpTd(3,3),   & 
& L13CL21TpT21(3,3),L13CL22TpYd(3,3),L13CL22TpL22(3,3),L13CL22TpTd(3,3),L13CL22TpT22(3,3),& 
& L13CL23TpYd(3,3),L13CL23TpL23(3,3),L13CL23TpTd(3,3),L13CL23TpT23(3,3),L21adjYdYd(3,3), & 
& L21adjYdTd(3,3),L21adjYuYu(3,3),L21adjYuTu(3,3),L21adjL21vL(3),L21adjL21REps(3),       & 
& L21adjL21Beps(3),L21adjL21L11(3,3),L21adjL21L12(3,3),L21adjL21L13(3,3),L21adjL21L21(3,3),& 
& L21adjL21L22(3,3),L21adjL21L23(3,3),L21adjL21T11(3,3),L21adjL21T12(3,3),               & 
& L21adjL21T13(3,3),L21adjL21T21(3,3),L21adjL21T22(3,3),L21adjL21T23(3,3),               & 
& L21adjL22L22(3,3),L21adjL22T22(3,3),L21adjL23L23(3,3),L21adjL23T23(3,3),               & 
& L22adjYdYd(3,3),L22adjYdTd(3,3),L22adjYuYu(3,3),L22adjYuTu(3,3),L22adjL21L21(3,3),     & 
& L22adjL21T21(3,3),L22adjL22vL(3),L22adjL22REps(3),L22adjL22Beps(3),L22adjL22L11(3,3),  & 
& L22adjL22L12(3,3),L22adjL22L13(3,3),L22adjL22L21(3,3),L22adjL22L22(3,3),               & 
& L22adjL22L23(3,3),L22adjL22T11(3,3),L22adjL22T12(3,3),L22adjL22T13(3,3)

Complex(dp) :: L22adjL22T21(3,3),L22adjL22T22(3,3),L22adjL22T23(3,3),L22adjL23L23(3,3),               & 
& L22adjL23T23(3,3),L23adjYdYd(3,3),L23adjYdTd(3,3),L23adjYuYu(3,3),L23adjYuTu(3,3),     & 
& L23adjL21L21(3,3),L23adjL21T21(3,3),L23adjL22L22(3,3),L23adjL22T22(3,3),               & 
& L23adjL23vL(3),L23adjL23REps(3),L23adjL23Beps(3),L23adjL23L11(3,3),L23adjL23L12(3,3),  & 
& L23adjL23L13(3,3),L23adjL23L21(3,3),L23adjL23L22(3,3),L23adjL23L23(3,3),               & 
& L23adjL23T11(3,3),L23adjL23T12(3,3),L23adjL23T13(3,3),L23adjL23T21(3,3),               & 
& L23adjL23T22(3,3),L23adjL23T23(3,3),TdadjYdYd(3,3),TdadjYuYu(3,3),TdadjL21REps(3),     & 
& TdadjL21L21(3,3),TdadjL22REps(3),TdadjL22L22(3,3),TdadjL23REps(3),TdadjL23L23(3,3),    & 
& TeadjYeYe(3,3),TeCL11REps(3),TeCL11L11(3,3),TeCL12REps(3),TeCL12L12(3,3),              & 
& TeCL13REps(3),TeCL13L13(3,3),TeCL21TpL21(3,3),TeCL22TpL22(3,3),TeCL23TpL23(3,3),       & 
& TuadjYdYd(3,3),TuadjYuYu(3,3),TuadjL21L21(3,3),TuadjL22L22(3,3),TuadjL23L23(3,3),      & 
& TpYeCYevL(3),TpYeCYeREps(3),TpYeCYeBeps(3),TpYeCYeL11(3,3),TpYeCYeL12(3,3),            & 
& TpYeCYeL13(3,3),TpYeCYeL21(3,3),TpYeCYeL22(3,3),TpYeCYeL23(3,3),TpYeCYeT11(3,3),       & 
& TpYeCYeT12(3,3),TpYeCYeT13(3,3),TpYeCYeT21(3,3),TpYeCYeT22(3,3),TpYeCYeT23(3,3),       & 
& TpL21CL11TpTe(3,3),TpL21CL12TpTe(3,3),TpL21CL13TpTe(3,3),TpL21CL21TpTd(3,3),           & 
& TpL21CL22TpTd(3,3),TpL21CL23TpTd(3,3),TpL22CL11TpTe(3,3),TpL22CL12TpTe(3,3),           & 
& TpL22CL13TpTe(3,3),TpL22CL21TpTd(3,3),TpL22CL22TpTd(3,3),TpL22CL23TpTd(3,3),           & 
& TpL23CL11TpTe(3,3),TpL23CL12TpTe(3,3),TpL23CL13TpTe(3,3),TpL23CL21TpTd(3,3),           & 
& TpL23CL22TpTd(3,3),TpL23CL23TpTd(3,3),TpTeCYeREps(3),TpTeCYeL11(3,3),TpTeCYeL12(3,3),  & 
& TpTeCYeL13(3,3),TpTeCYeL21(3,3),TpTeCYeL22(3,3),TpTeCYeL23(3,3),T11adjYeYe(3,3),       & 
& T11CL11REps(3),T11CL11L11(3,3),T11CL11L12(3,3),T11CL11L13(3,3),T11CL11L21(3,3),        & 
& T11CL11L22(3,3),T11CL11L23(3,3),T11CL12L12(3,3),T11CL13L13(3,3),T11CL21TpL21(3,3),     & 
& T11CL22TpL22(3,3),T11CL23TpL23(3,3),T12adjYeYe(3,3),T12CL11L11(3,3),T12CL12REps(3),    & 
& T12CL12L11(3,3),T12CL12L12(3,3),T12CL12L13(3,3),T12CL12L21(3,3),T12CL12L22(3,3),       & 
& T12CL12L23(3,3),T12CL13L13(3,3),T12CL21TpL21(3,3),T12CL22TpL22(3,3),T12CL23TpL23(3,3), & 
& T13adjYeYe(3,3),T13CL11L11(3,3),T13CL12L12(3,3),T13CL13REps(3),T13CL13L11(3,3),        & 
& T13CL13L12(3,3),T13CL13L13(3,3),T13CL13L21(3,3),T13CL13L22(3,3),T13CL13L23(3,3),       & 
& T13CL21TpL21(3,3),T13CL22TpL22(3,3),T13CL23TpL23(3,3),T21adjYdYd(3,3),T21adjYuYu(3,3), & 
& T21adjL21REps(3),T21adjL21L11(3,3),T21adjL21L12(3,3),T21adjL21L13(3,3),T21adjL21L21(3,3),& 
& T21adjL21L22(3,3),T21adjL21L23(3,3),T21adjL22L22(3,3),T21adjL23L23(3,3),               & 
& T22adjYdYd(3,3),T22adjYuYu(3,3),T22adjL21L21(3,3),T22adjL22REps(3),T22adjL22L11(3,3),  & 
& T22adjL22L12(3,3),T22adjL22L13(3,3),T22adjL22L21(3,3),T22adjL22L22(3,3),               & 
& T22adjL22L23(3,3),T22adjL23L23(3,3),T23adjYdYd(3,3),T23adjYuYu(3,3),T23adjL21L21(3,3), & 
& T23adjL22L22(3,3),T23adjL23REps(3),T23adjL23L11(3,3),T23adjL23L12(3,3),T23adjL23L13(3,3),& 
& T23adjL23L21(3,3),T23adjL23L22(3,3),T23adjL23L23(3,3)

Complex(dp) :: Trmd2,Trme2,Trml2,Trmq2,Trmu2,TrYdadjYd,TrYeadjYe,TrYuadjYu,TradjYdTd,TradjYeTe,      & 
& TradjYuTu,TradjL21T21,TradjL21T22,TradjL21T23,TradjL22T21,TradjL22T22,TradjL22T23,     & 
& TradjL23T21,TradjL23T22,TradjL23T23,TrCL11L11,TrCL11L12,TrCL11L13,TrCL11T11,           & 
& TrCL11T12,TrCL11T13,TrCL12L11,TrCL12L12,TrCL12L13,TrCL12T11,TrCL12T12,TrCL12T13,       & 
& TrCL13L11,TrCL13L12,TrCL13L13,TrCL13T11,TrCL13T12,TrCL13T13,TrCL21TpL21,               & 
& TrCL21TpL22,TrCL21TpL23,TrCL22TpL21,TrCL22TpL22,TrCL22TpL23,TrCL23TpL21,               & 
& TrCL23TpL22,TrCL23TpL23,TrCTdTpTd,TrCTeTpTe,TrCTuTpTu,TrCT11T11,TrCT11T12,             & 
& TrCT11T13,TrCT12T11,TrCT12T12,TrCT12T13,TrCT13T11,TrCT13T12,TrCT13T13,TrCT21TpT21,     & 
& TrCT21TpT22,TrCT21TpT23,TrCT22TpT21,TrCT22TpT22,TrCT22TpT23,TrCT23TpT21,               & 
& TrCT23TpT22,TrCT23TpT23,Trmd2YdadjYd,Trme2YeadjYe,Trml2adjYeYe,Trml2CL11L11,           & 
& Trml2CL11L12,Trml2CL11L13,Trml2CL12L11,Trml2CL12L12,Trml2CL12L13,Trml2CL13L11,         & 
& Trml2CL13L12,Trml2CL13L13,Trml2CL21TpL21,Trml2CL21TpL22,Trml2CL21TpL23,Trml2CL22TpL21, & 
& Trml2CL22TpL22,Trml2CL22TpL23,Trml2CL23TpL21,Trml2CL23TpL22,Trml2CL23TpL23,            & 
& Trmq2adjYdYd,Trmq2adjYuYu,Trmq2adjL21L21,Trmq2adjL21L22,Trmq2adjL21L23,Trmq2adjL22L21, & 
& Trmq2adjL22L22,Trmq2adjL22L23,Trmq2adjL23L21,Trmq2adjL23L22,Trmq2adjL23L23,            & 
& Trmu2YuadjYu

Real(dp) :: g1p2,g1p3,g2p2,g2p3,g3p2,g3p3

Complex(dp) :: sqrt3ov5,ooSqrt15

Complex(dp) :: DyYdadjL211i1mlHd2i2(3,3),DyYdadjL222i1mlHd2i2(3,3),DyYdadjL233i1mlHd2i2(3,3),        & 
& DyYeCL111i1mlHd2i2(3,3),DyYeCL122i1mlHd2i2(3,3),DyYeCL133i1mlHd2i2(3,3),               & 
& DyadjL21mlHd2i1Yd1i2(3,3),DyadjL22mlHd2i1Yd2i2(3,3),DyadjL23mlHd2i1Yd3i2(3,3),         & 
& DyCL11mlHd2i1Ye1i2(3,3),DyCL12mlHd2i1Ye2i2(3,3),DyCL13mlHd2i1Ye3i2(3,3)

Complex(dp) :: L11(3,3), adjL11(3,3) 
Complex(dp) :: L12(3,3), adjL12(3,3) 
Complex(dp) :: L13(3,3), adjL13(3,3) 
Complex(dp) :: T11(3,3), adjT11(3,3) 
Complex(dp) :: T12(3,3), adjT12(3,3) 
Complex(dp) :: T13(3,3), adjT13(3,3) 
Complex(dp) :: L21(3,3), adjL21(3,3) 
Complex(dp) :: L22(3,3), adjL22(3,3) 
Complex(dp) :: L23(3,3), adjL23(3,3) 
Complex(dp) :: T21(3,3), adjT21(3,3) 
Complex(dp) :: T22(3,3), adjT22(3,3) 
Complex(dp) :: T23(3,3), adjT23(3,3) 
Iname = Iname +1 
NameOfUnit(Iname) = 'rge449' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters449(gy,g1,g2,g3,Yd,Ye,L1,L2,Yu,Mu,REps,Td,Te,T1,T2,Tu,              & 
& Bmu,Beps,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mlHd2,M1,M2,M3,vd,vu,vL)

L11=L1(:,:,1) 
Call Adjungate(L11,adjL11) 
L12=L1(:,:,2) 
Call Adjungate(L12,adjL12) 
L13=L1(:,:,3) 
Call Adjungate(L13,adjL13) 
T11=T1(:,:,1) 
Call Adjungate(T11,adjT11) 
T12=T1(:,:,2) 
Call Adjungate(T12,adjT12) 
T13=T1(:,:,3) 
Call Adjungate(T13,adjT13) 
L21=L2(:,:,1) 
Call Adjungate(L21,adjL21) 
L22=L2(:,:,2) 
Call Adjungate(L22,adjL22) 
L23=L2(:,:,3) 
Call Adjungate(L23,adjL23) 
T21=T2(:,:,1) 
Call Adjungate(T21,adjT21) 
T22=T2(:,:,2) 
Call Adjungate(T22,adjT22) 
T23=T2(:,:,3) 
Call Adjungate(T23,adjT23) 
AbsM1 = Conjg(M1)*M1
AbsM2 = Conjg(M2)*M2
AbsM3 = Conjg(M3)*M3
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yu,adjYu)
Call Adjungate(Td,adjTd)
Call Adjungate(Te,adjTe)
Call Adjungate(Tu,adjTu)
 md2Yd = Matmul(md2,Yd) 
 me2Ye = Matmul(me2,Ye) 
 ml2adjYe = Matmul(ml2,adjYe) 
 ml2CL11 = Matmul(ml2,Conjg(L11)) 
 ml2CL12 = Matmul(ml2,Conjg(L12)) 
 ml2CL13 = Matmul(ml2,Conjg(L13)) 
 mq2adjYd = Matmul(mq2,adjYd) 
 mq2adjYu = Matmul(mq2,adjYu) 
 mq2adjL21 = Matmul(mq2,adjL21) 
 mq2adjL22 = Matmul(mq2,adjL22) 
 mq2adjL23 = Matmul(mq2,adjL23) 
 mu2Yu = Matmul(mu2,Yu) 
 Ydmq2 = Matmul(Yd,mq2) 
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YdadjL21 = Matmul(Yd,adjL21) 
 YdadjL22 = Matmul(Yd,adjL22) 
 YdadjL23 = Matmul(Yd,adjL23) 
 Yeml2 = Matmul(Ye,ml2) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YeCL11 = Matmul(Ye,Conjg(L11)) 
 YeCL12 = Matmul(Ye,Conjg(L12)) 
 YeCL13 = Matmul(Ye,Conjg(L13)) 
 Yumq2 = Matmul(Yu,mq2) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjYdmd2 = Matmul(adjYd,md2) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYdTd = Matmul(adjYd,Td) 
 adjYeme2 = Matmul(adjYe,me2) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTe = Matmul(adjYe,Te) 
 adjYumu2 = Matmul(adjYu,mu2) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYuTu = Matmul(adjYu,Tu) 
 adjL21mlHd2 = Matmul(adjL21,mlHd2) 
 adjL21vL = Matmul(adjL21,vL) 
 adjL21REps = Matmul(adjL21,REps) 
 adjL21Beps = Matmul(adjL21,Beps) 
 adjL21L11 = Matmul(adjL21,L11) 
 adjL21L12 = Matmul(adjL21,L12) 
 adjL21L13 = Matmul(adjL21,L13) 
 adjL21L21 = Matmul(adjL21,L21) 
 adjL21L22 = Matmul(adjL21,L22) 
 adjL21L23 = Matmul(adjL21,L23) 
 adjL21T11 = Matmul(adjL21,T11) 
 adjL21T12 = Matmul(adjL21,T12) 
 adjL21T13 = Matmul(adjL21,T13) 
 adjL21T21 = Matmul(adjL21,T21) 
 adjL21T22 = Matmul(adjL21,T22) 
 adjL21T23 = Matmul(adjL21,T23) 
 adjL22mlHd2 = Matmul(adjL22,mlHd2) 
 adjL22vL = Matmul(adjL22,vL) 
 adjL22REps = Matmul(adjL22,REps) 
 adjL22Beps = Matmul(adjL22,Beps) 
 adjL22L11 = Matmul(adjL22,L11) 
 adjL22L12 = Matmul(adjL22,L12) 
 adjL22L13 = Matmul(adjL22,L13) 
 adjL22L21 = Matmul(adjL22,L21) 
 adjL22L22 = Matmul(adjL22,L22) 
 adjL22L23 = Matmul(adjL22,L23) 
 adjL22T11 = Matmul(adjL22,T11) 
 adjL22T12 = Matmul(adjL22,T12) 
 adjL22T13 = Matmul(adjL22,T13) 
 adjL22T21 = Matmul(adjL22,T21) 
 adjL22T22 = Matmul(adjL22,T22) 
 adjL22T23 = Matmul(adjL22,T23) 
 adjL23mlHd2 = Matmul(adjL23,mlHd2) 
 adjL23vL = Matmul(adjL23,vL) 
 adjL23REps = Matmul(adjL23,REps) 
 adjL23Beps = Matmul(adjL23,Beps) 
 adjL23L11 = Matmul(adjL23,L11) 
 adjL23L12 = Matmul(adjL23,L12) 
 adjL23L13 = Matmul(adjL23,L13) 
 adjL23L21 = Matmul(adjL23,L21) 
 adjL23L22 = Matmul(adjL23,L22) 
 adjL23L23 = Matmul(adjL23,L23) 
 adjL23T11 = Matmul(adjL23,T11) 
 adjL23T12 = Matmul(adjL23,T12) 
 adjL23T13 = Matmul(adjL23,T13) 
 adjL23T21 = Matmul(adjL23,T21) 
 adjL23T22 = Matmul(adjL23,T22) 
 adjL23T23 = Matmul(adjL23,T23) 
 adjTdTd = Matmul(adjTd,Td) 
 adjTeTe = Matmul(adjTe,Te) 
 adjTuTu = Matmul(adjTu,Tu) 
 adjT21T21 = Matmul(adjT21,T21) 
 adjT22T22 = Matmul(adjT22,T22) 
 adjT23T23 = Matmul(adjT23,T23) 
 Cml2L11 = Matmul(Conjg(ml2),L11) 
 Cml2L12 = Matmul(Conjg(ml2),L12) 
 Cml2L13 = Matmul(Conjg(ml2),L13) 
 Cml2L21 = Matmul(Conjg(ml2),L21) 
 Cml2L22 = Matmul(Conjg(ml2),L22) 
 Cml2L23 = Matmul(Conjg(ml2),L23) 
 Cmq2TpL21 = Matmul(Conjg(mq2),Transpose(L21)) 
 Cmq2TpL22 = Matmul(Conjg(mq2),Transpose(L22)) 
 Cmq2TpL23 = Matmul(Conjg(mq2),Transpose(L23)) 
 CYdTpL21 = Matmul(Conjg(Yd),Transpose(L21)) 
 CYdTpL22 = Matmul(Conjg(Yd),Transpose(L22)) 
 CYdTpL23 = Matmul(Conjg(Yd),Transpose(L23)) 
 CYdTpTd = Matmul(Conjg(Yd),Transpose(Td)) 
 CYdTpT21 = Matmul(Conjg(Yd),Transpose(T21)) 
 CYdTpT22 = Matmul(Conjg(Yd),Transpose(T22)) 
 CYdTpT23 = Matmul(Conjg(Yd),Transpose(T23)) 
 CYevL = Matmul(Conjg(Ye),vL) 
 CYeREps = Matmul(Conjg(Ye),REps) 
 CYeBeps = Matmul(Conjg(Ye),Beps) 
 CYeL11 = Matmul(Conjg(Ye),L11) 
 CYeL12 = Matmul(Conjg(Ye),L12) 
 CYeL13 = Matmul(Conjg(Ye),L13) 
 CYeL21 = Matmul(Conjg(Ye),L21) 
 CYeL22 = Matmul(Conjg(Ye),L22) 
 CYeL23 = Matmul(Conjg(Ye),L23) 
 CYeTpTe = Matmul(Conjg(Ye),Transpose(Te)) 
 CYeT11 = Matmul(Conjg(Ye),T11) 
 CYeT12 = Matmul(Conjg(Ye),T12) 
 CYeT13 = Matmul(Conjg(Ye),T13) 
 CYeT21 = Matmul(Conjg(Ye),T21) 
 CYeT22 = Matmul(Conjg(Ye),T22) 
 CYeT23 = Matmul(Conjg(Ye),T23) 
 CL11mlHd2 = Matmul(Conjg(L11),mlHd2) 
 CL11vL = Matmul(Conjg(L11),vL) 
 CL11REps = Matmul(Conjg(L11),REps) 
 CL11Beps = Matmul(Conjg(L11),Beps) 
 CL11Cml2 = Matmul(Conjg(L11),Conjg(ml2)) 
 CL11L11 = Matmul(Conjg(L11),L11) 
 CL11L12 = Matmul(Conjg(L11),L12) 
 CL11L13 = Matmul(Conjg(L11),L13) 
 CL11L21 = Matmul(Conjg(L11),L21) 
 CL11L22 = Matmul(Conjg(L11),L22) 
 CL11L23 = Matmul(Conjg(L11),L23) 
 CL11TpYe = Matmul(Conjg(L11),Transpose(Ye)) 
 CL11TpTe = Matmul(Conjg(L11),Transpose(Te)) 
 CL11T11 = Matmul(Conjg(L11),T11) 
 CL11T12 = Matmul(Conjg(L11),T12) 
 CL11T13 = Matmul(Conjg(L11),T13) 
 CL11T21 = Matmul(Conjg(L11),T21) 
 CL11T22 = Matmul(Conjg(L11),T22) 
 CL11T23 = Matmul(Conjg(L11),T23) 
 CL12mlHd2 = Matmul(Conjg(L12),mlHd2) 
 CL12vL = Matmul(Conjg(L12),vL) 
 CL12REps = Matmul(Conjg(L12),REps) 
 CL12Beps = Matmul(Conjg(L12),Beps) 
 CL12Cml2 = Matmul(Conjg(L12),Conjg(ml2)) 
 CL12L11 = Matmul(Conjg(L12),L11) 
 CL12L12 = Matmul(Conjg(L12),L12) 
 CL12L13 = Matmul(Conjg(L12),L13) 
 CL12L21 = Matmul(Conjg(L12),L21) 
 CL12L22 = Matmul(Conjg(L12),L22) 
 CL12L23 = Matmul(Conjg(L12),L23) 
 CL12TpYe = Matmul(Conjg(L12),Transpose(Ye)) 
 CL12TpTe = Matmul(Conjg(L12),Transpose(Te)) 
 CL12T11 = Matmul(Conjg(L12),T11) 
 CL12T12 = Matmul(Conjg(L12),T12) 
 CL12T13 = Matmul(Conjg(L12),T13) 
 CL12T21 = Matmul(Conjg(L12),T21) 
 CL12T22 = Matmul(Conjg(L12),T22) 
 CL12T23 = Matmul(Conjg(L12),T23) 
 CL13mlHd2 = Matmul(Conjg(L13),mlHd2) 
 CL13vL = Matmul(Conjg(L13),vL) 
 CL13REps = Matmul(Conjg(L13),REps) 
 CL13Beps = Matmul(Conjg(L13),Beps) 
 CL13Cml2 = Matmul(Conjg(L13),Conjg(ml2)) 
 CL13L11 = Matmul(Conjg(L13),L11) 
 CL13L12 = Matmul(Conjg(L13),L12) 
 CL13L13 = Matmul(Conjg(L13),L13) 
 CL13L21 = Matmul(Conjg(L13),L21) 
 CL13L22 = Matmul(Conjg(L13),L22) 
 CL13L23 = Matmul(Conjg(L13),L23) 
 CL13TpYe = Matmul(Conjg(L13),Transpose(Ye)) 
 CL13TpTe = Matmul(Conjg(L13),Transpose(Te)) 
 CL13T11 = Matmul(Conjg(L13),T11) 
 CL13T12 = Matmul(Conjg(L13),T12) 
 CL13T13 = Matmul(Conjg(L13),T13) 
 CL13T21 = Matmul(Conjg(L13),T21) 
 CL13T22 = Matmul(Conjg(L13),T22) 
 CL13T23 = Matmul(Conjg(L13),T23) 
 CL21TpYd = Matmul(Conjg(L21),Transpose(Yd)) 
 CL21TpL21 = Matmul(Conjg(L21),Transpose(L21)) 
Forall(i2=1:3)  CL21TpL21(i2,i2) =  Real(CL21TpL21(i2,i2),dp) 
 CL21TpL22 = Matmul(Conjg(L21),Transpose(L22)) 
 CL21TpL23 = Matmul(Conjg(L21),Transpose(L23)) 
 CL21TpTd = Matmul(Conjg(L21),Transpose(Td)) 
 CL21TpT21 = Matmul(Conjg(L21),Transpose(T21)) 
 CL22TpYd = Matmul(Conjg(L22),Transpose(Yd)) 
 CL22TpL21 = Matmul(Conjg(L22),Transpose(L21)) 
 CL22TpL22 = Matmul(Conjg(L22),Transpose(L22)) 
Forall(i2=1:3)  CL22TpL22(i2,i2) =  Real(CL22TpL22(i2,i2),dp) 
 CL22TpL23 = Matmul(Conjg(L22),Transpose(L23)) 
 CL22TpTd = Matmul(Conjg(L22),Transpose(Td)) 
 CL22TpT22 = Matmul(Conjg(L22),Transpose(T22)) 
 CL23TpYd = Matmul(Conjg(L23),Transpose(Yd)) 
 CL23TpL21 = Matmul(Conjg(L23),Transpose(L21)) 
 CL23TpL22 = Matmul(Conjg(L23),Transpose(L22)) 
 CL23TpL23 = Matmul(Conjg(L23),Transpose(L23)) 
Forall(i2=1:3)  CL23TpL23(i2,i2) =  Real(CL23TpL23(i2,i2),dp) 
 CL23TpTd = Matmul(Conjg(L23),Transpose(Td)) 
 CL23TpT23 = Matmul(Conjg(L23),Transpose(T23)) 
 CTdTpTd = Matmul(Conjg(Td),Transpose(Td)) 
Forall(i2=1:3)  CTdTpTd(i2,i2) =  Real(CTdTpTd(i2,i2),dp) 
 CTeTpTe = Matmul(Conjg(Te),Transpose(Te)) 
Forall(i2=1:3)  CTeTpTe(i2,i2) =  Real(CTeTpTe(i2,i2),dp) 
 CTuTpTu = Matmul(Conjg(Tu),Transpose(Tu)) 
Forall(i2=1:3)  CTuTpTu(i2,i2) =  Real(CTuTpTu(i2,i2),dp) 
 CT11T11 = Matmul(Conjg(T11),T11) 
 CT11T12 = Matmul(Conjg(T11),T12) 
 CT11T13 = Matmul(Conjg(T11),T13) 
 CT12T11 = Matmul(Conjg(T12),T11) 
 CT12T12 = Matmul(Conjg(T12),T12) 
 CT12T13 = Matmul(Conjg(T12),T13) 
 CT13T11 = Matmul(Conjg(T13),T11) 
 CT13T12 = Matmul(Conjg(T13),T12) 
 CT13T13 = Matmul(Conjg(T13),T13) 
 CT21TpT21 = Matmul(Conjg(T21),Transpose(T21)) 
Forall(i2=1:3)  CT21TpT21(i2,i2) =  Real(CT21TpT21(i2,i2),dp) 
 CT21TpT22 = Matmul(Conjg(T21),Transpose(T22)) 
 CT21TpT23 = Matmul(Conjg(T21),Transpose(T23)) 
 CT22TpT21 = Matmul(Conjg(T22),Transpose(T21)) 
 CT22TpT22 = Matmul(Conjg(T22),Transpose(T22)) 
Forall(i2=1:3)  CT22TpT22(i2,i2) =  Real(CT22TpT22(i2,i2),dp) 
 CT22TpT23 = Matmul(Conjg(T22),Transpose(T23)) 
 CT23TpT21 = Matmul(Conjg(T23),Transpose(T21)) 
 CT23TpT22 = Matmul(Conjg(T23),Transpose(T22)) 
 CT23TpT23 = Matmul(Conjg(T23),Transpose(T23)) 
Forall(i2=1:3)  CT23TpT23(i2,i2) =  Real(CT23TpT23(i2,i2),dp) 
 L11ml2 = Matmul(L11,ml2) 
 L12ml2 = Matmul(L12,ml2) 
 L13ml2 = Matmul(L13,ml2) 
 L21mq2 = Matmul(L21,mq2) 
 L22mq2 = Matmul(L22,mq2) 
 L23mq2 = Matmul(L23,mq2) 
 TdadjTd = Matmul(Td,adjTd) 
 TdadjT21 = Matmul(Td,adjT21) 
 TdadjT22 = Matmul(Td,adjT22) 
 TdadjT23 = Matmul(Td,adjT23) 
 TeadjTe = Matmul(Te,adjTe) 
 TeCT11 = Matmul(Te,Conjg(T11)) 
 TeCT12 = Matmul(Te,Conjg(T12)) 
 TeCT13 = Matmul(Te,Conjg(T13)) 
 TuadjTu = Matmul(Tu,adjTu) 
 TpL21ml2 = Matmul(Transpose(L21),ml2) 
 TpL22ml2 = Matmul(Transpose(L22),ml2) 
 TpL23ml2 = Matmul(Transpose(L23),ml2) 
 md2YdadjYd = Matmul(md2,YdadjYd) 
 md2YdadjL21 = Matmul(md2,YdadjL21) 
 md2YdadjL22 = Matmul(md2,YdadjL22) 
 md2YdadjL23 = Matmul(md2,YdadjL23) 
 me2YeadjYe = Matmul(me2,YeadjYe) 
 me2YeCL11 = Matmul(me2,YeCL11) 
 me2YeCL12 = Matmul(me2,YeCL12) 
 me2YeCL13 = Matmul(me2,YeCL13) 
 ml2adjYeYe = Matmul(ml2,adjYeYe) 
 ml2CL11L11 = Matmul(ml2,CL11L11) 
 ml2CL11L12 = Matmul(ml2,CL11L12) 
 ml2CL11L13 = Matmul(ml2,CL11L13) 
 ml2CL12L11 = Matmul(ml2,CL12L11) 
 ml2CL12L12 = Matmul(ml2,CL12L12) 
 ml2CL12L13 = Matmul(ml2,CL12L13) 
 ml2CL13L11 = Matmul(ml2,CL13L11) 
 ml2CL13L12 = Matmul(ml2,CL13L12) 
 ml2CL13L13 = Matmul(ml2,CL13L13) 
 ml2CL21TpYd = Matmul(ml2,CL21TpYd) 
 ml2CL21TpL21 = Matmul(ml2,CL21TpL21) 
 ml2CL21TpL22 = Matmul(ml2,CL21TpL22) 
 ml2CL21TpL23 = Matmul(ml2,CL21TpL23) 
 ml2CL22TpYd = Matmul(ml2,CL22TpYd) 
 ml2CL22TpL21 = Matmul(ml2,CL22TpL21) 
 ml2CL22TpL22 = Matmul(ml2,CL22TpL22) 
 ml2CL22TpL23 = Matmul(ml2,CL22TpL23) 
 ml2CL23TpYd = Matmul(ml2,CL23TpYd) 
 ml2CL23TpL21 = Matmul(ml2,CL23TpL21) 
 ml2CL23TpL22 = Matmul(ml2,CL23TpL22) 
 ml2CL23TpL23 = Matmul(ml2,CL23TpL23) 
 mq2adjYdYd = Matmul(mq2,adjYdYd) 
 mq2adjYuYu = Matmul(mq2,adjYuYu) 
 mq2adjL21L21 = Matmul(mq2,adjL21L21) 
 mq2adjL21L22 = Matmul(mq2,adjL21L22) 
 mq2adjL21L23 = Matmul(mq2,adjL21L23) 
 mq2adjL22L21 = Matmul(mq2,adjL22L21) 
 mq2adjL22L22 = Matmul(mq2,adjL22L22) 
 mq2adjL22L23 = Matmul(mq2,adjL22L23) 
 mq2adjL23L21 = Matmul(mq2,adjL23L21) 
 mq2adjL23L22 = Matmul(mq2,adjL23L22) 
 mq2adjL23L23 = Matmul(mq2,adjL23L23) 
 mu2YuadjYu = Matmul(mu2,YuadjYu) 
 Ydmq2adjYd = Matmul(Yd,mq2adjYd) 
Forall(i2=1:3)  Ydmq2adjYd(i2,i2) =  Real(Ydmq2adjYd(i2,i2),dp) 
 Ydmq2adjL21 = Matmul(Yd,mq2adjL21) 
 Ydmq2adjL22 = Matmul(Yd,mq2adjL22) 
 Ydmq2adjL23 = Matmul(Yd,mq2adjL23) 
 YdadjYdmd2 = Matmul(Yd,adjYdmd2) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYdTd = Matmul(Yd,adjYdTd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YdadjYuTu = Matmul(Yd,adjYuTu) 
 YdadjL21mlHd2 = Matmul(Yd,adjL21mlHd2) 
 YdadjL21vL = Matmul(Yd,adjL21vL) 
 YdadjL21REps = Matmul(Yd,adjL21REps) 
 YdadjL21Beps = Matmul(Yd,adjL21Beps) 
 YdadjL21L21 = Matmul(Yd,adjL21L21) 
 YdadjL21L22 = Matmul(Yd,adjL21L22) 
 YdadjL21L23 = Matmul(Yd,adjL21L23) 
 YdadjL21T11 = Matmul(Yd,adjL21T11) 
 YdadjL21T12 = Matmul(Yd,adjL21T12) 
 YdadjL21T13 = Matmul(Yd,adjL21T13) 
 YdadjL21T21 = Matmul(Yd,adjL21T21) 
 YdadjL21T22 = Matmul(Yd,adjL21T22) 
 YdadjL21T23 = Matmul(Yd,adjL21T23) 
 YdadjL22mlHd2 = Matmul(Yd,adjL22mlHd2) 
 YdadjL22vL = Matmul(Yd,adjL22vL) 
 YdadjL22REps = Matmul(Yd,adjL22REps) 
 YdadjL22Beps = Matmul(Yd,adjL22Beps) 
 YdadjL22L21 = Matmul(Yd,adjL22L21) 
 YdadjL22L22 = Matmul(Yd,adjL22L22) 
 YdadjL22L23 = Matmul(Yd,adjL22L23) 
 YdadjL22T11 = Matmul(Yd,adjL22T11) 
 YdadjL22T12 = Matmul(Yd,adjL22T12) 
 YdadjL22T13 = Matmul(Yd,adjL22T13) 
 YdadjL22T21 = Matmul(Yd,adjL22T21) 
 YdadjL22T22 = Matmul(Yd,adjL22T22) 
 YdadjL22T23 = Matmul(Yd,adjL22T23) 
 YdadjL23mlHd2 = Matmul(Yd,adjL23mlHd2) 
 YdadjL23vL = Matmul(Yd,adjL23vL) 
 YdadjL23REps = Matmul(Yd,adjL23REps) 
 YdadjL23Beps = Matmul(Yd,adjL23Beps) 
 YdadjL23L21 = Matmul(Yd,adjL23L21) 
 YdadjL23L22 = Matmul(Yd,adjL23L22) 
 YdadjL23L23 = Matmul(Yd,adjL23L23) 
 YdadjL23T11 = Matmul(Yd,adjL23T11) 
 YdadjL23T12 = Matmul(Yd,adjL23T12) 
 YdadjL23T13 = Matmul(Yd,adjL23T13) 
 YdadjL23T21 = Matmul(Yd,adjL23T21) 
 YdadjL23T22 = Matmul(Yd,adjL23T22) 
 YdadjL23T23 = Matmul(Yd,adjL23T23) 
 Yeml2adjYe = Matmul(Ye,ml2adjYe) 
Forall(i2=1:3)  Yeml2adjYe(i2,i2) =  Real(Yeml2adjYe(i2,i2),dp) 
 Yeml2CL11 = Matmul(Ye,ml2CL11) 
 Yeml2CL12 = Matmul(Ye,ml2CL12) 
 Yeml2CL13 = Matmul(Ye,ml2CL13) 
 YeadjYeme2 = Matmul(Ye,adjYeme2) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YeadjYeTe = Matmul(Ye,adjYeTe) 
 YeCL11mlHd2 = Matmul(Ye,CL11mlHd2) 
 YeCL11vL = Matmul(Ye,CL11vL) 
 YeCL11REps = Matmul(Ye,CL11REps) 
 YeCL11Beps = Matmul(Ye,CL11Beps) 
 YeCL11Cml2 = Matmul(Ye,CL11Cml2) 
 YeCL11L11 = Matmul(Ye,CL11L11) 
 YeCL11L21 = Matmul(Ye,CL11L21) 
 YeCL11L22 = Matmul(Ye,CL11L22) 
 YeCL11L23 = Matmul(Ye,CL11L23) 
 YeCL11T11 = Matmul(Ye,CL11T11) 
 YeCL11T12 = Matmul(Ye,CL11T12) 
 YeCL11T13 = Matmul(Ye,CL11T13) 
 YeCL11T21 = Matmul(Ye,CL11T21) 
 YeCL11T22 = Matmul(Ye,CL11T22) 
 YeCL11T23 = Matmul(Ye,CL11T23) 
 YeCL12mlHd2 = Matmul(Ye,CL12mlHd2) 
 YeCL12vL = Matmul(Ye,CL12vL) 
 YeCL12REps = Matmul(Ye,CL12REps) 
 YeCL12Beps = Matmul(Ye,CL12Beps) 
 YeCL12Cml2 = Matmul(Ye,CL12Cml2) 
 YeCL12L12 = Matmul(Ye,CL12L12) 
 YeCL12L21 = Matmul(Ye,CL12L21) 
 YeCL12L22 = Matmul(Ye,CL12L22) 
 YeCL12L23 = Matmul(Ye,CL12L23) 
 YeCL12T11 = Matmul(Ye,CL12T11) 
 YeCL12T12 = Matmul(Ye,CL12T12) 
 YeCL12T13 = Matmul(Ye,CL12T13) 
 YeCL12T21 = Matmul(Ye,CL12T21) 
 YeCL12T22 = Matmul(Ye,CL12T22) 
 YeCL12T23 = Matmul(Ye,CL12T23) 
 YeCL13mlHd2 = Matmul(Ye,CL13mlHd2) 
 YeCL13vL = Matmul(Ye,CL13vL) 
 YeCL13REps = Matmul(Ye,CL13REps) 
 YeCL13Beps = Matmul(Ye,CL13Beps) 
 YeCL13Cml2 = Matmul(Ye,CL13Cml2) 
 YeCL13L13 = Matmul(Ye,CL13L13) 
 YeCL13L21 = Matmul(Ye,CL13L21) 
 YeCL13L22 = Matmul(Ye,CL13L22) 
 YeCL13L23 = Matmul(Ye,CL13L23) 
 YeCL13T11 = Matmul(Ye,CL13T11) 
 YeCL13T12 = Matmul(Ye,CL13T12) 
 YeCL13T13 = Matmul(Ye,CL13T13) 
 YeCL13T21 = Matmul(Ye,CL13T21) 
 YeCL13T22 = Matmul(Ye,CL13T22) 
 YeCL13T23 = Matmul(Ye,CL13T23) 
 YeCL21TpL21 = Matmul(Ye,CL21TpL21) 
 YeCL21TpT21 = Matmul(Ye,CL21TpT21) 
 YeCL22TpL22 = Matmul(Ye,CL22TpL22) 
 YeCL22TpT22 = Matmul(Ye,CL22TpT22) 
 YeCL23TpL23 = Matmul(Ye,CL23TpL23) 
 YeCL23TpT23 = Matmul(Ye,CL23TpT23) 
 Yumq2adjYu = Matmul(Yu,mq2adjYu) 
Forall(i2=1:3)  Yumq2adjYu(i2,i2) =  Real(Yumq2adjYu(i2,i2),dp) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYdTd = Matmul(Yu,adjYdTd) 
 YuadjYumu2 = Matmul(Yu,adjYumu2) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 YuadjYuTu = Matmul(Yu,adjYuTu) 
 YuadjL21L21 = Matmul(Yu,adjL21L21) 
 YuadjL21T21 = Matmul(Yu,adjL21T21) 
 YuadjL22L22 = Matmul(Yu,adjL22L22) 
 YuadjL22T22 = Matmul(Yu,adjL22T22) 
 YuadjL23L23 = Matmul(Yu,adjL23L23) 
 YuadjL23T23 = Matmul(Yu,adjL23T23) 
 adjYdmd2Yd = Matmul(adjYd,md2Yd) 
Forall(i2=1:3)  adjYdmd2Yd(i2,i2) =  Real(adjYdmd2Yd(i2,i2),dp) 
 adjYdYdmq2 = Matmul(adjYd,Ydmq2) 
 adjYeme2Ye = Matmul(adjYe,me2Ye) 
Forall(i2=1:3)  adjYeme2Ye(i2,i2) =  Real(adjYeme2Ye(i2,i2),dp) 
 adjYeYeml2 = Matmul(adjYe,Yeml2) 
 adjYumu2Yu = Matmul(adjYu,mu2Yu) 
Forall(i2=1:3)  adjYumu2Yu(i2,i2) =  Real(adjYumu2Yu(i2,i2),dp) 
 adjYuYumq2 = Matmul(adjYu,Yumq2) 
 adjL21Cml2L21 = Matmul(adjL21,Cml2L21) 
 adjL21L21mq2 = Matmul(adjL21,L21mq2) 
 adjL22Cml2L22 = Matmul(adjL22,Cml2L22) 
 adjL22L22mq2 = Matmul(adjL22,L22mq2) 
 adjL23Cml2L23 = Matmul(adjL23,Cml2L23) 
 adjL23L23mq2 = Matmul(adjL23,L23mq2) 
 CL11Cml2L11 = Matmul(Conjg(L11),Cml2L11) 
 CL11L11ml2 = Matmul(Conjg(L11),L11ml2) 
 CL12Cml2L12 = Matmul(Conjg(L12),Cml2L12) 
 CL12L12ml2 = Matmul(Conjg(L12),L12ml2) 
 CL13Cml2L13 = Matmul(Conjg(L13),Cml2L13) 
 CL13L13ml2 = Matmul(Conjg(L13),L13ml2) 
 CL21Cmq2TpL21 = Matmul(Conjg(L21),Cmq2TpL21) 
Forall(i2=1:3)  CL21Cmq2TpL21(i2,i2) =  Real(CL21Cmq2TpL21(i2,i2),dp) 
 CL21TpL21ml2 = Matmul(Conjg(L21),TpL21ml2) 
 CL22Cmq2TpL22 = Matmul(Conjg(L22),Cmq2TpL22) 
Forall(i2=1:3)  CL22Cmq2TpL22(i2,i2) =  Real(CL22Cmq2TpL22(i2,i2),dp) 
 CL22TpL22ml2 = Matmul(Conjg(L22),TpL22ml2) 
 CL23Cmq2TpL23 = Matmul(Conjg(L23),Cmq2TpL23) 
Forall(i2=1:3)  CL23Cmq2TpL23(i2,i2) =  Real(CL23Cmq2TpL23(i2,i2),dp) 
 CL23TpL23ml2 = Matmul(Conjg(L23),TpL23ml2) 
 L11adjYeYe = Matmul(L11,adjYeYe) 
 L11adjYeTe = Matmul(L11,adjYeTe) 
 L11CL11vL = Matmul(L11,CL11vL) 
 L11CL11REps = Matmul(L11,CL11REps) 
 L11CL11Beps = Matmul(L11,CL11Beps) 
 L11CL11L11 = Matmul(L11,CL11L11) 
 L11CL11L12 = Matmul(L11,CL11L12) 
 L11CL11L13 = Matmul(L11,CL11L13) 
 L11CL11L21 = Matmul(L11,CL11L21) 
 L11CL11L22 = Matmul(L11,CL11L22) 
 L11CL11L23 = Matmul(L11,CL11L23) 
 L11CL11TpYe = Matmul(L11,CL11TpYe) 
 L11CL11TpTe = Matmul(L11,CL11TpTe) 
 L11CL11T11 = Matmul(L11,CL11T11) 
 L11CL11T12 = Matmul(L11,CL11T12) 
 L11CL11T13 = Matmul(L11,CL11T13) 
 L11CL11T21 = Matmul(L11,CL11T21) 
 L11CL11T22 = Matmul(L11,CL11T22) 
 L11CL11T23 = Matmul(L11,CL11T23) 
 L11CL12L12 = Matmul(L11,CL12L12) 
 L11CL12TpYe = Matmul(L11,CL12TpYe) 
 L11CL12TpTe = Matmul(L11,CL12TpTe) 
 L11CL12T12 = Matmul(L11,CL12T12) 
 L11CL13L13 = Matmul(L11,CL13L13) 
 L11CL13TpYe = Matmul(L11,CL13TpYe) 
 L11CL13TpTe = Matmul(L11,CL13TpTe) 
 L11CL13T13 = Matmul(L11,CL13T13) 
 L11CL21TpYd = Matmul(L11,CL21TpYd) 
 L11CL21TpL21 = Matmul(L11,CL21TpL21) 
 L11CL21TpTd = Matmul(L11,CL21TpTd) 
 L11CL21TpT21 = Matmul(L11,CL21TpT21) 
 L11CL22TpYd = Matmul(L11,CL22TpYd) 
 L11CL22TpL22 = Matmul(L11,CL22TpL22) 
 L11CL22TpTd = Matmul(L11,CL22TpTd) 
 L11CL22TpT22 = Matmul(L11,CL22TpT22) 
 L11CL23TpYd = Matmul(L11,CL23TpYd) 
 L11CL23TpL23 = Matmul(L11,CL23TpL23) 
 L11CL23TpTd = Matmul(L11,CL23TpTd) 
 L11CL23TpT23 = Matmul(L11,CL23TpT23) 
 L12adjYeYe = Matmul(L12,adjYeYe) 
 L12adjYeTe = Matmul(L12,adjYeTe) 
 L12CL11L11 = Matmul(L12,CL11L11) 
 L12CL11TpYe = Matmul(L12,CL11TpYe) 
 L12CL11TpTe = Matmul(L12,CL11TpTe) 
 L12CL11T11 = Matmul(L12,CL11T11) 
 L12CL12vL = Matmul(L12,CL12vL) 
 L12CL12REps = Matmul(L12,CL12REps) 
 L12CL12Beps = Matmul(L12,CL12Beps) 
 L12CL12L11 = Matmul(L12,CL12L11) 
 L12CL12L12 = Matmul(L12,CL12L12) 
 L12CL12L13 = Matmul(L12,CL12L13) 
 L12CL12L21 = Matmul(L12,CL12L21) 
 L12CL12L22 = Matmul(L12,CL12L22) 
 L12CL12L23 = Matmul(L12,CL12L23) 
 L12CL12TpYe = Matmul(L12,CL12TpYe) 
 L12CL12TpTe = Matmul(L12,CL12TpTe) 
 L12CL12T11 = Matmul(L12,CL12T11) 
 L12CL12T12 = Matmul(L12,CL12T12) 
 L12CL12T13 = Matmul(L12,CL12T13) 
 L12CL12T21 = Matmul(L12,CL12T21) 
 L12CL12T22 = Matmul(L12,CL12T22) 
 L12CL12T23 = Matmul(L12,CL12T23) 
 L12CL13L13 = Matmul(L12,CL13L13) 
 L12CL13TpYe = Matmul(L12,CL13TpYe) 
 L12CL13TpTe = Matmul(L12,CL13TpTe) 
 L12CL13T13 = Matmul(L12,CL13T13) 
 L12CL21TpYd = Matmul(L12,CL21TpYd) 
 L12CL21TpL21 = Matmul(L12,CL21TpL21) 
 L12CL21TpTd = Matmul(L12,CL21TpTd) 
 L12CL21TpT21 = Matmul(L12,CL21TpT21) 
 L12CL22TpYd = Matmul(L12,CL22TpYd) 
 L12CL22TpL22 = Matmul(L12,CL22TpL22) 
 L12CL22TpTd = Matmul(L12,CL22TpTd) 
 L12CL22TpT22 = Matmul(L12,CL22TpT22) 
 L12CL23TpYd = Matmul(L12,CL23TpYd) 
 L12CL23TpL23 = Matmul(L12,CL23TpL23) 
 L12CL23TpTd = Matmul(L12,CL23TpTd) 
 L12CL23TpT23 = Matmul(L12,CL23TpT23) 
 L13adjYeYe = Matmul(L13,adjYeYe) 
 L13adjYeTe = Matmul(L13,adjYeTe) 
 L13CL11L11 = Matmul(L13,CL11L11) 
 L13CL11TpYe = Matmul(L13,CL11TpYe) 
 L13CL11TpTe = Matmul(L13,CL11TpTe) 
 L13CL11T11 = Matmul(L13,CL11T11) 
 L13CL12L12 = Matmul(L13,CL12L12) 
 L13CL12TpYe = Matmul(L13,CL12TpYe) 
 L13CL12TpTe = Matmul(L13,CL12TpTe) 
 L13CL12T12 = Matmul(L13,CL12T12) 
 L13CL13vL = Matmul(L13,CL13vL) 
 L13CL13REps = Matmul(L13,CL13REps) 
 L13CL13Beps = Matmul(L13,CL13Beps) 
 L13CL13L11 = Matmul(L13,CL13L11) 
 L13CL13L12 = Matmul(L13,CL13L12) 
 L13CL13L13 = Matmul(L13,CL13L13) 
 L13CL13L21 = Matmul(L13,CL13L21) 
 L13CL13L22 = Matmul(L13,CL13L22) 
 L13CL13L23 = Matmul(L13,CL13L23) 
 L13CL13TpYe = Matmul(L13,CL13TpYe) 
 L13CL13TpTe = Matmul(L13,CL13TpTe) 
 L13CL13T11 = Matmul(L13,CL13T11) 
 L13CL13T12 = Matmul(L13,CL13T12) 
 L13CL13T13 = Matmul(L13,CL13T13) 
 L13CL13T21 = Matmul(L13,CL13T21) 
 L13CL13T22 = Matmul(L13,CL13T22) 
 L13CL13T23 = Matmul(L13,CL13T23) 
 L13CL21TpYd = Matmul(L13,CL21TpYd) 
 L13CL21TpL21 = Matmul(L13,CL21TpL21) 
 L13CL21TpTd = Matmul(L13,CL21TpTd) 
 L13CL21TpT21 = Matmul(L13,CL21TpT21) 
 L13CL22TpYd = Matmul(L13,CL22TpYd) 
 L13CL22TpL22 = Matmul(L13,CL22TpL22) 
 L13CL22TpTd = Matmul(L13,CL22TpTd) 
 L13CL22TpT22 = Matmul(L13,CL22TpT22) 
 L13CL23TpYd = Matmul(L13,CL23TpYd) 
 L13CL23TpL23 = Matmul(L13,CL23TpL23) 
 L13CL23TpTd = Matmul(L13,CL23TpTd) 
 L13CL23TpT23 = Matmul(L13,CL23TpT23) 
 L21adjYdYd = Matmul(L21,adjYdYd) 
 L21adjYdTd = Matmul(L21,adjYdTd) 
 L21adjYuYu = Matmul(L21,adjYuYu) 
 L21adjYuTu = Matmul(L21,adjYuTu) 
 L21adjL21vL = Matmul(L21,adjL21vL) 
 L21adjL21REps = Matmul(L21,adjL21REps) 
 L21adjL21Beps = Matmul(L21,adjL21Beps) 
 L21adjL21L11 = Matmul(L21,adjL21L11) 
 L21adjL21L12 = Matmul(L21,adjL21L12) 
 L21adjL21L13 = Matmul(L21,adjL21L13) 
 L21adjL21L21 = Matmul(L21,adjL21L21) 
 L21adjL21L22 = Matmul(L21,adjL21L22) 
 L21adjL21L23 = Matmul(L21,adjL21L23) 
 L21adjL21T11 = Matmul(L21,adjL21T11) 
 L21adjL21T12 = Matmul(L21,adjL21T12) 
 L21adjL21T13 = Matmul(L21,adjL21T13) 
 L21adjL21T21 = Matmul(L21,adjL21T21) 
 L21adjL21T22 = Matmul(L21,adjL21T22) 
 L21adjL21T23 = Matmul(L21,adjL21T23) 
 L21adjL22L22 = Matmul(L21,adjL22L22) 
 L21adjL22T22 = Matmul(L21,adjL22T22) 
 L21adjL23L23 = Matmul(L21,adjL23L23) 
 L21adjL23T23 = Matmul(L21,adjL23T23) 
 L22adjYdYd = Matmul(L22,adjYdYd) 
 L22adjYdTd = Matmul(L22,adjYdTd) 
 L22adjYuYu = Matmul(L22,adjYuYu) 
 L22adjYuTu = Matmul(L22,adjYuTu) 
 L22adjL21L21 = Matmul(L22,adjL21L21) 
 L22adjL21T21 = Matmul(L22,adjL21T21) 
 L22adjL22vL = Matmul(L22,adjL22vL) 
 L22adjL22REps = Matmul(L22,adjL22REps) 
 L22adjL22Beps = Matmul(L22,adjL22Beps) 
 L22adjL22L11 = Matmul(L22,adjL22L11) 
 L22adjL22L12 = Matmul(L22,adjL22L12) 
 L22adjL22L13 = Matmul(L22,adjL22L13) 
 L22adjL22L21 = Matmul(L22,adjL22L21) 
 L22adjL22L22 = Matmul(L22,adjL22L22) 
 L22adjL22L23 = Matmul(L22,adjL22L23) 
 L22adjL22T11 = Matmul(L22,adjL22T11) 
 L22adjL22T12 = Matmul(L22,adjL22T12) 
 L22adjL22T13 = Matmul(L22,adjL22T13) 
 L22adjL22T21 = Matmul(L22,adjL22T21) 
 L22adjL22T22 = Matmul(L22,adjL22T22) 
 L22adjL22T23 = Matmul(L22,adjL22T23) 
 L22adjL23L23 = Matmul(L22,adjL23L23) 
 L22adjL23T23 = Matmul(L22,adjL23T23) 
 L23adjYdYd = Matmul(L23,adjYdYd) 
 L23adjYdTd = Matmul(L23,adjYdTd) 
 L23adjYuYu = Matmul(L23,adjYuYu) 
 L23adjYuTu = Matmul(L23,adjYuTu) 
 L23adjL21L21 = Matmul(L23,adjL21L21) 
 L23adjL21T21 = Matmul(L23,adjL21T21) 
 L23adjL22L22 = Matmul(L23,adjL22L22) 
 L23adjL22T22 = Matmul(L23,adjL22T22) 
 L23adjL23vL = Matmul(L23,adjL23vL) 
 L23adjL23REps = Matmul(L23,adjL23REps) 
 L23adjL23Beps = Matmul(L23,adjL23Beps) 
 L23adjL23L11 = Matmul(L23,adjL23L11) 
 L23adjL23L12 = Matmul(L23,adjL23L12) 
 L23adjL23L13 = Matmul(L23,adjL23L13) 
 L23adjL23L21 = Matmul(L23,adjL23L21) 
 L23adjL23L22 = Matmul(L23,adjL23L22) 
 L23adjL23L23 = Matmul(L23,adjL23L23) 
 L23adjL23T11 = Matmul(L23,adjL23T11) 
 L23adjL23T12 = Matmul(L23,adjL23T12) 
 L23adjL23T13 = Matmul(L23,adjL23T13) 
 L23adjL23T21 = Matmul(L23,adjL23T21) 
 L23adjL23T22 = Matmul(L23,adjL23T22) 
 L23adjL23T23 = Matmul(L23,adjL23T23) 
 TdadjYdYd = Matmul(Td,adjYdYd) 
 TdadjYuYu = Matmul(Td,adjYuYu) 
 TdadjL21REps = Matmul(Td,adjL21REps) 
 TdadjL21L21 = Matmul(Td,adjL21L21) 
 TdadjL22REps = Matmul(Td,adjL22REps) 
 TdadjL22L22 = Matmul(Td,adjL22L22) 
 TdadjL23REps = Matmul(Td,adjL23REps) 
 TdadjL23L23 = Matmul(Td,adjL23L23) 
 TeadjYeYe = Matmul(Te,adjYeYe) 
 TeCL11REps = Matmul(Te,CL11REps) 
 TeCL11L11 = Matmul(Te,CL11L11) 
 TeCL12REps = Matmul(Te,CL12REps) 
 TeCL12L12 = Matmul(Te,CL12L12) 
 TeCL13REps = Matmul(Te,CL13REps) 
 TeCL13L13 = Matmul(Te,CL13L13) 
 TeCL21TpL21 = Matmul(Te,CL21TpL21) 
 TeCL22TpL22 = Matmul(Te,CL22TpL22) 
 TeCL23TpL23 = Matmul(Te,CL23TpL23) 
 TuadjYdYd = Matmul(Tu,adjYdYd) 
 TuadjYuYu = Matmul(Tu,adjYuYu) 
 TuadjL21L21 = Matmul(Tu,adjL21L21) 
 TuadjL22L22 = Matmul(Tu,adjL22L22) 
 TuadjL23L23 = Matmul(Tu,adjL23L23) 
 TpYeCYevL = Matmul(Transpose(Ye),CYevL) 
 TpYeCYeREps = Matmul(Transpose(Ye),CYeREps) 
 TpYeCYeBeps = Matmul(Transpose(Ye),CYeBeps) 
 TpYeCYeL11 = Matmul(Transpose(Ye),CYeL11) 
 TpYeCYeL12 = Matmul(Transpose(Ye),CYeL12) 
 TpYeCYeL13 = Matmul(Transpose(Ye),CYeL13) 
 TpYeCYeL21 = Matmul(Transpose(Ye),CYeL21) 
 TpYeCYeL22 = Matmul(Transpose(Ye),CYeL22) 
 TpYeCYeL23 = Matmul(Transpose(Ye),CYeL23) 
 TpYeCYeT11 = Matmul(Transpose(Ye),CYeT11) 
 TpYeCYeT12 = Matmul(Transpose(Ye),CYeT12) 
 TpYeCYeT13 = Matmul(Transpose(Ye),CYeT13) 
 TpYeCYeT21 = Matmul(Transpose(Ye),CYeT21) 
 TpYeCYeT22 = Matmul(Transpose(Ye),CYeT22) 
 TpYeCYeT23 = Matmul(Transpose(Ye),CYeT23) 
 TpL21CL11TpTe = Matmul(Transpose(L21),CL11TpTe) 
 TpL21CL12TpTe = Matmul(Transpose(L21),CL12TpTe) 
 TpL21CL13TpTe = Matmul(Transpose(L21),CL13TpTe) 
 TpL21CL21TpTd = Matmul(Transpose(L21),CL21TpTd) 
 TpL21CL22TpTd = Matmul(Transpose(L21),CL22TpTd) 
 TpL21CL23TpTd = Matmul(Transpose(L21),CL23TpTd) 
 TpL22CL11TpTe = Matmul(Transpose(L22),CL11TpTe) 
 TpL22CL12TpTe = Matmul(Transpose(L22),CL12TpTe) 
 TpL22CL13TpTe = Matmul(Transpose(L22),CL13TpTe) 
 TpL22CL21TpTd = Matmul(Transpose(L22),CL21TpTd) 
 TpL22CL22TpTd = Matmul(Transpose(L22),CL22TpTd) 
 TpL22CL23TpTd = Matmul(Transpose(L22),CL23TpTd) 
 TpL23CL11TpTe = Matmul(Transpose(L23),CL11TpTe) 
 TpL23CL12TpTe = Matmul(Transpose(L23),CL12TpTe) 
 TpL23CL13TpTe = Matmul(Transpose(L23),CL13TpTe) 
 TpL23CL21TpTd = Matmul(Transpose(L23),CL21TpTd) 
 TpL23CL22TpTd = Matmul(Transpose(L23),CL22TpTd) 
 TpL23CL23TpTd = Matmul(Transpose(L23),CL23TpTd) 
 TpTeCYeREps = Matmul(Transpose(Te),CYeREps) 
 TpTeCYeL11 = Matmul(Transpose(Te),CYeL11) 
 TpTeCYeL12 = Matmul(Transpose(Te),CYeL12) 
 TpTeCYeL13 = Matmul(Transpose(Te),CYeL13) 
 TpTeCYeL21 = Matmul(Transpose(Te),CYeL21) 
 TpTeCYeL22 = Matmul(Transpose(Te),CYeL22) 
 TpTeCYeL23 = Matmul(Transpose(Te),CYeL23) 
 T11adjYeYe = Matmul(T11,adjYeYe) 
 T11CL11REps = Matmul(T11,CL11REps) 
 T11CL11L11 = Matmul(T11,CL11L11) 
 T11CL11L12 = Matmul(T11,CL11L12) 
 T11CL11L13 = Matmul(T11,CL11L13) 
 T11CL11L21 = Matmul(T11,CL11L21) 
 T11CL11L22 = Matmul(T11,CL11L22) 
 T11CL11L23 = Matmul(T11,CL11L23) 
 T11CL12L12 = Matmul(T11,CL12L12) 
 T11CL13L13 = Matmul(T11,CL13L13) 
 T11CL21TpL21 = Matmul(T11,CL21TpL21) 
 T11CL22TpL22 = Matmul(T11,CL22TpL22) 
 T11CL23TpL23 = Matmul(T11,CL23TpL23) 
 T12adjYeYe = Matmul(T12,adjYeYe) 
 T12CL11L11 = Matmul(T12,CL11L11) 
 T12CL12REps = Matmul(T12,CL12REps) 
 T12CL12L11 = Matmul(T12,CL12L11) 
 T12CL12L12 = Matmul(T12,CL12L12) 
 T12CL12L13 = Matmul(T12,CL12L13) 
 T12CL12L21 = Matmul(T12,CL12L21) 
 T12CL12L22 = Matmul(T12,CL12L22) 
 T12CL12L23 = Matmul(T12,CL12L23) 
 T12CL13L13 = Matmul(T12,CL13L13) 
 T12CL21TpL21 = Matmul(T12,CL21TpL21) 
 T12CL22TpL22 = Matmul(T12,CL22TpL22) 
 T12CL23TpL23 = Matmul(T12,CL23TpL23) 
 T13adjYeYe = Matmul(T13,adjYeYe) 
 T13CL11L11 = Matmul(T13,CL11L11) 
 T13CL12L12 = Matmul(T13,CL12L12) 
 T13CL13REps = Matmul(T13,CL13REps) 
 T13CL13L11 = Matmul(T13,CL13L11) 
 T13CL13L12 = Matmul(T13,CL13L12) 
 T13CL13L13 = Matmul(T13,CL13L13) 
 T13CL13L21 = Matmul(T13,CL13L21) 
 T13CL13L22 = Matmul(T13,CL13L22) 
 T13CL13L23 = Matmul(T13,CL13L23) 
 T13CL21TpL21 = Matmul(T13,CL21TpL21) 
 T13CL22TpL22 = Matmul(T13,CL22TpL22) 
 T13CL23TpL23 = Matmul(T13,CL23TpL23) 
 T21adjYdYd = Matmul(T21,adjYdYd) 
 T21adjYuYu = Matmul(T21,adjYuYu) 
 T21adjL21REps = Matmul(T21,adjL21REps) 
 T21adjL21L11 = Matmul(T21,adjL21L11) 
 T21adjL21L12 = Matmul(T21,adjL21L12) 
 T21adjL21L13 = Matmul(T21,adjL21L13) 
 T21adjL21L21 = Matmul(T21,adjL21L21) 
 T21adjL21L22 = Matmul(T21,adjL21L22) 
 T21adjL21L23 = Matmul(T21,adjL21L23) 
 T21adjL22L22 = Matmul(T21,adjL22L22) 
 T21adjL23L23 = Matmul(T21,adjL23L23) 
 T22adjYdYd = Matmul(T22,adjYdYd) 
 T22adjYuYu = Matmul(T22,adjYuYu) 
 T22adjL21L21 = Matmul(T22,adjL21L21) 
 T22adjL22REps = Matmul(T22,adjL22REps) 
 T22adjL22L11 = Matmul(T22,adjL22L11) 
 T22adjL22L12 = Matmul(T22,adjL22L12) 
 T22adjL22L13 = Matmul(T22,adjL22L13) 
 T22adjL22L21 = Matmul(T22,adjL22L21) 
 T22adjL22L22 = Matmul(T22,adjL22L22) 
 T22adjL22L23 = Matmul(T22,adjL22L23) 
 T22adjL23L23 = Matmul(T22,adjL23L23) 
 T23adjYdYd = Matmul(T23,adjYdYd) 
 T23adjYuYu = Matmul(T23,adjYuYu) 
 T23adjL21L21 = Matmul(T23,adjL21L21) 
 T23adjL22L22 = Matmul(T23,adjL22L22) 
 T23adjL23REps = Matmul(T23,adjL23REps) 
 T23adjL23L11 = Matmul(T23,adjL23L11) 
 T23adjL23L12 = Matmul(T23,adjL23L12) 
 T23adjL23L13 = Matmul(T23,adjL23L13) 
 T23adjL23L21 = Matmul(T23,adjL23L21) 
 T23adjL23L22 = Matmul(T23,adjL23L22) 
 T23adjL23L23 = Matmul(T23,adjL23L23) 
 Trmd2 = Real(cTrace(md2),dp) 
 Trme2 = Real(cTrace(me2),dp) 
 Trml2 = Real(cTrace(ml2),dp) 
 Trmq2 = Real(cTrace(mq2),dp) 
 Trmu2 = Real(cTrace(mu2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TradjYdTd = cTrace(adjYdTd) 
 TradjYeTe = cTrace(adjYeTe) 
 TradjYuTu = cTrace(adjYuTu) 
 TradjL21T21 = cTrace(adjL21T21) 
 TradjL21T22 = cTrace(adjL21T22) 
 TradjL21T23 = cTrace(adjL21T23) 
 TradjL22T21 = cTrace(adjL22T21) 
 TradjL22T22 = cTrace(adjL22T22) 
 TradjL22T23 = cTrace(adjL22T23) 
 TradjL23T21 = cTrace(adjL23T21) 
 TradjL23T22 = cTrace(adjL23T22) 
 TradjL23T23 = cTrace(adjL23T23) 
 TrCL11L11 = cTrace(CL11L11) 
 TrCL11L12 = cTrace(CL11L12) 
 TrCL11L13 = cTrace(CL11L13) 
 TrCL11T11 = cTrace(CL11T11) 
 TrCL11T12 = cTrace(CL11T12) 
 TrCL11T13 = cTrace(CL11T13) 
 TrCL12L11 = cTrace(CL12L11) 
 TrCL12L12 = cTrace(CL12L12) 
 TrCL12L13 = cTrace(CL12L13) 
 TrCL12T11 = cTrace(CL12T11) 
 TrCL12T12 = cTrace(CL12T12) 
 TrCL12T13 = cTrace(CL12T13) 
 TrCL13L11 = cTrace(CL13L11) 
 TrCL13L12 = cTrace(CL13L12) 
 TrCL13L13 = cTrace(CL13L13) 
 TrCL13T11 = cTrace(CL13T11) 
 TrCL13T12 = cTrace(CL13T12) 
 TrCL13T13 = cTrace(CL13T13) 
 TrCL21TpL21 = Real(cTrace(CL21TpL21),dp) 
 TrCL21TpL22 = cTrace(CL21TpL22) 
 TrCL21TpL23 = cTrace(CL21TpL23) 
 TrCL22TpL21 = cTrace(CL22TpL21) 
 TrCL22TpL22 = Real(cTrace(CL22TpL22),dp) 
 TrCL22TpL23 = cTrace(CL22TpL23) 
 TrCL23TpL21 = cTrace(CL23TpL21) 
 TrCL23TpL22 = cTrace(CL23TpL22) 
 TrCL23TpL23 = Real(cTrace(CL23TpL23),dp) 
 TrCTdTpTd = Real(cTrace(CTdTpTd),dp) 
 TrCTeTpTe = Real(cTrace(CTeTpTe),dp) 
 TrCTuTpTu = Real(cTrace(CTuTpTu),dp) 
 TrCT11T11 = cTrace(CT11T11) 
 TrCT11T12 = cTrace(CT11T12) 
 TrCT11T13 = cTrace(CT11T13) 
 TrCT12T11 = cTrace(CT12T11) 
 TrCT12T12 = cTrace(CT12T12) 
 TrCT12T13 = cTrace(CT12T13) 
 TrCT13T11 = cTrace(CT13T11) 
 TrCT13T12 = cTrace(CT13T12) 
 TrCT13T13 = cTrace(CT13T13) 
 TrCT21TpT21 = Real(cTrace(CT21TpT21),dp) 
 TrCT21TpT22 = cTrace(CT21TpT22) 
 TrCT21TpT23 = cTrace(CT21TpT23) 
 TrCT22TpT21 = cTrace(CT22TpT21) 
 TrCT22TpT22 = Real(cTrace(CT22TpT22),dp) 
 TrCT22TpT23 = cTrace(CT22TpT23) 
 TrCT23TpT21 = cTrace(CT23TpT21) 
 TrCT23TpT22 = cTrace(CT23TpT22) 
 TrCT23TpT23 = Real(cTrace(CT23TpT23),dp) 
 Trmd2YdadjYd = cTrace(md2YdadjYd) 
 Trme2YeadjYe = cTrace(me2YeadjYe) 
 Trml2adjYeYe = cTrace(ml2adjYeYe) 
 Trml2CL11L11 = cTrace(ml2CL11L11) 
 Trml2CL11L12 = cTrace(ml2CL11L12) 
 Trml2CL11L13 = cTrace(ml2CL11L13) 
 Trml2CL12L11 = cTrace(ml2CL12L11) 
 Trml2CL12L12 = cTrace(ml2CL12L12) 
 Trml2CL12L13 = cTrace(ml2CL12L13) 
 Trml2CL13L11 = cTrace(ml2CL13L11) 
 Trml2CL13L12 = cTrace(ml2CL13L12) 
 Trml2CL13L13 = cTrace(ml2CL13L13) 
 Trml2CL21TpL21 = cTrace(ml2CL21TpL21) 
 Trml2CL21TpL22 = cTrace(ml2CL21TpL22) 
 Trml2CL21TpL23 = cTrace(ml2CL21TpL23) 
 Trml2CL22TpL21 = cTrace(ml2CL22TpL21) 
 Trml2CL22TpL22 = cTrace(ml2CL22TpL22) 
 Trml2CL22TpL23 = cTrace(ml2CL22TpL23) 
 Trml2CL23TpL21 = cTrace(ml2CL23TpL21) 
 Trml2CL23TpL22 = cTrace(ml2CL23TpL22) 
 Trml2CL23TpL23 = cTrace(ml2CL23TpL23) 
 Trmq2adjYdYd = cTrace(mq2adjYdYd) 
 Trmq2adjYuYu = cTrace(mq2adjYuYu) 
 Trmq2adjL21L21 = cTrace(mq2adjL21L21) 
 Trmq2adjL21L22 = cTrace(mq2adjL21L22) 
 Trmq2adjL21L23 = cTrace(mq2adjL21L23) 
 Trmq2adjL22L21 = cTrace(mq2adjL22L21) 
 Trmq2adjL22L22 = cTrace(mq2adjL22L22) 
 Trmq2adjL22L23 = cTrace(mq2adjL22L23) 
 Trmq2adjL23L21 = cTrace(mq2adjL23L21) 
 Trmq2adjL23L22 = cTrace(mq2adjL23L22) 
 Trmq2adjL23L23 = cTrace(mq2adjL23L23) 
 Trmu2YuadjYu = cTrace(mu2YuadjYu) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
Do i1=1,3
  Do i2=1,3
DyYdadjL211i1mlHd2i2(i1,i2) = mlHd2(i2)*YdadjL21(1,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYdadjL222i1mlHd2i2(i1,i2) = mlHd2(i2)*YdadjL22(2,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYdadjL233i1mlHd2i2(i1,i2) = mlHd2(i2)*YdadjL23(3,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYeCL111i1mlHd2i2(i1,i2) = mlHd2(i2)*YeCL11(1,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYeCL122i1mlHd2i2(i1,i2) = mlHd2(i2)*YeCL12(2,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyYeCL133i1mlHd2i2(i1,i2) = mlHd2(i2)*YeCL13(3,i1) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyadjL21mlHd2i1Yd1i2(i1,i2) = adjL21mlHd2(i1)*Yd(1,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyadjL22mlHd2i1Yd2i2(i1,i2) = adjL22mlHd2(i1)*Yd(2,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyadjL23mlHd2i1Yd3i2(i1,i2) = adjL23mlHd2(i1)*Yd(3,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyCL11mlHd2i1Ye1i2(i1,i2) = CL11mlHd2(i1)*Ye(1,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyCL12mlHd2i1Ye2i2(i1,i2) = CL12mlHd2(i1)*Ye(2,i2) 
  End Do 
End Do 
Do i1=1,3
  Do i2=1,3
DyCL13mlHd2i1Ye3i2(i1,i2) = CL13mlHd2(i1)*Ye(3,i2) 
  End Do 
End Do 


If (TwoLoopRGE) Then 
End If 
 
 
Tr1(1) = g1*sqrt3ov5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 + Trmq2 -          & 
&  2._dp*(Trmu2))

If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 33._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaYd1(i1,i2) = (-7*g1p2*Yd(i1,i2))/15._dp - 3*g2p2*Yd(i1,i2) - (16*g3p2*Yd(i1,i2))/3._dp +           & 
&  3*TrYdadjYd*Yd(i1,i2) + TrYeadjYe*Yd(i1,i2) + YdadjL21L21(i1,i2) + YdadjL22L22(i1,    & 
& i2) + YdadjL23L23(i1,i2) + 3*YdadjYdYd(i1,i2) + YdadjYuYu(i1,i2)
If (1.eq.i1) Then 
betaYd1(i1,i2) = betaYd1(i1,i2)+2*TrCL21TpL21*Yd(1,i2) + 2*TrCL22TpL21*Yd(2,i2) + 2*TrCL23TpL21*Yd(3,i2) +            & 
&  3*YdadjL21L21(1,i2) + 3*YdadjL22L21(2,i2) + 3*YdadjL23L21(3,i2) - YeCL11L21(1,        & 
& i2) - YeCL12L21(2,i2) - YeCL13L21(3,i2)
End If 
If (2.eq.i1) Then 
betaYd1(i1,i2) = betaYd1(i1,i2)+2*TrCL21TpL22*Yd(1,i2) + 2*TrCL22TpL22*Yd(2,i2) + 2*TrCL23TpL22*Yd(3,i2) +            & 
&  3*YdadjL21L22(1,i2) + 3*YdadjL22L22(2,i2) + 3*YdadjL23L22(3,i2) - YeCL11L22(1,        & 
& i2) - YeCL12L22(2,i2) - YeCL13L22(3,i2)
End If 
If (3.eq.i1) Then 
betaYd1(i1,i2) = betaYd1(i1,i2)+2*TrCL21TpL23*Yd(1,i2) + 2*TrCL22TpL23*Yd(2,i2) + 2*TrCL23TpL23*Yd(3,i2) +            & 
&  3*YdadjL21L23(1,i2) + 3*YdadjL22L23(2,i2) + 3*YdadjL23L23(3,i2) - YeCL11L23(1,        & 
& i2) - YeCL12L23(2,i2) - YeCL13L23(3,i2)
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaYd2(i1,i2) = 0
End Do
End Do

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaYe1(i1,i2) = (-9*g1p2*Ye(i1,i2))/5._dp - 3*g2p2*Ye(i1,i2) + 3*TrYdadjYd*Ye(i1,i2) + TrYeadjYe*Ye(i1,& 
& i2) + 3*YeadjYeYe(i1,i2) - YeCL11L11(i1,i2) - YeCL12L12(i1,i2) - YeCL13L13(i1,         & 
& i2) + 3*YeCL21TpL21(i1,i2) + 3*YeCL22TpL22(i1,i2) + 3*YeCL23TpL23(i1,i2)
If (1.eq.i1) Then 
betaYe1(i1,i2) = betaYe1(i1,i2)-L11CL11TpYe(i2,1) - L11CL12TpYe(i2,2) - L11CL13TpYe(i2,3) - 3*L11CL21TpYd(i2,        & 
& 1) - 3*L11CL22TpYd(i2,2) - 3*L11CL23TpYd(i2,3) - TrCL11L11*Ye(1,i2) - TrCL12L11*Ye(2,  & 
& i2) - TrCL13L11*Ye(3,i2)
End If 
If (2.eq.i1) Then 
betaYe1(i1,i2) = betaYe1(i1,i2)-L12CL11TpYe(i2,1) - L12CL12TpYe(i2,2) - L12CL13TpYe(i2,3) - 3*L12CL21TpYd(i2,        & 
& 1) - 3*L12CL22TpYd(i2,2) - 3*L12CL23TpYd(i2,3) - TrCL11L12*Ye(1,i2) - TrCL12L12*Ye(2,  & 
& i2) - TrCL13L12*Ye(3,i2)
End If 
If (3.eq.i1) Then 
betaYe1(i1,i2) = betaYe1(i1,i2)-L13CL11TpYe(i2,1) - L13CL12TpYe(i2,2) - L13CL13TpYe(i2,3) - 3*L13CL21TpYd(i2,        & 
& 1) - 3*L13CL22TpYd(i2,2) - 3*L13CL23TpYd(i2,3) - TrCL11L13*Ye(1,i2) - TrCL12L13*Ye(2,  & 
& i2) - TrCL13L13*Ye(3,i2)
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaYe2(i1,i2) = 0
End Do
End Do

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! L1 
!-------------------- 
 
Do i1 = 1,3
Do i2 = 1,3
betaL11(i1,i2,1) = L11adjYeYe(i1,i2) - 2*L11CL11L11(i1,i2) - L11CL12L12(i1,i2) - L11CL13L13(i1,          & 
& i2) + 3*L11CL21TpL21(i1,i2) + 3*L11CL22TpL22(i1,i2) + 3*L11CL23TpL23(i1,               & 
& i2) - L12CL12L11(i1,i2) - L13CL13L11(i1,i2) + 3*L21adjL21L11(i1,i2) + 3*L22adjL22L11(i1,& 
& i2) + 3*L23adjL23L11(i1,i2) + TpYeCYeL11(i1,i2) - (9*g1p2*L11(i1,i2))/5._dp -          & 
&  3*g2p2*L11(i1,i2) - TrCL11L11*L11(i1,i2) - TrCL12L11*L12(i1,i2) - TrCL13L11*L13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL11(i1,i2,2) = -L11CL11L12(i1,i2) + L12adjYeYe(i1,i2) - L12CL11L11(i1,i2) - 2*L12CL12L12(i1,         & 
& i2) - L12CL13L13(i1,i2) + 3*L12CL21TpL21(i1,i2) + 3*L12CL22TpL22(i1,i2) +              & 
&  3*L12CL23TpL23(i1,i2) - L13CL13L12(i1,i2) + 3*L21adjL21L12(i1,i2) + 3*L22adjL22L12(i1,& 
& i2) + 3*L23adjL23L12(i1,i2) + TpYeCYeL12(i1,i2) - TrCL11L12*L11(i1,i2) -               & 
&  (9*g1p2*L12(i1,i2))/5._dp - 3*g2p2*L12(i1,i2) - TrCL12L12*L12(i1,i2) - TrCL13L12*L13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL11(i1,i2,3) = -L11CL11L13(i1,i2) - L12CL12L13(i1,i2) + L13adjYeYe(i1,i2) - L13CL11L11(i1,           & 
& i2) - L13CL12L12(i1,i2) - 2*L13CL13L13(i1,i2) + 3*L13CL21TpL21(i1,i2) + 3*L13CL22TpL22(i1,& 
& i2) + 3*L13CL23TpL23(i1,i2) + 3*L21adjL21L13(i1,i2) + 3*L22adjL22L13(i1,               & 
& i2) + 3*L23adjL23L13(i1,i2) + TpYeCYeL13(i1,i2) - TrCL11L13*L11(i1,i2) -               & 
&  TrCL12L13*L12(i1,i2) - (9*g1p2*L13(i1,i2))/5._dp - 3*g2p2*L13(i1,i2) - TrCL13L13*L13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaL11(i1,i2,i3) = betaL11(i1,i2,i3)-3*CYdTpL21(1,i2)*Ye(i3,i1) - 3*CYdTpL22(2,i2)*Ye(i3,i1) - 3*CYdTpL23(3,              & 
& i2)*Ye(i3,i1) + CYeL11(1,i2)*Ye(i3,i1) + CYeL12(2,i2)*Ye(i3,i1) + CYeL13(3,            & 
& i2)*Ye(i3,i1) + 3*CYdTpL21(1,i1)*Ye(i3,i2) + 3*CYdTpL22(2,i1)*Ye(i3,i2) +              & 
&  3*CYdTpL23(3,i1)*Ye(i3,i2) - CYeL11(1,i1)*Ye(i3,i2) - CYeL12(2,i1)*Ye(i3,             & 
& i2) - CYeL13(3,i1)*Ye(i3,i2) + 2*YeadjYe(i3,1)*L11(i1,i2) + 2*YeadjYe(i3,              & 
& 2)*L12(i1,i2) + 2*YeadjYe(i3,3)*L13(i1,i2)
End Do
End Do
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
Do i2 = 1,3
betaL12(i1,i2,1) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL12(i1,i2,2) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL12(i1,i2,3) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaL12(i1,i2,i3) = betaL12(i1,i2,i3)+(0)
End Do
End Do
End Do

 
DL1 = oo16pi2*( betaL11 + oo16pi2 * betaL12 ) 

 
Else 
DL1 = oo16pi2* betaL11 
End If 
 
 
!-------------------- 
! L2 
!-------------------- 
 
Do i1 = 1,3
Do i2 = 1,3
betaL21(i1,i2,1) = -L11CL11L21(i1,i2) - L12CL12L21(i1,i2) - L13CL13L21(i1,i2) + 4*L21adjL21L21(i1,       & 
& i2) + L21adjL22L22(i1,i2) + L21adjL23L23(i1,i2) + L21adjYdYd(i1,i2) + L21adjYuYu(i1,   & 
& i2) + 3*L22adjL22L21(i1,i2) + 3*L23adjL23L21(i1,i2) + TpYeCYeL21(i1,i2) -              & 
&  (7*g1p2*L21(i1,i2))/15._dp - 3*g2p2*L21(i1,i2) - (16*g3p2*L21(i1,i2))/3._dp +         & 
&  2*TrCL21TpL21*L21(i1,i2) + 2*TrCL22TpL21*L22(i1,i2) + 2*TrCL23TpL21*L23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL21(i1,i2,2) = -L11CL11L22(i1,i2) - L12CL12L22(i1,i2) - L13CL13L22(i1,i2) + 3*L21adjL21L22(i1,       & 
& i2) + L22adjL21L21(i1,i2) + 4*L22adjL22L22(i1,i2) + L22adjL23L23(i1,i2) +              & 
&  L22adjYdYd(i1,i2) + L22adjYuYu(i1,i2) + 3*L23adjL23L22(i1,i2) + TpYeCYeL22(i1,        & 
& i2) + 2*TrCL21TpL22*L21(i1,i2) - (7*g1p2*L22(i1,i2))/15._dp - 3*g2p2*L22(i1,           & 
& i2) - (16*g3p2*L22(i1,i2))/3._dp + 2*TrCL22TpL22*L22(i1,i2) + 2*TrCL23TpL22*L23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL21(i1,i2,3) = -L11CL11L23(i1,i2) - L12CL12L23(i1,i2) - L13CL13L23(i1,i2) + 3*L21adjL21L23(i1,       & 
& i2) + 3*L22adjL22L23(i1,i2) + L23adjL21L21(i1,i2) + L23adjL22L22(i1,i2) +              & 
&  4*L23adjL23L23(i1,i2) + L23adjYdYd(i1,i2) + L23adjYuYu(i1,i2) + TpYeCYeL23(i1,        & 
& i2) + 2*TrCL21TpL23*L21(i1,i2) + 2*TrCL22TpL23*L22(i1,i2) - (7*g1p2*L23(i1,            & 
& i2))/15._dp - 3*g2p2*L23(i1,i2) - (16*g3p2*L23(i1,i2))/3._dp + 2*TrCL23TpL23*L23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaL21(i1,i2,i3) = betaL21(i1,i2,i3)+3*CYdTpL21(1,i1)*Yd(i3,i2) + 3*CYdTpL22(2,i1)*Yd(i3,i2) + 3*CYdTpL23(3,               & 
& i1)*Yd(i3,i2) - CYeL11(1,i1)*Yd(i3,i2) - CYeL12(2,i1)*Yd(i3,i2) - CYeL13(3,            & 
& i1)*Yd(i3,i2) + 2*YdadjYd(i3,1)*L21(i1,i2) + 2*YdadjYd(i3,2)*L22(i1,i2) +              & 
&  2*YdadjYd(i3,3)*L23(i1,i2)
End Do
End Do
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
Do i2 = 1,3
betaL22(i1,i2,1) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL22(i1,i2,2) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaL22(i1,i2,3) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaL22(i1,i2,i3) = betaL22(i1,i2,i3)+(0)
End Do
End Do
End Do

 
DL2 = oo16pi2*( betaL21 + oo16pi2 * betaL22 ) 

 
Else 
DL2 = oo16pi2* betaL21 
End If 
 
 
!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = -((13._dp*(g1p2) + 45._dp*(g2p2) + 80._dp*(g3p2) - 45._dp*(TrYuadjYu))     & 
& *Yu)/15._dp + YuadjL21L21 + YuadjL22L22 + YuadjL23L23 + YuadjYdYd + 3._dp*(YuadjYuYu)

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Mu 
!-------------------- 
 
betaMu1  = (-3*g1p2*Mu)/5._dp - 3*g2p2*Mu + 3*TrYdadjYd*Mu + TrYeadjYe*Mu +           & 
&  3*TrYuadjYu*Mu - 3*YdadjL21REps(1) - 3*YdadjL22REps(2) - 3*YdadjL23REps(3)            & 
&  + YeCL11REps(1) + YeCL12REps(2) + YeCL13REps(3)

 
 
If (TwoLoopRGE) Then 
betaMu2 = 0

 
DMu = oo16pi2*( betaMu1 + oo16pi2 * betaMu2 ) 

 
Else 
DMu = oo16pi2* betaMu1 
End If 
 
 
Call Chop(DMu) 

!-------------------- 
! REps 
!-------------------- 
 
Do i1 = 1,3
betaREps1(i1) = -3*Mu*CYdTpL21(1,i1) - 3*Mu*CYdTpL22(2,i1) - 3*Mu*CYdTpL23(3,i1) + Mu*CYeL11(1,       & 
& i1) + Mu*CYeL12(2,i1) + Mu*CYeL13(3,i1) - L11CL11REps(i1) - L12CL12REps(i1) -          & 
&  L13CL13REps(i1) + 3*L21adjL21REps(i1) + 3*L22adjL22REps(i1) + 3*L23adjL23REps(i1) +   & 
&  TpYeCYeREps(i1) - (3*g1p2*REps(i1))/5._dp - 3*g2p2*REps(i1) + 3*TrYuadjYu*REps(i1)
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
betaREps2(i1) = 0
End Do

 
DREps = oo16pi2*( betaREps1 + oo16pi2 * betaREps2 ) 

 
Else 
DREps = oo16pi2* betaREps1 
End If 
 
 
Call Chop(DREps) 

!-------------------- 
! Td 
!-------------------- 
 
betaTd1 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaTd1(i1,i2) = TdadjL21L21(i1,i2) + TdadjL22L22(i1,i2) + TdadjL23L23(i1,i2) + 5*TdadjYdYd(i1,        & 
& i2) + TdadjYuYu(i1,i2) + (14*g1p2*M1*Yd(i1,i2))/15._dp + (32*g3p2*M3*Yd(i1,            & 
& i2))/3._dp + 6*g2p2*M2*Yd(i1,i2) + 6*TradjYdTd*Yd(i1,i2) + 2*TradjYeTe*Yd(i1,          & 
& i2) + 2*YdadjL21T21(i1,i2) + 2*YdadjL22T22(i1,i2) + 2*YdadjL23T23(i1,i2) +             & 
&  4*YdadjYdTd(i1,i2) + 2*YdadjYuTu(i1,i2) - (7*g1p2*Td(i1,i2))/15._dp - 3*g2p2*Td(i1,   & 
& i2) - (16*g3p2*Td(i1,i2))/3._dp + 3*TrYdadjYd*Td(i1,i2) + TrYeadjYe*Td(i1,i2)
If (1.eq.i1) Then 
betaTd1(i1,i2) = betaTd1(i1,i2)+2*TpL21CL11TpTe(i2,1) + 2*TpL21CL12TpTe(i2,2) + 2*TpL21CL13TpTe(i2,3) +               & 
&  6*TpL21CL21TpTd(i2,1) + 6*TpL21CL22TpTd(i2,2) + 6*TpL21CL23TpTd(i2,3) +               & 
&  4*TradjL21T21*Yd(1,i2) + 4*TradjL22T21*Yd(2,i2) + 4*TradjL23T21*Yd(3,i2) +            & 
&  3*YdadjL21T21(1,i2) + 3*YdadjL22T21(2,i2) + 3*YdadjL23T21(3,i2) - YeCL11T21(1,        & 
& i2) - YeCL12T21(2,i2) - YeCL13T21(3,i2) + 2*TrCL21TpL21*Td(1,i2) + 2*TrCL22TpL21*Td(2, & 
& i2) + 2*TrCL23TpL21*Td(3,i2)
End If 
If (2.eq.i1) Then 
betaTd1(i1,i2) = betaTd1(i1,i2)+2*TpL22CL11TpTe(i2,1) + 2*TpL22CL12TpTe(i2,2) + 2*TpL22CL13TpTe(i2,3) +               & 
&  6*TpL22CL21TpTd(i2,1) + 6*TpL22CL22TpTd(i2,2) + 6*TpL22CL23TpTd(i2,3) +               & 
&  4*TradjL21T22*Yd(1,i2) + 4*TradjL22T22*Yd(2,i2) + 4*TradjL23T22*Yd(3,i2) +            & 
&  3*YdadjL21T22(1,i2) + 3*YdadjL22T22(2,i2) + 3*YdadjL23T22(3,i2) - YeCL11T22(1,        & 
& i2) - YeCL12T22(2,i2) - YeCL13T22(3,i2) + 2*TrCL21TpL22*Td(1,i2) + 2*TrCL22TpL22*Td(2, & 
& i2) + 2*TrCL23TpL22*Td(3,i2)
End If 
If (3.eq.i1) Then 
betaTd1(i1,i2) = betaTd1(i1,i2)+2*TpL23CL11TpTe(i2,1) + 2*TpL23CL12TpTe(i2,2) + 2*TpL23CL13TpTe(i2,3) +               & 
&  6*TpL23CL21TpTd(i2,1) + 6*TpL23CL22TpTd(i2,2) + 6*TpL23CL23TpTd(i2,3) +               & 
&  4*TradjL21T23*Yd(1,i2) + 4*TradjL22T23*Yd(2,i2) + 4*TradjL23T23*Yd(3,i2) +            & 
&  3*YdadjL21T23(1,i2) + 3*YdadjL22T23(2,i2) + 3*YdadjL23T23(3,i2) - YeCL11T23(1,        & 
& i2) - YeCL12T23(2,i2) - YeCL13T23(3,i2) + 2*TrCL21TpL23*Td(1,i2) + 2*TrCL22TpL23*Td(2, & 
& i2) + 2*TrCL23TpL23*Td(3,i2)
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betaTd2 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaTd2(i1,i2) = 0
End Do
End Do

 
DTd = oo16pi2*( betaTd1 + oo16pi2 * betaTd2 ) 

 
Else 
DTd = oo16pi2* betaTd1 
End If 
 
 
Call Chop(DTd) 

!-------------------- 
! Te 
!-------------------- 
 
betaTe1 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaTe1(i1,i2) = 5*TeadjYeYe(i1,i2) - TeCL11L11(i1,i2) - TeCL12L12(i1,i2) - TeCL13L13(i1,              & 
& i2) + 3*TeCL21TpL21(i1,i2) + 3*TeCL22TpL22(i1,i2) + 3*TeCL23TpL23(i1,i2) +             & 
&  (18*g1p2*M1*Ye(i1,i2))/5._dp + 6*g2p2*M2*Ye(i1,i2) + 6*TradjYdTd*Ye(i1,               & 
& i2) + 2*TradjYeTe*Ye(i1,i2) + 4*YeadjYeTe(i1,i2) - 2*YeCL11T11(i1,i2) - 2*YeCL12T12(i1,& 
& i2) - 2*YeCL13T13(i1,i2) + 6*YeCL21TpT21(i1,i2) + 6*YeCL22TpT22(i1,i2) +               & 
&  6*YeCL23TpT23(i1,i2) - (9*g1p2*Te(i1,i2))/5._dp - 3*g2p2*Te(i1,i2) + 3*TrYdadjYd*Te(i1,& 
& i2) + TrYeadjYe*Te(i1,i2)
If (1.eq.i1) Then 
betaTe1(i1,i2) = betaTe1(i1,i2)-2*L11CL11TpTe(i2,1) - 2*L11CL12TpTe(i2,2) - 2*L11CL13TpTe(i2,3) - 6*L11CL21TpTd(i2,  & 
& 1) - 6*L11CL22TpTd(i2,2) - 6*L11CL23TpTd(i2,3) + 3*YdadjL21T11(1,i2) + 3*YdadjL22T11(2,& 
& i2) + 3*YdadjL23T11(3,i2) - 2*TrCL11T11*Ye(1,i2) - 2*TrCL12T11*Ye(2,i2) -              & 
&  2*TrCL13T11*Ye(3,i2) - YeCL11T11(1,i2) - YeCL12T11(2,i2) - YeCL13T11(3,               & 
& i2) - TrCL11L11*Te(1,i2) - TrCL12L11*Te(2,i2) - TrCL13L11*Te(3,i2)
End If 
If (2.eq.i1) Then 
betaTe1(i1,i2) = betaTe1(i1,i2)-2*L12CL11TpTe(i2,1) - 2*L12CL12TpTe(i2,2) - 2*L12CL13TpTe(i2,3) - 6*L12CL21TpTd(i2,  & 
& 1) - 6*L12CL22TpTd(i2,2) - 6*L12CL23TpTd(i2,3) + 3*YdadjL21T12(1,i2) + 3*YdadjL22T12(2,& 
& i2) + 3*YdadjL23T12(3,i2) - 2*TrCL11T12*Ye(1,i2) - 2*TrCL12T12*Ye(2,i2) -              & 
&  2*TrCL13T12*Ye(3,i2) - YeCL11T12(1,i2) - YeCL12T12(2,i2) - YeCL13T12(3,               & 
& i2) - TrCL11L12*Te(1,i2) - TrCL12L12*Te(2,i2) - TrCL13L12*Te(3,i2)
End If 
If (3.eq.i1) Then 
betaTe1(i1,i2) = betaTe1(i1,i2)-2*L13CL11TpTe(i2,1) - 2*L13CL12TpTe(i2,2) - 2*L13CL13TpTe(i2,3) - 6*L13CL21TpTd(i2,  & 
& 1) - 6*L13CL22TpTd(i2,2) - 6*L13CL23TpTd(i2,3) + 3*YdadjL21T13(1,i2) + 3*YdadjL22T13(2,& 
& i2) + 3*YdadjL23T13(3,i2) - 2*TrCL11T13*Ye(1,i2) - 2*TrCL12T13*Ye(2,i2) -              & 
&  2*TrCL13T13*Ye(3,i2) - YeCL11T13(1,i2) - YeCL12T13(2,i2) - YeCL13T13(3,               & 
& i2) - TrCL11L13*Te(1,i2) - TrCL12L13*Te(2,i2) - TrCL13L13*Te(3,i2)
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betaTe2 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betaTe2(i1,i2) = 0
End Do
End Do

 
DTe = oo16pi2*( betaTe1 + oo16pi2 * betaTe2 ) 

 
Else 
DTe = oo16pi2* betaTe1 
End If 
 
 
Call Chop(DTe) 

!-------------------- 
! T1 
!-------------------- 
 
Do i1 = 1,3
Do i2 = 1,3
betaT11(i1,i2,1) = 2*L11adjYeTe(i1,i2) - 3*L11CL11T11(i1,i2) - 2*L11CL12T12(i1,i2) - 2*L11CL13T13(i1,    & 
& i2) + 6*L11CL21TpT21(i1,i2) + 6*L11CL22TpT22(i1,i2) + 6*L11CL23TpT23(i1,               & 
& i2) - L12CL12T11(i1,i2) - L13CL13T11(i1,i2) + 3*L21adjL21T11(i1,i2) + 3*L22adjL22T11(i1,& 
& i2) + 3*L23adjL23T11(i1,i2) + T11adjYeYe(i1,i2) - 3*T11CL11L11(i1,i2) - T11CL12L12(i1, & 
& i2) - T11CL13L13(i1,i2) + 3*T11CL21TpL21(i1,i2) + 3*T11CL22TpL22(i1,i2) +              & 
&  3*T11CL23TpL23(i1,i2) - 2*T12CL12L11(i1,i2) - 2*T13CL13L11(i1,i2) + 6*T21adjL21L11(i1,& 
& i2) + 6*T22adjL22L11(i1,i2) + 6*T23adjL23L11(i1,i2) + 2*TpTeCYeL11(i1,i2) +            & 
&  TpYeCYeT11(i1,i2) + (18*g1p2*M1*L11(i1,i2))/5._dp + 6*g2p2*M2*L11(i1,i2) -            & 
&  2*TrCL11T11*L11(i1,i2) - 2*TrCL12T11*L12(i1,i2) - 2*TrCL13T11*L13(i1,i2) -            & 
&  (9*g1p2*T11(i1,i2))/5._dp - 3*g2p2*T11(i1,i2) - TrCL11L11*T11(i1,i2) - TrCL12L11*T12(i1,& 
& i2) - TrCL13L11*T13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT11(i1,i2,2) = -L11CL11T12(i1,i2) + 2*L12adjYeTe(i1,i2) - 2*L12CL11T11(i1,i2) - 3*L12CL12T12(i1,     & 
& i2) - 2*L12CL13T13(i1,i2) + 6*L12CL21TpT21(i1,i2) + 6*L12CL22TpT22(i1,i2) +            & 
&  6*L12CL23TpT23(i1,i2) - L13CL13T12(i1,i2) + 3*L21adjL21T12(i1,i2) + 3*L22adjL22T12(i1,& 
& i2) + 3*L23adjL23T12(i1,i2) - 2*T11CL11L12(i1,i2) + T12adjYeYe(i1,i2) - T12CL11L11(i1, & 
& i2) - 3*T12CL12L12(i1,i2) - T12CL13L13(i1,i2) + 3*T12CL21TpL21(i1,i2) + 3*T12CL22TpL22(i1,& 
& i2) + 3*T12CL23TpL23(i1,i2) - 2*T13CL13L12(i1,i2) + 6*T21adjL21L12(i1,i2) +            & 
&  6*T22adjL22L12(i1,i2) + 6*T23adjL23L12(i1,i2) + 2*TpTeCYeL12(i1,i2) + TpYeCYeT12(i1,  & 
& i2) - 2*TrCL11T12*L11(i1,i2) + (18*g1p2*M1*L12(i1,i2))/5._dp + 6*g2p2*M2*L12(i1,       & 
& i2) - 2*TrCL12T12*L12(i1,i2) - 2*TrCL13T12*L13(i1,i2) - TrCL11L12*T11(i1,              & 
& i2) - (9*g1p2*T12(i1,i2))/5._dp - 3*g2p2*T12(i1,i2) - TrCL12L12*T12(i1,i2) -           & 
&  TrCL13L12*T13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT11(i1,i2,3) = -L11CL11T13(i1,i2) - L12CL12T13(i1,i2) + 2*L13adjYeTe(i1,i2) - 2*L13CL11T11(i1,       & 
& i2) - 2*L13CL12T12(i1,i2) - 3*L13CL13T13(i1,i2) + 6*L13CL21TpT21(i1,i2) +              & 
&  6*L13CL22TpT22(i1,i2) + 6*L13CL23TpT23(i1,i2) + 3*L21adjL21T13(i1,i2) +               & 
&  3*L22adjL22T13(i1,i2) + 3*L23adjL23T13(i1,i2) - 2*T11CL11L13(i1,i2) - 2*T12CL12L13(i1,& 
& i2) + T13adjYeYe(i1,i2) - T13CL11L11(i1,i2) - T13CL12L12(i1,i2) - 3*T13CL13L13(i1,     & 
& i2) + 3*T13CL21TpL21(i1,i2) + 3*T13CL22TpL22(i1,i2) + 3*T13CL23TpL23(i1,               & 
& i2) + 6*T21adjL21L13(i1,i2) + 6*T22adjL22L13(i1,i2) + 6*T23adjL23L13(i1,               & 
& i2) + 2*TpTeCYeL13(i1,i2) + TpYeCYeT13(i1,i2) - 2*TrCL11T13*L11(i1,i2) -               & 
&  2*TrCL12T13*L12(i1,i2) + (18*g1p2*M1*L13(i1,i2))/5._dp + 6*g2p2*M2*L13(i1,            & 
& i2) - 2*TrCL13T13*L13(i1,i2) - TrCL11L13*T11(i1,i2) - TrCL12L13*T12(i1,i2) -           & 
&  (9*g1p2*T13(i1,i2))/5._dp - 3*g2p2*T13(i1,i2) - TrCL13L13*T13(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaT11(i1,i2,i3) = betaT11(i1,i2,i3)-6*CYdTpT21(1,i2)*Ye(i3,i1) - 6*CYdTpT22(2,i2)*Ye(i3,i1) - 6*CYdTpT23(3,              & 
& i2)*Ye(i3,i1) + 2*CYeT11(1,i2)*Ye(i3,i1) + 2*CYeT12(2,i2)*Ye(i3,i1) + 2*CYeT13(3,      & 
& i2)*Ye(i3,i1) + 6*CYdTpT21(1,i1)*Ye(i3,i2) + 6*CYdTpT22(2,i1)*Ye(i3,i2) +              & 
&  6*CYdTpT23(3,i1)*Ye(i3,i2) - 2*CYeT11(1,i1)*Ye(i3,i2) - 2*CYeT12(2,i1)*Ye(i3,         & 
& i2) - 2*CYeT13(3,i1)*Ye(i3,i2) + 4*CYeTpTe(1,i3)*L11(i1,i2) + 4*CYeTpTe(2,             & 
& i3)*L12(i1,i2) + 4*CYeTpTe(3,i3)*L13(i1,i2) - 3*CYdTpL21(1,i2)*Te(i3,i1) -             & 
&  3*CYdTpL22(2,i2)*Te(i3,i1) - 3*CYdTpL23(3,i2)*Te(i3,i1) + CYeL11(1,i2)*Te(i3,         & 
& i1) + CYeL12(2,i2)*Te(i3,i1) + CYeL13(3,i2)*Te(i3,i1) + 3*CYdTpL21(1,i1)*Te(i3,        & 
& i2) + 3*CYdTpL22(2,i1)*Te(i3,i2) + 3*CYdTpL23(3,i1)*Te(i3,i2) - CYeL11(1,              & 
& i1)*Te(i3,i2) - CYeL12(2,i1)*Te(i3,i2) - CYeL13(3,i1)*Te(i3,i2) + 2*YeadjYe(i3,        & 
& 1)*T11(i1,i2) + 2*YeadjYe(i3,2)*T12(i1,i2) + 2*YeadjYe(i3,3)*T13(i1,i2)
End Do
End Do
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
Do i2 = 1,3
betaT12(i1,i2,1) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT12(i1,i2,2) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT12(i1,i2,3) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaT12(i1,i2,i3) = betaT12(i1,i2,i3)+(0)
End Do
End Do
End Do

 
DT1 = oo16pi2*( betaT11 + oo16pi2 * betaT12 ) 

 
Else 
DT1 = oo16pi2* betaT11 
End If 
 
 
!-------------------- 
! T2 
!-------------------- 
 
Do i1 = 1,3
Do i2 = 1,3
betaT21(i1,i2,1) = -L11CL11T21(i1,i2) - L12CL12T21(i1,i2) - L13CL13T21(i1,i2) + 5*L21adjL21T21(i1,       & 
& i2) + 2*L21adjL22T22(i1,i2) + 2*L21adjL23T23(i1,i2) + 2*L21adjYdTd(i1,i2) +            & 
&  2*L21adjYuTu(i1,i2) + 3*L22adjL22T21(i1,i2) + 3*L23adjL23T21(i1,i2) - 2*T11CL11L21(i1,& 
& i2) - 2*T12CL12L21(i1,i2) - 2*T13CL13L21(i1,i2) + 7*T21adjL21L21(i1,i2) +              & 
&  T21adjL22L22(i1,i2) + T21adjL23L23(i1,i2) + T21adjYdYd(i1,i2) + T21adjYuYu(i1,        & 
& i2) + 6*T22adjL22L21(i1,i2) + 6*T23adjL23L21(i1,i2) + 2*TpTeCYeL21(i1,i2) +            & 
&  TpYeCYeT21(i1,i2) + (14*g1p2*M1*L21(i1,i2))/15._dp + (32*g3p2*M3*L21(i1,              & 
& i2))/3._dp + 6*g2p2*M2*L21(i1,i2) + 4*TradjL21T21*L21(i1,i2) + 4*TradjL22T21*L22(i1,   & 
& i2) + 4*TradjL23T21*L23(i1,i2) - (7*g1p2*T21(i1,i2))/15._dp - 3*g2p2*T21(i1,           & 
& i2) - (16*g3p2*T21(i1,i2))/3._dp + 2*TrCL21TpL21*T21(i1,i2) + 2*TrCL22TpL21*T22(i1,    & 
& i2) + 2*TrCL23TpL21*T23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT21(i1,i2,2) = -L11CL11T22(i1,i2) - L12CL12T22(i1,i2) - L13CL13T22(i1,i2) + 3*L21adjL21T22(i1,       & 
& i2) + 2*L22adjL21T21(i1,i2) + 5*L22adjL22T22(i1,i2) + 2*L22adjL23T23(i1,               & 
& i2) + 2*L22adjYdTd(i1,i2) + 2*L22adjYuTu(i1,i2) + 3*L23adjL23T22(i1,i2) -              & 
&  2*T11CL11L22(i1,i2) - 2*T12CL12L22(i1,i2) - 2*T13CL13L22(i1,i2) + 6*T21adjL21L22(i1,  & 
& i2) + T22adjL21L21(i1,i2) + 7*T22adjL22L22(i1,i2) + T22adjL23L23(i1,i2) +              & 
&  T22adjYdYd(i1,i2) + T22adjYuYu(i1,i2) + 6*T23adjL23L22(i1,i2) + 2*TpTeCYeL22(i1,      & 
& i2) + TpYeCYeT22(i1,i2) + 4*TradjL21T22*L21(i1,i2) + (14*g1p2*M1*L22(i1,               & 
& i2))/15._dp + (32*g3p2*M3*L22(i1,i2))/3._dp + 6*g2p2*M2*L22(i1,i2) + 4*TradjL22T22*L22(i1,& 
& i2) + 4*TradjL23T22*L23(i1,i2) + 2*TrCL21TpL22*T21(i1,i2) - (7*g1p2*T22(i1,            & 
& i2))/15._dp - 3*g2p2*T22(i1,i2) - (16*g3p2*T22(i1,i2))/3._dp + 2*TrCL22TpL22*T22(i1,   & 
& i2) + 2*TrCL23TpL22*T23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT21(i1,i2,3) = -L11CL11T23(i1,i2) - L12CL12T23(i1,i2) - L13CL13T23(i1,i2) + 3*L21adjL21T23(i1,       & 
& i2) + 3*L22adjL22T23(i1,i2) + 2*L23adjL21T21(i1,i2) + 2*L23adjL22T22(i1,               & 
& i2) + 5*L23adjL23T23(i1,i2) + 2*L23adjYdTd(i1,i2) + 2*L23adjYuTu(i1,i2) -              & 
&  2*T11CL11L23(i1,i2) - 2*T12CL12L23(i1,i2) - 2*T13CL13L23(i1,i2) + 6*T21adjL21L23(i1,  & 
& i2) + 6*T22adjL22L23(i1,i2) + T23adjL21L21(i1,i2) + T23adjL22L22(i1,i2) +              & 
&  7*T23adjL23L23(i1,i2) + T23adjYdYd(i1,i2) + T23adjYuYu(i1,i2) + 2*TpTeCYeL23(i1,      & 
& i2) + TpYeCYeT23(i1,i2) + 4*TradjL21T23*L21(i1,i2) + 4*TradjL22T23*L22(i1,             & 
& i2) + (14*g1p2*M1*L23(i1,i2))/15._dp + (32*g3p2*M3*L23(i1,i2))/3._dp + 6*g2p2*M2*L23(i1,& 
& i2) + 4*TradjL23T23*L23(i1,i2) + 2*TrCL21TpL23*T21(i1,i2) + 2*TrCL22TpL23*T22(i1,      & 
& i2) - (7*g1p2*T23(i1,i2))/15._dp - 3*g2p2*T23(i1,i2) - (16*g3p2*T23(i1,i2))/3._dp +    & 
&  2*TrCL23TpL23*T23(i1,i2)
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaT21(i1,i2,i3) = betaT21(i1,i2,i3)+6*CYdTpT21(1,i1)*Yd(i3,i2) + 6*CYdTpT22(2,i1)*Yd(i3,i2) + 6*CYdTpT23(3,               & 
& i1)*Yd(i3,i2) - 2*CYeT11(1,i1)*Yd(i3,i2) - 2*CYeT12(2,i1)*Yd(i3,i2) - 2*CYeT13(3,      & 
& i1)*Yd(i3,i2) + 4*CYdTpTd(1,i3)*L21(i1,i2) + 4*CYdTpTd(2,i3)*L22(i1,i2) +              & 
&  4*CYdTpTd(3,i3)*L23(i1,i2) + 3*CYdTpL21(1,i1)*Td(i3,i2) + 3*CYdTpL22(2,               & 
& i1)*Td(i3,i2) + 3*CYdTpL23(3,i1)*Td(i3,i2) - CYeL11(1,i1)*Td(i3,i2) - CYeL12(2,        & 
& i1)*Td(i3,i2) - CYeL13(3,i1)*Td(i3,i2) + 2*YdadjYd(i3,1)*T21(i1,i2) + 2*YdadjYd(i3,    & 
& 2)*T22(i1,i2) + 2*YdadjYd(i3,3)*T23(i1,i2)
End Do
End Do
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
Do i2 = 1,3
betaT22(i1,i2,1) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT22(i1,i2,2) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
betaT22(i1,i2,3) = 0
End Do
End Do
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,3
betaT22(i1,i2,i3) = betaT22(i1,i2,i3)+(0)
End Do
End Do
End Do

 
DT2 = oo16pi2*( betaT21 + oo16pi2 * betaT22 ) 

 
Else 
DT2 = oo16pi2* betaT21 
End If 
 
 
!-------------------- 
! Tu 
!-------------------- 
 
betaTu1  = TuadjL21L21 + TuadjL22L22 + TuadjL23L23 + TuadjYdYd + 5._dp*(TuadjYuYu)    & 
&  + (26*g1p2*M1*Yu)/15._dp + (32*g3p2*M3*Yu)/3._dp + 6*g2p2*M2*Yu + 6*TradjYuTu*Yu +    & 
&  2._dp*(YuadjL21T21) + 2._dp*(YuadjL22T22) + 2._dp*(YuadjL23T23) + 2._dp*(YuadjYdTd)   & 
&  + 4._dp*(YuadjYuTu) - (13*g1p2*Tu)/15._dp - 3*g2p2*Tu - (16*g3p2*Tu)/3._dp +          & 
&  3*TrYuadjYu*Tu

 
 
If (TwoLoopRGE) Then 
betaTu2 = 0

 
DTu = oo16pi2*( betaTu1 + oo16pi2 * betaTu2 ) 

 
Else 
DTu = oo16pi2* betaTu1 
End If 
 
 
Call Chop(DTu) 

!-------------------- 
! Bmu 
!-------------------- 
 
betaBmu1  = (6*g1p2*M1*Mu)/5._dp + 6*g2p2*M2*Mu + 6*TradjYdTd*Mu + 2*TradjYeTe*Mu +   & 
&  6*TradjYuTu*Mu - (3*g1p2*Bmu)/5._dp - 3*g2p2*Bmu + 3*TrYdadjYd*Bmu + TrYeadjYe*Bmu +  & 
&  3*TrYuadjYu*Bmu - 6*TdadjL21REps(1) - 6*TdadjL22REps(2) - 6*TdadjL23REps(3)           & 
&  + 2*TeCL11REps(1) + 2*TeCL12REps(2) + 2*TeCL13REps(3) - 3*YdadjL21Beps(1)             & 
&  - 3*YdadjL22Beps(2) - 3*YdadjL23Beps(3) + YeCL11Beps(1) + YeCL12Beps(2)               & 
&  + YeCL13Beps(3)

 
 
If (TwoLoopRGE) Then 
betaBmu2 = 0

 
DBmu = oo16pi2*( betaBmu1 + oo16pi2 * betaBmu2 ) 

 
Else 
DBmu = oo16pi2* betaBmu1 
End If 
 
 
Call Chop(DBmu) 

!-------------------- 
! Beps 
!-------------------- 
 
Do i1 = 1,3
betaBeps1(i1) = -3*Bmu*CYdTpL21(1,i1) - 3*Bmu*CYdTpL22(2,i1) - 3*Bmu*CYdTpL23(3,i1) - 6*Mu*CYdTpT21(1,& 
& i1) - 6*Mu*CYdTpT22(2,i1) - 6*Mu*CYdTpT23(3,i1) + Bmu*CYeL11(1,i1) + Bmu*CYeL12(2,     & 
& i1) + Bmu*CYeL13(3,i1) + 2*Mu*CYeT11(1,i1) + 2*Mu*CYeT12(2,i1) + 2*Mu*CYeT13(3,        & 
& i1) - L11CL11Beps(i1) - L12CL12Beps(i1) - L13CL13Beps(i1) + 3*L21adjL21Beps(i1) +      & 
&  3*L22adjL22Beps(i1) + 3*L23adjL23Beps(i1) - 2*T11CL11REps(i1) - 2*T12CL12REps(i1) -   & 
&  2*T13CL13REps(i1) + 6*T21adjL21REps(i1) + 6*T22adjL22REps(i1) + 6*T23adjL23REps(i1) + & 
&  2*TpTeCYeREps(i1) + TpYeCYeBeps(i1) + (6*g1p2*M1*REps(i1))/5._dp + 6*g2p2*M2*REps(i1) +& 
&  6*TradjYuTu*REps(i1) - (3*g1p2*Beps(i1))/5._dp - 3*g2p2*Beps(i1) + 3*TrYuadjYu*Beps(i1)
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
betaBeps2(i1) = 0
End Do

 
DBeps = oo16pi2*( betaBeps1 + oo16pi2 * betaBeps2 ) 

 
Else 
DBeps = oo16pi2* betaBeps1 
End If 
 
 
Call Chop(DBeps) 

!-------------------- 
! mq2 
!-------------------- 
 
betamq21  = 2._dp*(adjL21Cml2L21) + adjL21L21mq2 + 2._dp*(adjL22Cml2L22)              & 
&  + adjL22L22mq2 + 2._dp*(adjL23Cml2L23) + adjL23L23mq2 + 2._dp*(adjT21T21)             & 
&  + 2._dp*(adjT22T22) + 2._dp*(adjT23T23) + 2._dp*(adjTdTd) + 2._dp*(adjTuTu)           & 
&  + 2._dp*(adjYdmd2Yd) + adjYdYdmq2 + 2._dp*(adjYumu2Yu) + adjYuYumq2 + 2._dp*(DyadjL21mlHd2i1Yd1i2)& 
&  + 2._dp*(DyadjL22mlHd2i1Yd2i2) + 2._dp*(DyadjL23mlHd2i1Yd3i2) - (2*AbsM1*g1p2*id3R)   & 
& /15._dp - 6*AbsM2*g2p2*id3R - (32*AbsM3*g3p2*id3R)/3._dp + 2*adjYdYd*mHd2 +            & 
&  2*adjYuYu*mHu2 + mq2adjL21L21 + mq2adjL22L22 + mq2adjL23L23 + mq2adjYdYd +            & 
&  mq2adjYuYu + 2*adjL21L21*md2(1,1) + 2*adjL21L22*md2(1,2) + 2*adjL21L23*md2(1,         & 
& 3) + 2*adjL22L21*md2(2,1) + 2*adjL22L22*md2(2,2) + 2*adjL22L23*md2(2,3) +              & 
&  2*adjL23L21*md2(3,1) + 2*adjL23L22*md2(3,2) + 2*adjL23L23*md2(3,3) + g1*id3R*ooSqrt15*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamq22 = 0

 
Dmq2 = oo16pi2*( betamq21 + oo16pi2 * betamq22 ) 

 
Else 
Dmq2 = oo16pi2* betamq21 
End If 
 
 
Call Chop(Dmq2) 

Forall(i1=1:3) Dmq2(i1,i1) =  Real(Dmq2(i1,i1),dp) 
Dmq2 = 0.5_dp*(Dmq2+ Conjg(Transpose(Dmq2)) ) 
!-------------------- 
! ml2 
!-------------------- 
 
betaml21  = 2._dp*(adjTeTe) + 2._dp*(adjYeme2Ye) + adjYeYeml2 - 2._dp*(CL11Cml2L11)   & 
&  - CL11L11ml2 - 2._dp*(CL12Cml2L12) - CL12L12ml2 - 2._dp*(CL13Cml2L13) -               & 
&  CL13L13ml2 + 6._dp*(CL21Cmq2TpL21) + 3._dp*(CL21TpL21ml2) + 6._dp*(CL22Cmq2TpL22)     & 
&  + 3._dp*(CL22TpL22ml2) + 6._dp*(CL23Cmq2TpL23) + 3._dp*(CL23TpL23ml2) -               & 
&  2._dp*(CT11T11) - 2._dp*(CT12T12) - 2._dp*(CT13T13) + 6._dp*(CT21TpT21)               & 
&  + 6._dp*(CT22TpT22) + 6._dp*(CT23TpT23) - 2._dp*(DyCL11mlHd2i1Ye1i2) - 2._dp*(DyCL12mlHd2i1Ye2i2)& 
&  - 2._dp*(DyCL13mlHd2i1Ye3i2) + 3._dp*(DyYdadjL211i1mlHd2i2) + 3._dp*(DyYdadjL222i1mlHd2i2)& 
&  + 3._dp*(DyYdadjL233i1mlHd2i2) - DyYeCL111i1mlHd2i2 - DyYeCL122i1mlHd2i2 -            & 
&  DyYeCL133i1mlHd2i2 - (6*AbsM1*g1p2*id3R)/5._dp - 6*AbsM2*g2p2*id3R + 2*adjYeYe*mHd2 + & 
&  ml2adjYeYe - ml2CL11L11 - ml2CL12L12 - ml2CL13L13 + 3._dp*(ml2CL21TpL21)              & 
&  + 3._dp*(ml2CL22TpL22) + 3._dp*(ml2CL23TpL23) + 6*CL21TpL21*md2(1,1) + 6*CL21TpL22*md2(1,& 
& 2) + 6*CL21TpL23*md2(1,3) + 6*CL22TpL21*md2(2,1) + 6*CL22TpL22*md2(2,2) +              & 
&  6*CL22TpL23*md2(2,3) + 6*CL23TpL21*md2(3,1) + 6*CL23TpL22*md2(3,2) + 6*CL23TpL23*md2(3,& 
& 3) - 2*CL11L11*me2(1,1) - 2*CL11L12*me2(1,2) - 2*CL11L13*me2(1,3) - 2*CL12L11*me2(2,   & 
& 1) - 2*CL12L12*me2(2,2) - 2*CL12L13*me2(2,3) - 2*CL13L11*me2(3,1) - 2*CL13L12*me2(3,   & 
& 2) - 2*CL13L13*me2(3,3) - g1*id3R*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betaml22 = 0

 
Dml2 = oo16pi2*( betaml21 + oo16pi2 * betaml22 ) 

 
Else 
Dml2 = oo16pi2* betaml21 
End If 
 
 
Call Chop(Dml2) 

Forall(i1=1:3) Dml2(i1,i1) =  Real(Dml2(i1,i1),dp) 
Dml2 = 0.5_dp*(Dml2+ Conjg(Transpose(Dml2)) ) 
!-------------------- 
! mHd2 
!-------------------- 
 
betamHd21  = (-6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 6._dp*(TrCTdTpTd) +               & 
&  2._dp*(TrCTeTpTe) + 6._dp*(Trmd2YdadjYd) + 2._dp*(Trme2YeadjYe) + 2._dp*(Trml2adjYeYe)& 
&  + 6._dp*(Trmq2adjYdYd) + 6*mHd2*TrYdadjYd + 2*mHd2*TrYeadjYe - g1*sqrt3ov5*Tr1(1)     & 
&  + 3*YdadjL21mlHd2(1) + 3*YdadjL22mlHd2(2) + 3*YdadjL23mlHd2(3) - YeCL11mlHd2(1)       & 
&  - YeCL12mlHd2(2) - YeCL13mlHd2(3)

 
 
If (TwoLoopRGE) Then 
betamHd22 = 0

 
DmHd2 = oo16pi2*( betamHd21 + oo16pi2 * betamHd22 ) 

 
Else 
DmHd2 = oo16pi2* betamHd21 
End If 
 
 
!-------------------- 
! mHu2 
!-------------------- 
 
betamHu21  = (-6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 6._dp*(TrCTuTpTu) +               & 
&  6._dp*(Trmq2adjYuYu) + 6._dp*(Trmu2YuadjYu) + 6*mHu2*TrYuadjYu + g1*sqrt3ov5*Tr1(1)

 
 
If (TwoLoopRGE) Then 
betamHu22 = 0

 
DmHu2 = oo16pi2*( betamHu21 + oo16pi2 * betamHu22 ) 

 
Else 
DmHu2 = oo16pi2* betamHu21 
End If 
 
 
!-------------------- 
! md2 
!-------------------- 
 
betamd21 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betamd21(i1,i2) = 2*md2YdadjYd(i1,i2) + 4*TdadjTd(i1,i2) + 4*mHd2*YdadjYd(i1,i2) + 2*YdadjYdmd2(i1,     & 
& i2) + 4*Ydmq2adjYd(i1,i2)
If (1.eq.i1) Then 
betamd21(i1,i2) = betamd21(i1,i2)+4*TrCT21TpT21*Kronecker(1,i2) + 4*Trml2CL21TpL21*Kronecker(1,i2) + 4*Trmq2adjL21L21*Kronecker(1,& 
& i2) + 4*TrCT22TpT21*Kronecker(2,i2) + 4*Trml2CL22TpL21*Kronecker(2,i2) +               & 
&  4*Trmq2adjL22L21*Kronecker(2,i2) + 4*TrCT23TpT21*Kronecker(3,i2) + 4*Trml2CL23TpL21*Kronecker(3,& 
& i2) + 4*Trmq2adjL23L21*Kronecker(3,i2) + 2*TrCL21TpL21*md2(1,i2) + 2*TrCL22TpL21*md2(2,& 
& i2) + 2*TrCL23TpL21*md2(3,i2)
End If 
If (2.eq.i1) Then 
betamd21(i1,i2) = betamd21(i1,i2)+4*TrCT21TpT22*Kronecker(1,i2) + 4*Trml2CL21TpL22*Kronecker(1,i2) + 4*Trmq2adjL21L22*Kronecker(1,& 
& i2) + 4*TrCT22TpT22*Kronecker(2,i2) + 4*Trml2CL22TpL22*Kronecker(2,i2) +               & 
&  4*Trmq2adjL22L22*Kronecker(2,i2) + 4*TrCT23TpT22*Kronecker(3,i2) + 4*Trml2CL23TpL22*Kronecker(3,& 
& i2) + 4*Trmq2adjL23L22*Kronecker(3,i2) + 2*TrCL21TpL22*md2(1,i2) + 2*TrCL22TpL22*md2(2,& 
& i2) + 2*TrCL23TpL22*md2(3,i2)
End If 
If (3.eq.i1) Then 
betamd21(i1,i2) = betamd21(i1,i2)+4*TrCT21TpT23*Kronecker(1,i2) + 4*Trml2CL21TpL23*Kronecker(1,i2) + 4*Trmq2adjL21L23*Kronecker(1,& 
& i2) + 4*TrCT22TpT23*Kronecker(2,i2) + 4*Trml2CL22TpL23*Kronecker(2,i2) +               & 
&  4*Trmq2adjL22L23*Kronecker(2,i2) + 4*TrCT23TpT23*Kronecker(3,i2) + 4*Trml2CL23TpL23*Kronecker(3,& 
& i2) + 4*Trmq2adjL23L23*Kronecker(3,i2) + 2*TrCL21TpL23*md2(1,i2) + 2*TrCL22TpL23*md2(2,& 
& i2) + 2*TrCL23TpL23*md2(3,i2)
End If 
If (1.eq.i2) Then 
betamd21(i1,i2) = betamd21(i1,i2)+2*TrCL21TpL21*md2(i1,1) + 2*TrCL21TpL22*md2(i1,2) + 2*TrCL21TpL23*md2(i1,             & 
& 3) + 4*YdadjL21mlHd2(i1)
End If 
If (2.eq.i2) Then 
betamd21(i1,i2) = betamd21(i1,i2)+2*TrCL22TpL21*md2(i1,1) + 2*TrCL22TpL22*md2(i1,2) + 2*TrCL22TpL23*md2(i1,             & 
& 3) + 4*YdadjL22mlHd2(i1)
End If 
If (3.eq.i2) Then 
betamd21(i1,i2) = betamd21(i1,i2)+2*TrCL23TpL21*md2(i1,1) + 2*TrCL23TpL22*md2(i1,2) + 2*TrCL23TpL23*md2(i1,             & 
& 3) + 4*YdadjL23mlHd2(i1)
End If 
If (i2.eq.i1) Then 
betamd21(i1,i2) = betamd21(i1,i2)+((-8*AbsM1*g1p2)/15._dp - (32*AbsM3*g3p2)/3._dp + 2*g1*ooSqrt15*Tr1(1))
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betamd22 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betamd22(i1,i2) = 0
End Do
End Do

 
Dmd2 = oo16pi2*( betamd21 + oo16pi2 * betamd22 ) 

 
Else 
Dmd2 = oo16pi2* betamd21 
End If 
 
 
Call Chop(Dmd2) 

Forall(i1=1:3) Dmd2(i1,i1) =  Real(Dmd2(i1,i1),dp) 
Dmd2 = 0.5_dp*(Dmd2+ Conjg(Transpose(Dmd2)) ) 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 2*(mu2YuadjYu + 2._dp*(TuadjTu) + 2*mHu2*YuadjYu + YuadjYumu2 +           & 
&  2._dp*(Yumq2adjYu)) - (4*id3R*(8*AbsM1*g1p2 + 40*AbsM3*g3p2 + 15*g1*ooSqrt15*Tr1(1)))/15._dp

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Forall(i1=1:3) Dmu2(i1,i1) =  Real(Dmu2(i1,i1),dp) 
Dmu2 = 0.5_dp*(Dmu2+ Conjg(Transpose(Dmu2)) ) 
!-------------------- 
! me2 
!-------------------- 
 
betame21 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betame21(i1,i2) = 2*me2YeadjYe(i1,i2) + 4*TeadjTe(i1,i2) + 4*mHd2*YeadjYe(i1,i2) + 2*YeadjYeme2(i1,     & 
& i2) + 4*Yeml2adjYe(i1,i2)
If (1.eq.i1) Then 
betame21(i1,i2) = betame21(i1,i2)-2*TrCT11T11*Kronecker(1,i2) - 4*Trml2CL11L11*Kronecker(1,i2) - 2*TrCT12T11*Kronecker(2,& 
& i2) - 4*Trml2CL12L11*Kronecker(2,i2) - 2*TrCT13T11*Kronecker(3,i2) - 4*Trml2CL13L11*Kronecker(3,& 
& i2) - TrCL11L11*me2(1,i2) - TrCL12L11*me2(2,i2) - TrCL13L11*me2(3,i2)
End If 
If (2.eq.i1) Then 
betame21(i1,i2) = betame21(i1,i2)-2*TrCT11T12*Kronecker(1,i2) - 4*Trml2CL11L12*Kronecker(1,i2) - 2*TrCT12T12*Kronecker(2,& 
& i2) - 4*Trml2CL12L12*Kronecker(2,i2) - 2*TrCT13T12*Kronecker(3,i2) - 4*Trml2CL13L12*Kronecker(3,& 
& i2) - TrCL11L12*me2(1,i2) - TrCL12L12*me2(2,i2) - TrCL13L12*me2(3,i2)
End If 
If (3.eq.i1) Then 
betame21(i1,i2) = betame21(i1,i2)-2*TrCT11T13*Kronecker(1,i2) - 4*Trml2CL11L13*Kronecker(1,i2) - 2*TrCT12T13*Kronecker(2,& 
& i2) - 4*Trml2CL12L13*Kronecker(2,i2) - 2*TrCT13T13*Kronecker(3,i2) - 4*Trml2CL13L13*Kronecker(3,& 
& i2) - TrCL11L13*me2(1,i2) - TrCL12L13*me2(2,i2) - TrCL13L13*me2(3,i2)
End If 
If (1.eq.i2) Then 
betame21(i1,i2) = betame21(i1,i2)-(TrCL11L11*me2(i1,1)) - TrCL11L12*me2(i1,2) - TrCL11L13*me2(i1,3) - 4*YeCL11mlHd2(i1)
End If 
If (2.eq.i2) Then 
betame21(i1,i2) = betame21(i1,i2)-(TrCL12L11*me2(i1,1)) - TrCL12L12*me2(i1,2) - TrCL12L13*me2(i1,3) - 4*YeCL12mlHd2(i1)
End If 
If (3.eq.i2) Then 
betame21(i1,i2) = betame21(i1,i2)-(TrCL13L11*me2(i1,1)) - TrCL13L12*me2(i1,2) - TrCL13L13*me2(i1,3) - 4*YeCL13mlHd2(i1)
End If 
If (i2.eq.i1) Then 
betame21(i1,i2) = betame21(i1,i2)+((-24*AbsM1*g1p2)/5._dp + 2*g1*sqrt3ov5*Tr1(1))
End If 
End Do
End Do

 
 
If (TwoLoopRGE) Then 
betame22 = 0._dp 
Do i1 = 1,3
Do i2 = 1,3
betame22(i1,i2) = 0
End Do
End Do

 
Dme2 = oo16pi2*( betame21 + oo16pi2 * betame22 ) 

 
Else 
Dme2 = oo16pi2* betame21 
End If 
 
 
Call Chop(Dme2) 

Forall(i1=1:3) Dme2(i1,i1) =  Real(Dme2(i1,i1),dp) 
Dme2 = 0.5_dp*(Dme2+ Conjg(Transpose(Dme2)) ) 
!-------------------- 
! mlHd2 
!-------------------- 
 
Do i1 = 1,3
betamlHd21(i1) = 6*md2YdadjL21(1,i1) + 6*md2YdadjL22(2,i1) + 6*md2YdadjL23(3,i1) - 2*me2YeCL11(1,      & 
& i1) - 2*me2YeCL12(2,i1) - 2*me2YeCL13(3,i1) + 3*ml2CL21TpYd(i1,1) + 3*ml2CL22TpYd(i1,  & 
& 2) + 3*ml2CL23TpYd(i1,3) + 6*TdadjT21(1,i1) + 6*TdadjT22(2,i1) + 6*TdadjT23(3,         & 
& i1) - 2*TeCT11(1,i1) - 2*TeCT12(2,i1) - 2*TeCT13(3,i1) + 3*mHd2*YdadjL21(1,            & 
& i1) + 3*mHd2*YdadjL22(2,i1) + 3*mHd2*YdadjL23(3,i1) + 6*Ydmq2adjL21(1,i1) +            & 
&  6*Ydmq2adjL22(2,i1) + 6*Ydmq2adjL23(3,i1) - mHd2*YeCL11(1,i1) - YeCL11Cml2(1,         & 
& i1) - mHd2*YeCL12(2,i1) - YeCL12Cml2(2,i1) - mHd2*YeCL13(3,i1) - YeCL13Cml2(3,         & 
& i1) - 2*Yeml2CL11(1,i1) - 2*Yeml2CL12(2,i1) - 2*Yeml2CL13(3,i1)
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
betamlHd22(i1) = 0
End Do

 
DmlHd2 = oo16pi2*( betamlHd21 + oo16pi2 * betamlHd22 ) 

 
Else 
DmlHd2 = oo16pi2* betamlHd21 
End If 
 
 
!-------------------- 
! M1 
!-------------------- 
 
betaM11  = (66*g1p2*M1)/5._dp

 
 
If (TwoLoopRGE) Then 
betaM12 = 0

 
DM1 = oo16pi2*( betaM11 + oo16pi2 * betaM12 ) 

 
Else 
DM1 = oo16pi2* betaM11 
End If 
 
 
Call Chop(DM1) 

!-------------------- 
! M2 
!-------------------- 
 
betaM21  = 2*g2p2*M2

 
 
If (TwoLoopRGE) Then 
betaM22 = 0

 
DM2 = oo16pi2*( betaM21 + oo16pi2 * betaM22 ) 

 
Else 
DM2 = oo16pi2* betaM21 
End If 
 
 
Call Chop(DM2) 

!-------------------- 
! M3 
!-------------------- 
 
betaM31  = -6*g3p2*M3

 
 
If (TwoLoopRGE) Then 
betaM32 = 0

 
DM3 = oo16pi2*( betaM31 + oo16pi2 * betaM32 ) 

 
Else 
DM3 = oo16pi2* betaM31 
End If 
 
 
Call Chop(DM3) 

!-------------------- 
! vd 
!-------------------- 
 
betavd1  = -3*TrYdadjYd*vd - TrYeadjYe*vd + (3*g1p2*vd*(1 + Xi))/20._dp +             & 
&  (3*g2p2*vd*(1 + Xi))/4._dp - 3*YdadjL21vL(1) - 3*YdadjL22vL(2) - 3*YdadjL23vL(3)      & 
&  + YeCL11vL(1) + YeCL12vL(2) + YeCL13vL(3)

 
 
If (TwoLoopRGE) Then 
betavd2 = 0

 
Dvd = oo16pi2*( betavd1 + oo16pi2 * betavd2 ) 

 
Else 
Dvd = oo16pi2* betavd1 
End If 
 
 
!-------------------- 
! vu 
!-------------------- 
 
betavu1  = (3*vu*(g1p2*(1 + Xi) + 5*(g2p2 - 4._dp*(TrYuadjYu) + g2p2*Xi)))/20._dp

 
 
If (TwoLoopRGE) Then 
betavu2 = 0

 
Dvu = oo16pi2*( betavu1 + oo16pi2 * betavu2 ) 

 
Else 
Dvu = oo16pi2* betavu1 
End If 
 
 
!-------------------- 
! vL 
!-------------------- 
 
Do i1 = 1,3
betavL1(i1) = -3*vd*CYdTpL21(1,i1) - 3*vd*CYdTpL22(2,i1) - 3*vd*CYdTpL23(3,i1) + vd*CYeL11(1,       & 
& i1) + vd*CYeL12(2,i1) + vd*CYeL13(3,i1) + L11CL11vL(i1) + L12CL12vL(i1) +              & 
&  L13CL13vL(i1) - 3*L21adjL21vL(i1) - 3*L22adjL22vL(i1) - 3*L23adjL23vL(i1) -           & 
&  TpYeCYevL(i1) + (3*g1p2*vL(i1))/20._dp + (3*g2p2*vL(i1))/4._dp + (3*g1p2*Xi*vL(i1))/20._dp +& 
&  (3*g2p2*Xi*vL(i1))/4._dp
End Do

 
 
If (TwoLoopRGE) Then 
Do i1 = 1,3
betavL2(i1) = 0
End Do

 
DvL = oo16pi2*( betavL1 + oo16pi2 * betavL2 ) 

 
Else 
DvL = oo16pi2* betavL1 
End If 
 
 
Call ParametersToG449(Dg1,Dg2,Dg3,DYd,DYe,DL1,DL2,DYu,DMu,DREps,DTd,DTe,              & 
& DT1,DT2,DTu,DBmu,DBeps,Dmq2,Dml2,DmHd2,DmHu2,Dmd2,Dmu2,Dme2,DmlHd2,DM1,DM2,            & 
& DM3,Dvd,Dvu,DvL,f)

Iname = Iname - 1 
 
End Subroutine rge449  

End Module RGEs_MSSMLV 
 
