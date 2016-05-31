unit
class Deck

    inherit shape in "Shape.tu"
    import Card in "Card.tu"
    export add, deleteCard, shuffle, getTop, isempty, drawEmpty, setTop, count, addat, deal, setCentres, getCard,find
    type CardContainerType :
	record
	    CurrentCardPtr : pointer to Card


	    NextCardContainerPtr : pointer to CardContainerType
	end record
    var TopOfDeck : pointer to CardContainerType := nil
    proc setTop (a : pointer to CardContainerType)
	TopOfDeck := a

    end setTop
    function count : int
	var cou : int := 1
	var current : ^CardContainerType
	new current
	current := TopOfDeck
	loop

	    exit when current = nil or current -> NextCardContainerPtr = nil

	    current := current -> NextCardContainerPtr
	    cou += 1
	end loop
	result cou
    end count

    proc addcard (current : ^CardContainerType, Cards : ^CardContainerType)
	if TopOfDeck = nil then
	    TopOfDeck := Cards


	elsif current -> NextCardContainerPtr = nil then
	    current -> NextCardContainerPtr := Cards

	else
	    addcard (current -> NextCardContainerPtr, Cards)

	end if
    end addcard

    proc setCentres (ipCentreX : int, ipCentreY : int)
	var currentcard : ^CardContainerType
	currentcard := TopOfDeck
	for : 1 .. count ()
	    currentcard -> CurrentCardPtr -> setCentre (ipCentreX, ipCentreY)
	    currentcard := currentcard -> NextCardContainerPtr
	end for
    end setCentres

    function find (x : int) : ^Card
	var currentcard : ^CardContainerType
	currentcard := TopOfDeck
	if x > 1 then
	    for :1 .. x - 1
		currentcard := currentcard -> NextCardContainerPtr

	    end for
	end if
	result currentcard -> CurrentCardPtr

    end find

    proc add (Cards : ^Card)
	var CardToAdd : ^CardContainerType
	new CardToAdd
	CardToAdd -> CurrentCardPtr := Cards
	CardToAdd -> NextCardContainerPtr := nil
	addcard (TopOfDeck, CardToAdd)

    end add

    proc addat (Card : ^Card, pos : int)
	var CardToAdd : ^CardContainerType
	new CardToAdd
	CardToAdd -> CurrentCardPtr := Card
	CardToAdd -> NextCardContainerPtr := nil
	var currentCard : ^CardContainerType

	currentCard := TopOfDeck
	var c : int := 0
	if pos > count () then


	    add (Card)
	    return
	end if

	loop

	    c += 1
	    if pos = 0 then
		CardToAdd -> NextCardContainerPtr := TopOfDeck
		setTop (CardToAdd)
		exit
	    else


		if c = pos then

		    CardToAdd -> NextCardContainerPtr := currentCard -> NextCardContainerPtr
		    currentCard -> NextCardContainerPtr := CardToAdd
		    exit
		end if
	    end if

	    currentCard := currentCard -> NextCardContainerPtr
	end loop

    end addat

    proc deleteCard (num : int)
	var current : ^CardContainerType := TopOfDeck
	for i : 1 .. num - 2

	    current := current -> NextCardContainerPtr
	end for
	current -> NextCardContainerPtr := current -> NextCardContainerPtr -> NextCardContainerPtr
    end deleteCard
    function getTop : ^Card

	result TopOfDeck -> CurrentCardPtr
    end getTop
    function isempty : boolean

	if TopOfDeck = nil then
	    result true


	else
	    result false
	end if
    end isempty

    function deal : ^Card
	var temp : ^Card
	new temp

	temp := TopOfDeck -> CurrentCardPtr
	TopOfDeck := TopOfDeck -> NextCardContainerPtr

	result temp



    end deal


    function getCard : ^Card
	var temp : ^Card
	new temp

	temp := TopOfDeck -> CurrentCardPtr


	result temp
    end getCard
    proc shuffle
	for a : 1 .. 1000

	    var temp : ^Card
	    new temp

	    %
	    % var num : int := count()-1
	    %
	    %
	    % var current : ^CardContainerType := TopOfDeck
	    %
	    % for i : 1 .. num - 2
	    %
	    %     current := current -> NextCardContainerPtr
	    % end for
	    % var temp : ^CardContainerType := current -> NextCardContainerPtr
	    % current -> NextCardContainerPtr := current -> NextCardContainerPtr -> NextCardContainerPtr
	    % temp -> NextCardContainerPtr := TopOfDeck
	    % TopOfDeck := temp
	    var x : int := Rand.Int (1, count ())

	    temp := TopOfDeck -> CurrentCardPtr

	    setTop (TopOfDeck -> NextCardContainerPtr)
	    addat (temp, x)
	end for

    end shuffle

    proc drawEmpty


	var x : int := iHeight * 7 div 20
	var y : int := iHeight div 2
	var height : int := iHeight * 100 div 400
	Draw.Box (iCentreX - x, iCentreY - y, iCentreX + x, iCentreY + y, black)




    end drawEmpty





end Deck
