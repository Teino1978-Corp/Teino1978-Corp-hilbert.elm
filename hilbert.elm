main : Element
main = collage 200 420
         ( 
         map (move (0, -55) ) [ blueSquare , blueCorner ] ++
         map (move (0,  55) ) [  redSquare ,  redCorner ] ++
         map (move (0, -55) ) (sq t3)
         )

redSquare  : Form
redSquare  = traced  (solid   red) (path x)
redCorner  = move         (last x) (filled red  (circle 5.0))

blueSquare : Form
blueSquare = traced  (dashed blue) (path (map t2 x))
blueCorner = move    (t2 (last x)) (filled blue (circle 5.0))

sq : ((number, number) -> (number, number)) -> [Form]
sq f = [ traced (dashed blue) (path (map f x)) , move (f (last x)) (filled blue (circle 5.0))]


x : [(number, number)]
x = [  (-50,-50), (-50,50), (50,50), (50,-50) ]

xflip : (number, number) -> (number, number)
xflip pt = ( -1*(fst pt), snd pt)

mul : number -> (number, number) -> (number, number)
mul a b = (a*(fst b), a*(snd b))

add : (number, number) -> (number, number) -> (number, number)
add a b = ((fst a)+(fst b), (snd a)+(snd b))

t2 : (number, number) -> (number, number)
t2 b = (add (mul 0.667 (-50,50)) ((mul 0.333) (xflip b)))

t3 : (number, number) -> (number, number)
t3 b = (add (mul 0.667 (50,50)) ((mul 0.333) (xflip b)))