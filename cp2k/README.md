# The CP2K Benchmark

The original documentation can be found [here](https://repository.prace-ri.eu/git/UEABS/ueabs/-/tree/master/cp2k?ref_type=heads)

It is now a package in apt repositories

Just run `sudo apt install cp2k`

Doing an `apt-file list cp2k` will show you where the files you need are.

With mpi properly installed just do:

`mpirun -np 4 /usr/bin/cp2k.psmp -i /usr/share/doc/cp2k/examples/C.inp -o logs_c_inp`

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
