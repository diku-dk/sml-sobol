# sml-sobol [![CI](https://github.com/diku-dk/sml-sobol/workflows/CI/badge.svg)](https://github.com/diku-dk/sml-sobol/actions)

Standard ML package for generating Sobol sequences.

This library is a convenient and modular library for efficiently
generating large quantities of quasi-random numbers (in multiple
dimensions) in a parallel and purely functional setting. Sobol numbers
are particularly useful for Monte Carlo simulations, which are a core
application of massive parallelism.

Sobol sequences are quasi-random low-discrepancy sequences frequently
used in Monte-Carlo algorithms and they generalize nicely to multiple
dimensions. Sobol sequences are superior to traditional pseudo-random
numbers for numeric integration (by Monte-Carlo simulation). Sobol
sequences simply span the space much better than their pseudo-random
counterparts. In fact, it has been shown that while the value of a
multi-dimensional integral for a continuous and differentiable
function can be approximated with a convergence rate of _1/n_ using
pseudo-random numbers, using Sobol sequences, the convergence rate is
_1/sqrt(n)_.

For a discussion of the implementation, please consult [1].



## Overview of MLB files

- `lib/github.com/diku-dk/sml-sobol/sobol.mlb`:

  - **signature** [`SOBOL_DIR`](lib/github.com/diku-dk/sml-sobol/sobol_dir.sig)
  - **structure** `SobolDir50` :> `SOBOL_DIR`
  - **signature** [`SOBOL`](lib/github.com/diku-dk/sml-sobol/sobol.sig)
  - **functor** `Sobol (sig val D : int structure SobolDir : SOBOL_DIR end) :> SOBOL`

## Installing the package

This library is set up to work well with the SML package manager
[smlpkg](https://github.com/diku-dk/smlpkg).  To use the package, in
the root of your project directory, execute the command:

```
$ smlpkg add github.com/diku-dk/sml-sobol
```

This command will add a _requirement_ (a line) to the `sml.pkg` file in your
project directory (and create the file, if there is no file `sml.pkg`
already).

To download the library into the directory
`lib/github.com/diku-dk/sml-sobol`, execute the command:

```
$ smlpkg sync
```

You can now reference the `mlb`-file using relative paths from within
your project's `mlb`-files.

Notice that you can choose either to treat the downloaded package as
part of your own project sources (vendoring) or you can add the
`sml.pkg` file to your project sources and make the `smlpkg sync`
command part of your build process.

## Using the package

See the files
[sobol-test.mlb](lib/githu.com/diku-dk/sml-sobol/test/sobol-test.mlb)
and
[sobol-test.sml](lib/githu.com/diku-dk/sml-sobol/test/sobol-test.sml)
for a demonstration of how to use the package.

## Authors

Copyright (c) 2015-2021 Martin Elsman, Troels Henriksen, University of
Copenhagen, DIKU. Partly ported from the [Futhark Sobol library](https://github.com/diku-dk/sobol).

## References

[1] Troels Henriksen, Martin Elsman, and Cosmin E. Oancea. __Modular
Acceleration: Tricky Cases of Functional High-Performance
Computing__. In _Proceedings of the 6th ACM SIGPLAN workshop on
Functional High-Performance Computing (FHPC ‘18)_. St. Louis, Missouri,
USA. September 2018.
