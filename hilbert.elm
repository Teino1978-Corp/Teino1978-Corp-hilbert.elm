main : Element
main = collage 200 420
         ( 
         map (move (0,  110) ) [redSquare ,  redCorner ] ++
         map (move (0, 0) ) (motif y blue ) ++
         map (move (0, -110) ) (motif y green )
         )

-- especially the last item sq is pretty good

redSquare  : Form
redSquare  = traced  (solid   red) (path x)
redCorner  = move         (last x) (filled red  (circle 5.0))

blueSquare : Form
blueSquare = traced  (dashed blue) (path (map t2 x))
blueCorner = move    (t2 (last x)) (filled blue (circle 5.0))

sq : ((number, number) -> (number, number)) -> [Form]
sq f = [ traced (dashed blue) (path (map f x)) , move (f (last x)) (filled blue (circle 5.0))]

motif : [(number, number)] -> Color -> [Form]
motif z color = [ traced (dashed color) (path z) , move ( last z) (filled color (circle 5.0))]


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
t1 b = (add (mul 0.667 (-50,-50)) ((mul 0.333) (rot (rot(rot (xflip b))) )))

t2 : (number, number) -> (number, number)
t2 b = (add (mul 0.667 (-50,50)) ((mul 0.333) (b)))

t3 : (number, number) -> (number, number)
t3 b = (add (mul 0.667 (50,50)) ((mul 0.333) ( b)))

t4 : (number, number) -> (number, number)
t4 b = (add (mul 0.667 (50,-50)) ((mul 0.333) (rot (xflip b) )))

--

y : [(number, number)]
y = (map t1 x) ++ (map t2 x) ++ (map t3 x) ++ (map t4 x)