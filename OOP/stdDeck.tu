unit class standardDeck
inherit Deck in "Deck.tu"
import Card in "Card.tu"
export Decks
var Decks:^Deck
new Decks
for s : 1 .. 4
    for c : 1 .. 13
	var NewCard : ^Card
	new NewCard
	if s = 1 then
	    NewCard  -> setCardSuit ("Spade")
	elsif s = 2 then
	    NewCard -> setCardSuit ("Club")
	elsif s = 3 then
	    NewCard -> setCardSuit ("Heart")
	elsif s = 4 then
	    NewCard -> setCardSuit ("Diamond")
	end if
	if c > 1 and c < 10 then
	    NewCard ->setCardValue (intstr (c))
	elsif c = 1 then
	    NewCard-> setCardValue ("A")
	elsif c = 10 then
	    NewCard-> setCardValue ("T")
	elsif c = 11 then
	    NewCard -> setCardValue ("J")
	elsif c = 12 then
	    NewCard-> setCardValue ("Q")
	elsif c = 13 then
	    NewCard-> setCardValue ("K")


	end if


	NewCard -> setCardSize ("Small")


	Decks -> add (NewCard)

    end for

end for

end standardDeck
