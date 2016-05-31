import standardDeck in "stdDeck.tu", Deck in "Deck.tu", Card in "Card.tu"
var p1 : ^standardDeck
new p1
var p2 : ^standardDeck
new p2

var p3 : ^standardDeck
new p3


%%p1 -> Decks -> shuffle


p3 -> Decks -> shuffle

p2 -> Decks -> setCentres (600, 200)
p2 -> Decks -> deal -> draw
p3 -> Decks -> setCentres (400, 200)
p3 -> Decks -> deal -> draw
put "Press any buttom to go through Deck 1"
loop
    exit when hasch
end loop

for : 1 .. 51
    p2 -> Decks -> deal -> draw
    put p2-> Decks->count
    delay (500)


end for

put "Press any buttom to go through Deck 2"

loop
    exit when hasch
end loop

for : 1 .. 51
    p3 -> Decks -> deal -> draw
    delay (500)


end for
