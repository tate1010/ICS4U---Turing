import die in "Die.tu"
var D:^die
new D
var sum :int  := 0

for i :1..3
D ->roll
D-> setCentre(Rand.Int(1,600),Rand.Int(1,400))
D-> draw
sum += D->getValue

end for 
put sum
