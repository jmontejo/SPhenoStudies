#wget https://spheno.hepforge.org/downloads/?f=SPheno-4.0.5.tar.gz -O SPheno-4.0.5.tar.gz
#tar -xzf SPheno-4.0.5.tar.gz

#Get some new python3
setupATLAS
lsetup "views LCG_100 x86_64-centos7-gcc8-opt"

### Install SPheno
cd SPheno
mkdir build
cd build
cmake -DMODELS=MSSMTriRpV ..
make -j8
make install

### Link RPV models (more are available but not linked)
cd SPheno/models
sarahmodelfolder="../../SARAH_models/Models/MSSM-RpV/"
for model in `ls $sarahmodelfolder`; do 
    ln -s $sarahmodelfolder/$model MSSM-RpV-$model
done
