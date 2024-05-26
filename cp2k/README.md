# The CP2K Benchmark

> CP2K is a freely available quantum chemistry and solid-state physics software
package that can perform atomistic simulations of solid state, liquid,
molecular, periodic, material, crystal, and biological systems.

The original documentation can be found [here](https://repository.prace-ri.eu/git/UEABS/ueabs/-/tree/master/cp2k?ref_type=heads)

It is now a package in apt repositories

Just run `sudo apt install cp2k`

Doing an `apt-file list cp2k` will show you where the files you need are.(might need to first install the package apt-file to use this command)

With mpi properly installed just do:

`mpirun -np 4 /usr/bin/cp2k.psmp -i /usr/share/doc/cp2k/examples/C.inp -o logs_c_inp`
On my laptop with gnome up and running it takes 6.8 gigs of ram and gets all CPUs to 100% for 2 minutes.
It provides an execution time(a starting time and an ending time) in the output file, specified with the -o flag.
Also it provides flops in the following format:

```
COUNTER                                    TOTAL       BLAS       SMM       ACC
 flops    13 x    13 x     6                18252     100.0%      0.0%      0.0%
 
 flops inhomo. stacks                           0       0.0%      0.0%      0.0%
 
 flops total                        18.252000E+03     100.0%      0.0%      0.0%
 
 flops max/rank                     18.252000E+03     100.0%      0.0%      0.0%
 
 matmuls inhomo. stacks                         0       0.0%      0.0%      0.0%
 
 matmuls total                                  9     100.0%      0.0%      0.0%
 
 number of processed stacks                     9     100.0%      0.0%      0.0%
 
 average stack size                                     1.0       0.0       0.0
 
 marketing flops                    12.168000E+03
```
In `/usr/share/doc/examples/` there are more .inp files someone can use in order to run the different benchmarks of scientific calculations. More info on their page. We can also compile from source if needed for the most libraries.

The benchmark is low on RAM usage(around 1-2gigs of ram) and gets CPU to 100% so it should be manageable for RPIs.
It has a smaller input C.inp to experiment with that takes less than a minute.
It has various .inp files depending on the specific thing we want to run, one of them just takes a few minutes, but nothing to large. They have some zip files that are probably the big things to run(which i havent run yet)


TODOs:
- [x] Has easy way to run (no custom script needed)
- [x] Has run in x86.
- [ ] Has run in ARM.
- [ ] Has its results parsed and properly understood.
- [ ] Has a script that runs it lots of times with different params
