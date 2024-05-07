# Specfem3d_globe benchmark

The github repo is [here](https://github.com/SPECFEM/specfem3d_globe/).

Their example can easily be run with the following commands.

```
git clone https://github.com/SPECFEM/specfem3d_globe.git
cd specfem3d_globe
./configure FC=gfortran CC=gcc MPIFC=mpif90
make all
cd EXAMPLES/regional_Greece_small/
./run_this_example.sh
```
if you get this error: `/usr/bin/env: ‘python’: No such file or directory`
Do this:
```
sudo apt install python-is-python3
```

The results of each benchmark are in the OUTPUT_FILES directory.

Caution: These commands require: GNU Autotools, a fortran compiler(`sudo apt install gfortran`), there are also other versions of the fortran compiler but here the classic 95 version should be enough. Also per sub-benchmark different things might need to be done. Also the MPI processes number is calculated by them so depending on the system and the specific benchmark chosen, there might be warnings about not enough slots.

Notes:
In the ueabs repo there are slurm job submission scripts which we can use to understand how to submit it properly.
From the ueabs benchmarking documentation:
> The relevant metric for this benchmark is time for the solver. It is recommended to use the "time" command in front of the solver's mpi launcher to harmonize the results. Using slurm, it is easy to gather as each mpirun or srun is interpreted as a step which is already timed. So the command line sacct -j <job_id> allows you to catch the metric. The output of the mesher (“output_mesher.txt”) and of the solver (“output_solver.txt”) can be find in the OUTPUT_FILES directory. These files contains physical values and timing values that are more accurate than those collected by slurm.


Working benchmarks for:
(there is a readme in each folder, and it is mostly running ./run_this_example.sh and maybe messing around with run_mesher_solver.bash)

- regional_Greece_small
- regional_Greece_noise_small (requires a change to run_generate_S_squared to use the python executable and pip3 to install numpy in order to be run)
- regional_Mexico_noise_non_uniform (might produce this error: `Program received signal SIGFPE: Floating-point exception - erroneous arithmetic operation.`)
- regional_simultaneous runs (again ./run_this_example.sh, it requires around 7.5gigs of ram, it might need a --oversubscribe flag on mpi, as it requires 16 slots for 4 simultaneous runs, it can be more customised, it gets everything to 100% all CPUs in my laptop with --oversubscribe, it takes a few minutes )
- -regional_small_benchmark_to_test_very_simple_earth (around 10gigs of ram, also needed the --oversubscribe flag as it requires 24 MPI processes, CPUs to 100%, 99% the time)


Benchmark TODOs:
- [X] run on x86
- [ ] run on ARM
- [ ] run in a slurm benchmark
- [ ] script for running it with different configs
- [ ] script for parsing results in an analysable manner
- [ ] results interpration and understanding
