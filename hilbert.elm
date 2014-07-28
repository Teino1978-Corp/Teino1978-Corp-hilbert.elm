main : Element
main = collage 200 420
         ( 
         map (move (0, -55) ) [ blueSquare , blueCorner ] ++
         map (move (0,  55) ) [  redSquare ,  redCorner ] 
         )

blueSquare : Form
blueSquare = traced (dashed blue) (path y)

redSquare : Form
redSquare = traced (solid red) (path x)

redCorner  = move        (last x)  (filled red  (circle 5.0))
blueCorner = move    (t2 (last x)) (filled blue (circle 5.0))


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

y : [(number, number)]
y = map ( t2 ) x