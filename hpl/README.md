## Running the Linpack benchmark

The original webpage for the benchmark can be found [here](https://netlib.org/benchmark/hpl/index.html).


There is a great tutorial by Gaillard [url](https://www.mgaillard.fr/2022/08/27/benchmark-with-hpl.html). This is what is followed in this cluster, and is assumed read here. 

Compiling OpenBLAS is straightforward, DONT just write make -j 16 in an RPI, for some situations to avoid weird errors make -j1 is a working solution.

Compiling OpenMPI is important to be from version 4.x.x and lower as in version 5 they have dropped support for fortran 77(no mpi77 only mpi90) which is necessary for compiling and running the Linpack Benchmark. (The compile steps should probably be repeated in an identical manner for each node of the cluster, will see soon if that holds true.)

There is a [Makefile](./Make.linux) here which only requires modifications in the MPI section and the LA(Linear Algebra) section. 

Be Careful, the makefiles assume that the hpl benchmark is in the ~/hpl folder so you might need to change the TOPDIR variable in the **Make.linux** and maybe **Make.top**. This is the solution to problems that produce errors similar to "<file/dir> not found ......".

To be run it needs an HPL.dat file which we can produce by heading over to this [website](https://www.advancedclustering.com/act_kb/tune-hpl-dat-file/), and filling in as input: nodes -> 8, 2Gigs each(i might be wrong, can't remember)->2048 and cores per node -> 2.

Also if there are any problems related to makefiles not being selected properly, just change the "arch=" line with "arch=linux", in the Make.top and Make.linux files.

It is important that either the same user is on all nodes, or that the compiled files for OpenMPI are in the same folder(in our case i had to do a /home/max/compiled folder and install OpenMPI there in order to achieve my goal).

Also to use the compiled mpi version more easily just do an `export PATH=<new-ompi-path>/bin:$PATH`, otherwise you will need to mess around with --prefix and specifying the absolute path for mpirun. Also you might need to add `export LD_LIBRARY_PATH=<new-ompi-path>/lib:$LD_LIBRARY_PATH`.

The GFlops increase from 2 hosts does not seem to be wholly there, something should be going on. 
 

