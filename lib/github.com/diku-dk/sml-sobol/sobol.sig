(* Quasi-random Sobol number generation. Ported from the Futhark Sobol
   sequence implementation.
 *)

signature SOBOL = sig

  type vecD = Word32.word array        (* Arrays of size D *)

  val D           : int
  val norm        : real
  val frac        : Word32.word -> real
  val independent : int -> vecD
  val recurrent   : int -> vecD -> vecD
end

(**

[D] The dimensionality of a sequence.

[norm] The real value `2.0**32`.

[frac w] turns the Word32.word value w into a real in the interval [0;1[

[independent i] returns the `i`'th sobol vector of size D.

[recurrent i v] returns the `i`'th sobol vector given `v` is the
`i-1`'th sobol vector.

*)
