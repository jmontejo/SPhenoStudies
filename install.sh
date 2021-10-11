git submodule init
git submodule update
#wget https://spheno.hepforge.org/downloads/?f=SPheno-4.0.5.tar.gz -O SPheno-4.0.5.tar.gz
#tar -xzf SPheno-4.0.5.tar.gz

#Get some new python3
setupATLAS
lsetup "views LCG_100 x86_64-centos7-gcc8-opt"

### Link RPV models (more are available but not linked)
cd SPheno/models
ln -s ../../SARAH_models/Models/* .

### Install SPheno
cd SPheno
mkdir build
cd build
cmake -DMODELS=MSSMTriRpV ..
make -j8
make install

