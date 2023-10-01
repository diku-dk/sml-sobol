(* Ported version of an auto-generated file!

   Based on the Joe and Kuo sets of initial direction numbers; see
   http://web.maths.unsw.edu.au/~fkuo/sobol/

   Ported from a generated file created using the sobol_conv tool
   available from https://github.com/diku-dk/sobol-futhark
 *)

(** SigDoc *)
structure SobolDir50 : SOBOL_DIR = struct

val n : int = 50
val k : int = 8

val m : Word32.word Array2.array =
    Array2.fromList
    [[0w1, 0w0, 0w0, 0w0, 0w0, 0w0, 0w0, 0w0],
     [0w1, 0w3, 0w0, 0w0, 0w0, 0w0, 0w0, 0w0],
     [0w1, 0w3, 0w1, 0w0, 0w0, 0w0, 0w0, 0w0],
     [0w1, 0w1, 0w1, 0w0, 0w0, 0w0, 0w0, 0w0],
     [0w1, 0w1, 0w3, 0w3, 0w0, 0w0, 0w0, 0w0],
     [0w1, 0w3, 0w5, 0w13, 0w0, 0w0, 0w0, 0w0],
     [0w1, 0w1, 0w5, 0w5, 0w17, 0w0, 0w0, 0w0],
     [0w1, 0w1, 0w5, 0w5, 0w5, 0w0, 0w0, 0w0],
     [0w1, 0w1, 0w7, 0w11, 0w19, 0w0, 0w0, 0w0],
     [0w1, 0w1, 0w5, 0w1, 0w1, 0w0, 0w0, 0w0],
     [0w1, 0w1, 0w1, 0w3, 0w11, 0w0, 0w0, 0w0],
     [0w1, 0w3, 0w5, 0w5, 0w31, 0w0, 0w0, 0w0],
     [0w1, 0w3, 0w3, 0w9, 0w7, 0w49, 0w0, 0w0],
     [0w1, 0w1, 0w1, 0w15, 0w21, 0w21, 0w0, 0w0],
     [0w1, 0w3, 0w1, 0w13, 0w27, 0w49, 0w0, 0w0],
     [0w1, 0w1, 0w1, 0w15, 0w7, 0w5, 0w0, 0w0],
     [0w1, 0w3, 0w1, 0w15, 0w13, 0w25, 0w0, 0w0],
     [0w1, 0w1, 0w5, 0w5, 0w19, 0w61, 0w0, 0w0],
     [0w1, 0w3, 0w7, 0w11, 0w23, 0w15, 0w103, 0w0],
     [0w1, 0w3, 0w7, 0w13, 0w13, 0w15, 0w69, 0w0],
     [0w1, 0w1, 0w3, 0w13, 0w7, 0w35, 0w63, 0w0],
     [0w1, 0w3, 0w5, 0w9, 0w1, 0w25, 0w53, 0w0],
     [0w1, 0w3, 0w1, 0w13, 0w9, 0w35, 0w107, 0w0],
     [0w1, 0w3, 0w1, 0w5, 0w27, 0w61, 0w31, 0w0],
     [0w1, 0w1, 0w5, 0w11, 0w19, 0w41, 0w61, 0w0],
     [0w1, 0w3, 0w5, 0w3, 0w3, 0w13, 0w69, 0w0],
     [0w1, 0w1, 0w7, 0w13, 0w1, 0w19, 0w1, 0w0],
     [0w1, 0w3, 0w7, 0w5, 0w13, 0w19, 0w59, 0w0],
     [0w1, 0w1, 0w3, 0w9, 0w25, 0w29, 0w41, 0w0],
     [0w1, 0w3, 0w5, 0w13, 0w23, 0w1, 0w55, 0w0],
     [0w1, 0w3, 0w7, 0w3, 0w13, 0w59, 0w17, 0w0],
     [0w1, 0w3, 0w1, 0w3, 0w5, 0w53, 0w69, 0w0],
     [0w1, 0w1, 0w5, 0w5, 0w23, 0w33, 0w13, 0w0],
     [0w1, 0w1, 0w7, 0w7, 0w1, 0w61, 0w123, 0w0],
     [0w1, 0w1, 0w7, 0w9, 0w13, 0w61, 0w49, 0w0],
     [0w1, 0w3, 0w3, 0w5, 0w3, 0w55, 0w33, 0w0],
     [0w1, 0w3, 0w1, 0w15, 0w31, 0w13, 0w49, 0w245],
     [0w1, 0w3, 0w5, 0w15, 0w31, 0w59, 0w63, 0w97],
     [0w1, 0w3, 0w1, 0w11, 0w11, 0w11, 0w77, 0w249],
     [0w1, 0w3, 0w1, 0w11, 0w27, 0w43, 0w71, 0w9],
     [0w1, 0w1, 0w7, 0w15, 0w21, 0w11, 0w81, 0w45],
     [0w1, 0w3, 0w7, 0w3, 0w25, 0w31, 0w65, 0w79],
     [0w1, 0w3, 0w1, 0w1, 0w19, 0w11, 0w3, 0w205],
     [0w1, 0w1, 0w5, 0w9, 0w19, 0w21, 0w29, 0w157],
     [0w1, 0w3, 0w7, 0w11, 0w1, 0w33, 0w89, 0w185],
     [0w1, 0w3, 0w3, 0w3, 0w15, 0w9, 0w79, 0w71],
     [0w1, 0w3, 0w7, 0w11, 0w15, 0w39, 0w119, 0w27],
     [0w1, 0w1, 0w3, 0w1, 0w11, 0w31, 0w97, 0w225],
     [0w1, 0w1, 0w1, 0w3, 0w23, 0w43, 0w57, 0w177],
     [0w1, 0w3, 0w7, 0w7, 0w17, 0w17, 0w37, 0w71]]

val a : Word32.word array =
    Array.fromList
    [0w0, 0w1, 0w1, 0w2, 0w1, 0w4, 0w2, 0w4, 0w7, 0w11, 0w13, 0w14,
     0w1, 0w13, 0w16, 0w19, 0w22, 0w25, 0w1, 0w4, 0w7, 0w8, 0w14,
     0w19, 0w21, 0w28, 0w31, 0w32, 0w37, 0w41, 0w42, 0w50, 0w55, 0w56,
     0w59, 0w62, 0w14, 0w21, 0w22, 0w38, 0w47, 0w49, 0w50, 0w52, 0w56,
     0w67, 0w70, 0w84, 0w97, 0w103]

val s : int array =
    Array.fromList
    [1, 2, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7,
     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8,
     8, 8, 8, 8, 8, 8]

end
