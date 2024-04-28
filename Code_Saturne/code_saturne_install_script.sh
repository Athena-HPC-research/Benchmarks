echo "Downloading the code for the benchmark"
wget code_saturne.tar.gz https://www.code-saturne.org/cms/sites/default/files/releases/code_saturne-7.0.0.tar.gz
tar -xf code_saturne-7.0.0.tar.gz
echo "Compiling the code of the benchmark"
cd code_saturne-7.0.0
echo pwd
./configure
make
sudo make install
chmod +x ./bin/code_saturne
echo "The code of the benchmark has been installed. Now we are making the data(study) for the benchmark"
echo "Now we get to the docs <Preparing a simulation> part in https://repository.prace-ri.eu/git/UEABS/ueabs/-/tree/master/code_saturne?ref_type=heads"
wget https://repository.prace-ri.eu/ueabs/Code_Saturne/2.2/CS_7.0.0_PRACE_UEABS_CAVITY_13M.tar.gz
tar -xf CS_7.0.0_PRACE_UEABS_CAVITY_13M.tar.gz
# a lot of those should be translated with proper paths in order to really work
# mv CS_7.0.0_PRACE_UEABS_CAVITY_13M CAVITY_13M
./bin/code_saturne create --study CAVITY_13M --case MACHINE --copy-ref
cp ./CS_7.0.0_PRACE_UEABS_CAVITY_13M/mesh_input.csm ./CAVITY_13M/MESH/
cp ./CS_7.0.0_PRACE_UEABS_CAVITY_13M/src/cs_user_* ./CAVITY_13M/MACHINE/SRC/
# if it already has a value it should be:
# export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib
cp ./CAVITY_13M/MACHINE/DATA/REFERENCE/cs_user_scripts.py ./CAVITY_13M/MACHINE/DATA/
# this is to change a line in the file as instructed by the documentation
sed -i 's/domain\.mesh_input = None/domain\.mesh_input="..\/MESH\/mesh_input\.csm"/g' ./CAVITY_13M/MACHINE/DATA/cs_user_scripts.py

cd CAVITY_13M/MACHINE
echo "From: " pwd
# i have probably messed up the path here, will fix"
sudo ../../bin/code_saturn run --initialize

echo "There should be a file in CAVITY_13M/MACHINE that inside RESU/YYYYMMDD-HHMM has the executable to be run with mpirun ./cs_solver"
