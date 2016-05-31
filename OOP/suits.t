import Diamond in "Diamond.tu", Heart in "Heart.tu", Spade in "Spade.tu", Club in "Club.tu"
var odiamond: ^Diamond
new odiamond
var oheart: ^Heart
new oheart

odiamond->setHeight(Rand.Int(50,200))
odiamond->setWidth(Rand.Int(50,200))
odiamond->setCentre(100,  100)
odiamond->setColour(Rand.Int(1,10))
odiamond->draw 
odiamond->slideTo(400,400)

