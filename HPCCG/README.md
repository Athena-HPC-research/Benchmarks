This is the documentation regarding the HPCCG benchmark from https://github.com/Mantevo/HPCCG

To run this benchmark the usual MPI and OpenMP installation is needed.
Then the Makefile should be edited to include: the C++ compiler, the location of the MPI headers(depends on the platform somewhere in /usr)

Then a `make -lmpi_cxx` and an `mpirun -np N ./test_HPCCG nx ny nz` is enough to make it run

The project also has a strongScaling Script that runs it in 1 2 4 8 16 32 64 processors in a mathematical manner referred as "strong scaling", so that the global problem being solved is the same.

To avoid the error for not enough slots on our machine we can use the --oversubscribe flag in the mpirun command

A script is written that generates the commands in a separate run-commands.sh file that then can be run to produce the benchmark results.

To get the final-output.csv run the following command in the respective architecture folder:
It requires the test_HPCCG executable to be there and ofc mpi to be available(headers + .so dynamic libs + mpirun executable in path)
`bash script.sh strongOut && chmod +x run-commands.sh && bash run-commands.sh && bash yaml-to-csv.sh strongOut*`
