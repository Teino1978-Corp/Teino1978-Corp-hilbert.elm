main : Element
main = collage 400 400 
         (map (move (50, 0) )( 
         (motif x red ) ++ (motif (t x) blue ) ++ (motif (t (t x)) green ) ++
         (motif (t (t (t x))) orange ) ))
        
-- build motif from path and color

motif : [(number, number)] -> Color -> [Form]
motif z color = [ traced (solid color) (path z) , move ( last z) (filled color (circle 3.0))]


-- ceci n'est pas un square

x : [(number, number)]
x = [  (-50,-50), (-50,50), (50,50), (50,-50) ]

-- some building block transformations

xflip : (number, number) -> (number, number)
xflip pt = ( -1*(fst pt), snd pt)

rot : (number, number) -> (number, number)
rot pt = ( -1*(snd pt), fst pt)

mul : number -> (number, number) -> (number, number)
mul a b = (a*(fst b), a*(snd b))

add : (number, number) -> (number, number) -> (number, number)
add a b = ((fst a)+(fst b), (snd a)+(snd b))

-- implementations of the symmetries of hilbert space curve

t1 : (number, number) -> (number, number)
t1 b = (add (mul 0.5 (-100,-100)) ((mul 0.5) (rot (rot(rot (xflip b))) )))

t2 : (number, number) -> (number, number)
t2 b = (add (mul 0.5 (-100,100)) ((mul 0.5) (b)))

t3 : (number, number) -> (number, number)
t3 b = (add (mul 0.5 (100,100)) ((mul 0.5) ( b)))

t4 : (number, number) -> (number, number)
t4 b = (add (mul 0.5 (100,-100)) ((mul 0.5) (rot (xflip b) )))

--

t : [(number, number)] -> [(number, number)]
t z = (map t1 z) ++ (map t2 z) ++ (map t3 z) ++ (map t4 z)