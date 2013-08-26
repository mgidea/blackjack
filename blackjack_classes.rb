class Deck
 
SUITS = ['♠', '♣', '♥', '♦']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
scores = [10,10,10,10,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,0,0,0,0,10,10,10,10,10,
  10,10,10,10,10,10,10]
 
  def build_deck
    @deck = []
 
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck.push(value + suit)
      end
    end
 
    @deck.shuffle
  end
 
  def pop
    @deck.pop
  end
end
 
class Card
end
 
class Hand
  def hit(card)
  end
 
  def stay
  end
 
  def score
  end
 
  def busted?
  end
end