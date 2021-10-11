modname = MSSMLV  # as an example  
PreDef = -DGENERATIONMIXING 
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoMSSMLV.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoMSSMLV:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoMSSMLV.o 
	 ${F90} -o SPhenoMSSMLV ${LFlagsB} SPhenoMSSMLV.o ../lib/libSPhenoMSSMLV.a ../lib/libSPheno.a
	 mv SPhenoMSSMLV ../bin
	 rm SPhenoMSSMLV.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_MSSMLV.o)  \
 ${name}(RGEs_MSSMLV.o)   \
 ${name}(Couplings_MSSMLV.o) ${name}(TreeLevelMasses_MSSMLV.o) ${name}(TadpoleEquations_MSSMLV.o) \
 ${name}(LoopCouplings_MSSMLV.o) ${name}(CouplingsForDecays_MSSMLV.o) \
 ${name}(TreeLevel_Decays_MSSMLV.o) \
 ${name}(Glu_MSSMLV.o)  ${name}(Sd_MSSMLV.o)  ${name}(Su_MSSMLV.o)  ${name}(Cha_MSSMLV.o)  ${name}(Chi_MSSMLV.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(EffPotFunctions.o) ${name}(DerivativesEffPotFunctions.o) ${name}(EffectivePotential_MSSMLV.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_MSSMLV.o) \
 ${name}(LoopMasses_MSSMLV.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_MSSMLV.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecaySd_MSSMLV.o)  ${name}(LoopDecaySu_MSSMLV.o)  ${name}(LoopDecayhh_MSSMLV.o)  ${name}(LoopDecayAh_MSSMLV.o)  ${name}(LoopDecayHpm_MSSMLV.o)  ${name}(LoopDecayGlu_MSSMLV.o)  ${name}(LoopDecayFu_MSSMLV.o)  ${name}(LoopDecayCha_MSSMLV.o)  ${name}(LoopDecayChi_MSSMLV.o) \
 ${name}(Wrapper_LoopDecay_Sd_MSSMLV.o)  ${name}(Wrapper_LoopDecay_Su_MSSMLV.o)  ${name}(Wrapper_LoopDecay_hh_MSSMLV.o)  ${name}(Wrapper_LoopDecay_Ah_MSSMLV.o)  ${name}(Wrapper_LoopDecay_Hpm_MSSMLV.o)  ${name}(Wrapper_LoopDecay_Glu_MSSMLV.o)  ${name}(Wrapper_LoopDecay_Fu_MSSMLV.o)  ${name}(Wrapper_LoopDecay_Cha_MSSMLV.o)  ${name}(Wrapper_LoopDecay_Chi_MSSMLV.o) ${name}(OneLoopDecays_MSSMLV.o) \
 ${name}(BranchingRatios_MSSMLV.o) ${name}(HiggsCS_MSSMLV.o) ${name}(RunSM_MSSMLV.o) \
 ${name}(LowEnergy_MSSMLV.o) \
${name}(FlavorKit_LFV_MSSMLV.o) ${name}(FlavorKit_QFV_MSSMLV.o) ${name}(FlavorKit_Observables_MSSMLV.o)\
 ${name}(Boundaries_MSSMLV.o)  ${name}(InputOutput_MSSMLV.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
