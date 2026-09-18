# FAMS: Framework for Active Matter Simulations in Julia 

[![Build Status](https://github.com/sanderkammeraat/FAMS.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/sanderkammeraat/FAMS.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Description
This is a Julia package to simulate (Soft) Active Matter. Its design is modular, so that you can mix and match different forces, particles and fields.

The purpose of this package is twofold: on one hand it provides a convenient way to explore new active matter models by providing flexible construction of (types) of forces and particles (e.g. simple polar particles, or polymers). The exploration is facilated by an optional live plotting extension, leveraging GLMakie's efficient GPU plotting to render e.g. particle's positions, velocity vectors or polarties to quickly gauge what the system behaves like for different parameter values.

The second is to be performant to run production simulations for actual scientific analysis. The package has been through extensive profiling, is multi-threaded and easily runs on head-less clusters. Output is stored in the HDF5 format.


## Installation
In a Julia script or from the REPL run
```
using Pkg
Pkg.add(url="https://github.com/sanderkammeraat/FAMS.jl")
```

You can then use it in a Julia script or REPL by importing the package:

```using FAMS```

## Optional Live plotting
Finally, to make use of live plotting, add the import of GLMakie *after* the import of FAMS, this will automatically load the live plotting extension:
```
using FAMS
using GLMakie
```
This will precompile the optional live plotting extension and enables it.

### Example
See ```examples/ABPs.jl``` to see an example of how the live plotting looks like. It is a simulation of Active Brownian particles with self-alignment, so that the systems starts to flock in periodic boundary conditions.
Here is a video showing a small system of 1000 particles.


https://github.com/user-attachments/assets/75e125ed-0e5e-4379-89af-8dc8b0fced85






