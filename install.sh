git submodule init
git submodule update
#wget https://spheno.hepforge.org/downloads/?f=SPheno-4.0.5.tar.gz -O SPheno-4.0.5.tar.gz
#tar -xzf SPheno-4.0.5.tar.gz

#Get some new python3
if ! command -v python3 &> /dev/null; then
    which lsetup &> /dev/null || setupATLAS
    lsetup "views LCG_100 x86_64-centos7-gcc8-opt"
fi

### Link RPV models (more are available on demand)
cd SPheno/models
ln -s ../../SARAH_models/Models/* .
cd ../..

### Compile and install SPheno
echo ""
echo "Will compile and install SPheno, this can take several hours"
echo ""
cd SPheno
mkdir build
cd build
cmake -DMODELS=MSSMTriRpV ..
make -j8
make install
cd ../..

echo ""
echo "Installation completed. Before every session remember to:"
echo "    source setup.sh"
echo ""

