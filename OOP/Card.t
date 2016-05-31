import Card in "Card.tu"
var Cards : ^Card
new Cards
var temp : int
put "press any key to exit program"
loop
    var useless : string (1)
    exit when hasch
    temp := Rand.Int (1, 4)
    if temp = 1 then
	Cards -> setCardSize ("Small")
    elsif temp = 2 then
	Cards -> setCardSize ("Large")
    elsif temp = 3 then
	Cards -> setCardSize ("Medium")
    elsif temp = 4 then
	Cards -> setCardSize ("Extra Large")
    end if
    Cards -> setCentre (Rand.Int (1, 400), Rand.Int (1, 400))
    temp := Rand.Int (1, 4)

    if temp = 1 then
	Cards -> setCardSuit ("Spade")
    elsif temp = 2 then
	Cards -> setCardSuit ("Club")
    elsif temp = 3 then
	Cards -> setCardSuit ("Heart")
    elsif temp = 4 then
	Cards -> setCardSuit ("Diamond")
    end if
    temp := Rand.Int (1, 13)
    if temp > 1 and temp < 10 then
	Cards -> setCardValue (intstr (temp))
    elsif temp = 1 then
	Cards -> setCardValue ("A")
    elsif temp = 10 then
	Cards -> setCardValue ("T")
    elsif temp = 11 then
	Cards -> setCardValue ("J")
    elsif temp = 12 then
	Cards -> setCardValue ("Q")
    elsif temp = 13 then
	Cards -> setCardValue ("K")


    end if

    Cards -> draw
    delay (1000)
end loop
