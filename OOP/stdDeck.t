import standardDeck in "stdDeck.tu" , Card in "Card.tu"
var p1: ^standardDeck
new p1
put p1 -> Decks ->isempty
p1 ->Decks ->shuffle



 p1->Decks->deal ->draw

delay(500)
 p1->Decks->deal ->draw

delay(500)
 p1->Decks->deal ->draw

delay(500)
 p1->Decks->deal ->draw
