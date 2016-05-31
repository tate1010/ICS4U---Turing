import spceship in "spaceship.tu"

var ship :^spceship
new ship

ship ->setCentre(200,200)
ship ->setHeight(20)
ship ->setWidth(30)
ship->setColour(Rand.Int(1,10))
ship->draw
loop
ship->slideTo(Rand.Int(1,400),Rand.Int(1,400))
end loop
