(* Quasi-random Sobol number generation. Ported from the Futhark Sobol
   sequence implementation.
 *)

functor Sobol (val D : int
               structure SobolDir : SOBOL_DIR) : SOBOL =
struct
  structure DM = SobolDir
  val D = D
  type vecD = Word32.word array        (* Arrays of size D *)

  (* Compute direction vectors. In general, some work can be saved if
     we know the number of sobol numbers (N) up front. Here, however,
     we calculate sufficiently sized direction vectors to work with
     upto N = 2^L, where L=32 (i.e., the maximum number of bits
     needed).
  *)

  type word = Word32.word
  val op << = Word32.<< infix <<
  val op >> = Word32.>> infix >>
  val op ^ = Word32.xorb
  val op & = Word32.andb infix &
  fun iota n = List.tabulate (n, fn i => i)

  val L : int = 32

  (* direction vector for dimension j *)
  fun dirvec (j:int) : word array =   (* sz L *)
    if j = 0 then
      Array.fromList(map (fn i => 0w1 << (Word.fromInt L - Word.fromInt (i+1))) (iota L))
    else
       let val s = Array.sub(DM.s, j-1)
           val a = Array.sub(DM.a, j-1)
           val V = map (fn i => if i >= s then 0w0
                                else Array2.sub(DM.m, j-1, i) <<
                                               (Word.fromInt L - Word.fromInt(i+1))
                       ) (iota L)
           val V = Array.fromList V
           fun loop i' =
               if i' < L-s then
                 let val i = i' + s
                     val v = Array.sub(V,i-s)
                     val vi0 = v ^ (v >> (Word.fromInt s))
                     fun loop2 (k',vi) =
                         if k' < s - 1 then
                           let val k = k' + 1
                           in loop2 (k, vi ^ (((a >> Word.fromInt(s-1-k)) & 0w1)
                                              * Array.sub(V,i-k)))
                           end
                         else vi
                     val vi = loop2 (0,vi0)
                 in Array.update(V,i,vi)
                  ; loop (i' + 1)
                 end
               else ()
       in loop 0
        ; V
       end

  fun index_of_least_significant_0 (x:int) : int =
      let fun loop i =
              if i < 32 andalso ((Word32.fromInt x >> Word.fromInt i) & 0w1) <> 0w0
              then loop (i+1)
              else i
      in loop 0
      end

  fun pow2 0 = 1.0
    | pow2 n = 2.0 * pow2 (n-1)

  val norm = pow2 L

  fun frac (x:Word32.word) : real =  (* real(Word64.toLargeInt(Word32.toLarge x)) / Sobol.norm ; raises Overflow with MLton *)
      let val x' = Word32.>>(x,0w2)
          val y = Word32.andb(x,0w3)
      in (real (Word32.toInt y) + 4.0*real(Word32.toInt x'))
         / norm
      end

  fun grayCode (x: int): int =
      Word32.toInt((Word32.fromInt x >> 0w1) ^ (Word32.fromInt x))

  fun testBit (n: int) (ind:int) : bool =
      let val t = (0w1 << Word.fromInt ind)
      in (Word32.fromInt n & t) = t
      end

  val dirvecs : word array array =
      Array.tabulate(D,dirvec)

  fun recSob (i:int) (dirvec:word array) (x:word) : word =
      x ^ Array.sub(dirvec, index_of_least_significant_0 i)

  fun mapai (f:int*'a -> 'b) (a: 'a array) : 'b array =
      Array.tabulate(Array.length a, fn i => f (i,Array.sub(a,i)))

  fun mapa f a = mapai (fn (_,x) => f x) a

  fun mapa2 f a1 a2 =
      if Array.length a1 <> Array.length a2 then raise Fail "Sobol.mapa2"
      else mapai (fn (i,v) => f v (Array.sub(a2,i))) a1

  fun recurrent (i:int) (xs:vecD) : vecD =
      mapa2 (recSob (i-1)) dirvecs xs

  fun indSob (n:int) (dirvec:word array) : word =
      let val reldv_vals =
              mapai (fn (i,d) => if testBit (grayCode n) i then d
                                 else 0w0) dirvec
      in Array.foldl (op ^) 0w0 reldv_vals
      end

  fun independent (i:int) : vecD =
      mapa (indSob i) dirvecs

end
