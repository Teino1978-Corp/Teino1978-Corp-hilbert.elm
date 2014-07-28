main : Element
main = collage 200 420
         ( 
         map (move (0, -55) ) [ blueSquare , blueCorner ] ++
         map (move (0, 55) )  [ redSquare  , redCorner ] 
         )

blueSquare : Form
blueSquare = traced (dashed blue) square

redSquare : Form
redSquare = traced (solid red) square

redCorner  = move (50,-50) (filled red  (circle 5.0))
blueCorner = move (50,-50) (filled blue (circle 5.0))

square : Path
square = path [  (-50,-50), (-50,50), (50,50), (50,-50) ]