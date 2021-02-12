(* Interface for Sobol direction vectors *)

signature SOBOL_DIR = sig
  val n : int
  val k : int
  val m : Word32.word Array2.array (* of size n times k *)
  val a : Word32.word Array.array  (* of size n *)
  val s : int Array.array          (* of size n *)
end
