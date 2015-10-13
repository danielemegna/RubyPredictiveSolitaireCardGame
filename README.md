# Ruby Predictive Solitaire Card Game

### Was summer ..
**A little story (you can skip it!)**
Was August, 2015 and I was in [Calabria](https://en.wikipedia.org/wiki/Calabria), relaxing and preparing my new season as *eager-to-learn-young-programmer*. Was late evening, maybe 11:30 PM, and I was in a little bar in [Guardavalle](https://en.wikipedia.org/wiki/Guardavalle), where my Mum, my Grandma, my Grandfa, my Uncles.... and a lot of my parents was born :) I wasn't yet tired to go sleep, and I wanted to spend some other minutes there. With me there was on my table a deck of cards, [italian suite](https://en.wikipedia.org/wiki/Playing_card#Italian_suits) of course.

Thinking about card games, a strange old solitaire game cames to my mind. In some terms a *stupid* solitaire game. Indeed, in this game, there is no ability. You don't need a lot attenction, you don't need to be very awake. Everything in this game is **predictive** and everything depends on the inital position of cards. Even a kid could do it. It is made just for spending time.

Afther a few games with these premises, I relized that, given the initial position of the cards and an appropiate algorithm, we can predice the game outcome in a flash. It's a function! *f(cards) -> boolean outcome*. Maybe I could try to do this as a Kata.. why not. Maybe in Ruby, a programming language I don't know how I'd like to know. I'll do it in the next days during my spare times!

That's it.

### The Game
The solitaire is very simple.

1. Shuffle the deck of cards
2. Hold it face covered with your hands
3. Pick the first **two cards** together and put them face uncovered on the table one above the other
4. Check if the card you can see *is useful* (you will see only a card)
  * If it is, collect it apart and check also the card behind it that you can see now, returning to the 4th step
  * If it is not, pick the next two cards, put them above the cards already on the table and return to 3rd step
5. When the deck is finished, restart the deck from the beginning

##### What do you mean with *useful*?
At the beginning, only Aces are useful. When you'll collected an Ace, you can collect the 2 of the same seed. When you'll collected a 2, you can collect the 3 of the same seed. And so on ....

The target is to collect the 4 seed deck sorted.

##### When I'll lose?
When you recognize that there aren't useful cards in the available positions. If you slide the entire deck without collecting any cards, you lose for sure.

##### When I'll win?
When you have no cards to collect yet :)
