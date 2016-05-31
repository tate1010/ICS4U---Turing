unit
class Card
    inherit shape in "Shape.tu"
    import Diamond in "Diamond.tu", Heart in "Heart.tu", Spade in "Spade.tu", Club in "Club.tu", suits in "suits.tu"
    export setCardValue, setCardSize, setCardSuit, getCardValue
    var CardValue : string := "A"
    %%   var CardHeight : int := 60
    %%  var CardSize : string := "Small"

    var suitss : string := "Spade"
    var font : int
    var down : boolean := false

    %%%%%%%



    function getCardValue : string
	result CardValue

    end getCardValue

    proc setCardValue (value : string)
	CardValue := value
    end setCardValue
    proc setCardSize (value : string)
	if value = "Small" then
	    setHeight (60)

	    font := Font.New ("serif:12")
	elsif value = "Medium" then
	    setHeight (80)
	    font := Font.New ("serif:16")
	elsif value = "Large" then
	    setHeight (100)
	    font := Font.New ("serif:20")
	elsif value = "Extra Large" then
	    setHeight (120)
	    font := Font.New ("serif:24")
	end if
    end setCardSize
    proc setCardSuit (suit : string)

	if suit = "Spade" then
	    suitss := "Spade"

	elsif suit = "Diamond" then
	    suitss := "Diamond"


	elsif suit = "Heart" then
	    suitss := "Heart"


	elsif suit = "Club" then
	    suitss := "Club"

	end if

    end setCardSuit
    body proc draw
	if down = false then
	    var diamond : ^Diamond
	    var heart : ^Heart
	    var club : ^Club
	    var spade : ^Spade
	    new diamond
	    new heart
	    new spade
	    new club


	    var x : int := iHeight * 7 div 20
	    var y : int := iHeight div 2
	    var height : int := iHeight * 100 div 400
	    Draw.FillBox (iCentreX - x, iCentreY - y, iCentreX + x, iCentreY + y, white)
	    Draw.Box (iCentreX - x, iCentreY - y, iCentreX + x, iCentreY + y, black)

	    if suitss = "Spade" then
		spade -> setCentre (iCentreX, iCentreY)
		spade -> setHeight (height)
		spade -> setWidth (height)
		spade -> setColour (black)
		spade -> draw

	    elsif suitss = "Diamond" then
		diamond -> setCentre (iCentreX, iCentreY)
		diamond -> setHeight (height)
		diamond -> setWidth (height)
		diamond -> setColour (red)
		diamond -> draw

	    elsif suitss = "Heart" then

		heart -> setCentre (iCentreX, iCentreY)
		heart -> setHeight (height)
		heart -> setWidth (height)
		heart -> setColour (red)
		heart -> draw
	    elsif suitss = "Club" then
		club -> setCentre (iCentreX, iCentreY)
		club -> setHeight (height)
		club -> setWidth (height)
		club -> setColour (black)
		club -> draw
	    end if

	    Draw.Text (CardValue, iCentreX - x, iCentreY + y - (iHeight div 6), font, black)
	    Draw.Text (CardValue, iCentreX + x - (iHeight div 6), iCentreY - y, font, black)

	elsif down = true then

	    var x : int := iHeight * 7 div 20
	    var y : int := iHeight div 2
	    Draw.FillBox (iCentreX - x, iCentreY - y, iCentreX + x, iCentreY + y, black)

	end if
    end draw

    body proc erase
	var x : int := iHeight * 7 div 20
	var y : int := iHeight div 2

	Draw.FillBox (iCentreX - x, iCentreY - y, iCentreX + x, iCentreY + y, white)

    end erase
end Card
