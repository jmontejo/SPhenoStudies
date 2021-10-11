modname = MSSMBpV  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoMSSMBpV.a
 
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
bin/SPhenoMSSMBpV:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoMSSMBpV.o 
	 ${F90} -o SPhenoMSSMBpV ${LFlagsB} SPhenoMSSMBpV.o ../lib/libSPhenoMSSMBpV.a ../lib/libSPheno.a
	 mv SPhenoMSSMBpV ../bin
	 rm SPhenoMSSMBpV.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_MSSMBpV.o)  \
 ${name}(RGEs_MSSMBpV.o)   \
 ${name}(Couplings_MSSMBpV.o) ${name}(TreeLevelMasses_MSSMBpV.o) ${name}(TadpoleEquations_MSSMBpV.o) \
 ${name}(LoopCouplings_MSSMBpV.o) ${name}(CouplingsForDecays_MSSMBpV.o) \
 ${name}(TreeLevel_Decays_MSSMBpV.o) \
 ${name}(Glu_MSSMBpV.o)  ${name}(Chi_MSSMBpV.o)  ${name}(Cha_MSSMBpV.o)  ${name}(Sd_MSSMBpV.o)  ${name}(Su_MSSMBpV.o)  ${name}(Se_MSSMBpV.o)  ${name}(Sv_MSSMBpV.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(EffPotFunctions.o) ${name}(DerivativesEffPotFunctions.o) ${name}(EffectivePotential_MSSMBpV.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_MSSMBpV.o) \
 ${name}(LoopMasses_MSSMBpV.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_MSSMBpV.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecaySd_MSSMBpV.o)  ${name}(LoopDecaySu_MSSMBpV.o)  ${name}(LoopDecaySe_MSSMBpV.o)  ${name}(LoopDecaySv_MSSMBpV.o)  ${name}(LoopDecayhh_MSSMBpV.o)  ${name}(LoopDecayAh_MSSMBpV.o)  ${name}(LoopDecayHpm_MSSMBpV.o)  ${name}(LoopDecayGlu_MSSMBpV.o)  ${name}(LoopDecayChi_MSSMBpV.o)  ${name}(LoopDecayCha_MSSMBpV.o)  ${name}(LoopDecayFu_MSSMBpV.o) \
 ${name}(Wrapper_LoopDecay_Sd_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Su_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Se_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Sv_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_hh_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Ah_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Hpm_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Glu_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Chi_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Cha_MSSMBpV.o)  ${name}(Wrapper_LoopDecay_Fu_MSSMBpV.o) ${name}(OneLoopDecays_MSSMBpV.o) \
 ${name}(BranchingRatios_MSSMBpV.o) ${name}(HiggsCS_MSSMBpV.o) ${name}(RunSM_MSSMBpV.o) \
 ${name}(FineTuning_MSSMBpV.o) \
 ${name}(LowEnergy_MSSMBpV.o) \
${name}(FlavorKit_LFV_MSSMBpV.o) ${name}(FlavorKit_QFV_MSSMBpV.o) ${name}(FlavorKit_Observables_MSSMBpV.o)\
 ${name}(Boundaries_MSSMBpV.o)  ${name}(InputOutput_MSSMBpV.o) 
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
