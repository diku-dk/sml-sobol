
local
structure Sobol = Sobol(val D = 2
                        structure SobolDir = SobolDir50)

fun for (lo,hi) (f:int->unit) : unit =
    let fun loop i =
            if i >= hi then ()
            else (f i; loop (i+1))
    in loop lo
    end

type image = {height:int, width:int, data: RealArray.array}

val height = 768
val width = 1024

fun linterp (a,b,f) = (1.0-f)*a + f*b

type pixel = int * int * int

fun realToPixel (r:real) : pixel =
    let val i = floor(linterp(255.0,0.0,r))
    in (i,i,i)
    end

fun image2ppm out ({data, height, width}: image) =
    let fun onPixel ((r,g,b):pixel) =
            TextIO.output(out,
                          Int.toString r ^ " " ^
                          Int.toString g ^ " " ^
                          Int.toString b ^ "\n")
    in TextIO.output(out,
                     "P3\n" ^
                     Int.toString width ^ " " ^ Int.toString height ^ "\n" ^
                     "255\n")
       before RealArray.app (onPixel o realToPixel) data
    end

fun cross (x,y) =
    [(x-5,y),(x-4,y),(x-3,y),(x-2,y),(x-1,y),(x,y),(x+1,y),(x+2,y),(x+3,y),(x+4,y),(x+5,y),
     (x,y-5),(x,y-4),(x,y-3),(x,y-2),(x,y-1),(x,y+1),(x,y+2),(x,y+3),(x,y+4),(x,y+5)]

fun process args (f,N) =
    case args of
        "-f" :: f :: rest => process rest (f,N)
      | "-N" :: s :: rest => process rest (f,case Int.fromString s of
                                                 SOME N => N
                                               | NONE => raise Fail "expecting number")
      | nil => (f,N)
      | _ => raise Fail "expecting '-f file' or '-N num'."

val (f,N) = process (CommandLine.arguments()) ("",100)

val img =
    let val data = RealArray.tabulate (height*width,fn _ => 0.0)
        val () = for (0,N) (fn i =>
                               let val v = Sobol.independent i
                                   val x = Sobol.frac(Array.sub(v,0))
                                   val y = Sobol.frac(Array.sub(v,1))
                                   val x = round(linterp(0.0,real(width-1),x))
                                   val y = round(linterp(0.0,real(height-1),y))
                                   fun upd (x,y) =
                                       if x < 0 orelse x > width - 1 orelse y < 0 orelse y > height - 1 then ()
                                       else RealArray.update(data,
                                                             y*width+x,
                                                             1.0)
                               in List.app upd (cross (x,y))
                               end)
    in {width  = width,
        height = height,
        data = data }
    end

in
val _ = if f <> "" then
          let val out = TextIO.openOut f
          in print ("Writing image to " ^ f ^ ".\n")
             before image2ppm out img
             before TextIO.closeOut out
          end
        else print ("-f not passed, so not writing image to file.\n")
end
