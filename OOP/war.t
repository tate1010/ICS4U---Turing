import standardDeck in "stdDeck.tu", Deck in "Deck.tu", Card in "Card.tu"
var original : ^standardDeck
new original
var P1 : ^Deck
new P1
var P2 : ^Deck
new P2
var v1 : int
var v2 : int
var Cvalue : array 1 .. 13 of string := init ("A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K")
var ch : string (1)
var x1 : int := 50
var y1 : int := 200
var x2 : int := 350
var font : int
var temp : ^Card
font := Font.New ("serif:12")

original -> Decks -> shuffle



for : 1 .. 26
    P1 -> add (original -> Decks -> deal)
    P2 -> add (original -> Decks -> deal)

end for


loop
    P1 -> setCentres (50, 200)

    P2 -> setCentres (350, 200)

    var card1 : ^Card
    var card2 : ^Card
    new card1
    new card2
    exit when P1 -> isempty
    exit when P2 -> isempty
    Draw.FillBox (80, 230, 122, 170, black)
    Draw.FillBox (380, 230, 422, 170, black)
    Draw.Text (intstr (P1 -> count), 101, 200, font, white)
    Draw.Text (intstr (P2 -> count), 401, 200, font, white)
    x1 := 50
    y1 := 200
    x2 := 350


    %
    card1 := P1 -> deal
    card1 -> draw

    card2 := P2 -> deal

    card2 -> draw
    for a : 1 .. 13
	if card1 -> getCardValue = Cvalue (a) then

	    v1 := a
	end if
	if card2 -> getCardValue = Cvalue (a) then
	    v2 := a
	end if
    end for
    if v1 > v2 then
	put "Player  1 win with  ", Cvalue (v1), "  vs  ", Cvalue (v2)



	P1 -> add (card1)

	P1 -> add (card2)
	put "press any key to move on to the next step"
	loop
	    exit when hasch
	end loop


	getch (ch)
    elsif v2 > v1 then

	put "Player  2 win with  ", Cvalue (v2), "  vs  ", Cvalue (v1)


	P2 -> add (card1)

	P2 -> add (card2)

	put "press any key to move on to the next step"
	loop
	    exit when hasch
	end loop


	getch (ch)
    elsif v2 = v1 then
	x1 := 50
	y1 := 200
	x2 := 350
	var j : int := 0
	put "tie, flipping 4 more card"

	put "press any key to move on to the next step"

	loop
	    exit when hasch
	end loop

	getch (ch)
	var resolved : boolean := false
	loop

	    exit when resolved = true

	    var A1 := 0
	    var B1 := 0

	    new card1
	    new card2
	    %%%%%%%%%%%%%%%%%%%%%


	    for i : 1 .. 4
		card1 := P1 -> find (i + j)
		card2 := P2 -> find (i + j)
		x1 += 10
		y1 -= 10
		x2 += 10
		if P1 -> isempty ~= true then
		    card1 -> setCentre (x1, y1)
		    card1 -> draw
		else
		    exit
		end if
		if P2 -> isempty ~= true then
		    card2 -> setCentre (x2, y1)
		    card2 -> draw


		else
		    exit
		end if


		%%%%%

		delay (1000)


		for a : 1 .. 13
		    if card1 -> getCardValue = Cvalue (a) then

			%%   if a > A1 then
			A1 := a
			%%    end if
		    end if
		    if card2 -> getCardValue = Cvalue (a) then
			%%    if a > B1 then
			B1 := a
			%%     end if
		    end if
		end for

	    end for
	    if A1 > B1 then
		put "Player 1 win with ", Cvalue (A1)



		for : 1 .. 4
		    P1 -> add (P1 -> deal)
		    P1 -> add (P2 -> deal)
		end for
		resolved := true


		put "press any key to move on to the next step"
		loop
		    exit when hasch
		end loop
		delay (1500)
		getch (ch)
	    elsif B1 > A1 then
		put "Player 2 win with ", Cvalue (B1)



		for : 1 .. 4
		    P1 -> add (P1 -> deal)
		    P1 -> add (P2 -> deal)
		end for
		resolved := true
		put "press any key to move on to the next step"
		loop
		    exit when hasch
		end loop
		delay (1500)
		getch (ch)
	    else
		put "Player 1  ", Cvalue (A1)
		put "Player 2  ", Cvalue (B1)
		put "tie, flipping 4 more card"


		j += 4
		put "press any key to move on to the next step"
		loop
		    exit when hasch
		end loop
		getch (ch)

		%%%%%%%
	    end if
	    exit when resolved = true
	end loop

	%%
    end if


    cls ()
    x1 := 50
    y1 := 200
    x2 := 350
end loop
put "GAME OVER"
if P1 -> isempty then

    put "Player 2 win, player 1 is out of card"

elsif P2 -> isempty then
    put "Player 1 win, player 2 is out of card"
end if
