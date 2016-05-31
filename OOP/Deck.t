import Deck in "Deck.tu", Card in "Card.tu"
var Decks : ^Deck
new Decks


var NewCard : ^Card
new NewCard



NewCard -> setCardSize ("Small")
NewCard -> setCardSuit ("Spade")
NewCard -> setCardValue ("A")
Decks -> add (NewCard)



new NewCard
NewCard -> setCardSize ("Small")
NewCard -> setCardSuit ("Spade")
NewCard -> setCardValue ("2")
Decks -> add (NewCard)

Decks -> add (NewCard)
new NewCard
NewCard -> setCardSize ("Small")
NewCard -> setCardSuit ("Spade")
NewCard -> setCardValue ("3")

Decks -> addat (NewCard,2)


Decks->deal->draw
Decks->deal->draw
