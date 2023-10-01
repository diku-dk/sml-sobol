(** Interface for Sobol direction vectors *)

signature SOBOL_DIR = sig
  val n : int
  val k : int
  val m : Word32.word Array2.array (* of size n times k *)
  val a : Word32.word Array.array  (* of size n *)
  val s : int Array.array          (* of size n *)
end

(**

[Discussion]

These constants and arrays are used for generating sobol
sequences. Different instantiations of this signature are available,
dependent on the dimensionality of the required sequence of Sobol
vectors.

*)
