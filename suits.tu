unit
class suits

    inherit MShapes in "MShape.tu"

    export getSuit, setSuit

    var suitss : string := "Spade"



    body procedure setHeight (ipHeight : int)
	iHeight := ipHeight
	iWidth := ipHeight * 4 div 5
    end setHeight
    body procedure setWidth (ipWidth : int)
	iWidth := ipWidth
	iHeight := ipWidth * 5 div 4

    end setWidth


    proc setSuit (suit : string)

	if suit = "Spade" then
	    suitss := "Spade"

	elsif suit = "Diamond" then
	    suitss := "Diamond"


	elsif suit = "Heart" then
	    suitss := "Heart"


	elsif suit = "Club" then
	    suitss := "Club"

	end if

    end setSuit
    
    function getSuit : string
    
    result suitss
    end getSuit
    
end suits
