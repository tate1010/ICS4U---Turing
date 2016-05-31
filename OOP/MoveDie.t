import die in "Die.tu"
var D:^die
new D
var sum :int  := 0
type dies :
record 
 x : int
 y : int 
 colours : int 
 value : int


end record

var dice : array 1..10 of dies
for i :1..10
D ->roll
D ->setSize(20)
D-> setCentre(250,30*i)
D -> setColour(Rand.Int(1,2))
D -> draw
dice(i).x := 250
dice(i).y := 30*i
dice(i).colours := D->getColour
dice(i).value :=  D->getValue

end for 

var button :string(1)
getch(button )

for i :1..10
if dice(i).colours = 1 then 
D ->setValue(dice(i).value)
D ->setColour(dice(i).colours)
D -> setCentre(250,30*i)
D -> slideTo(100,30*i)

elsif dice(i).colours = 2 then 
D ->setValue(dice(i).value)
D ->setColour(dice(i).colours)
D -> setCentre(250,30*i)
D -> slideTo(400,30*i)

end if
end for 



