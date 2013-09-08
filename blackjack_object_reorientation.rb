class Deck
  @card_value = {}
  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize
    @cards =[]
    @cards = deck.build_deck
  end

  def build_deck

    SUITS.each do |suit|
      VALUES.each do |value|
        @cards.push(Card.new(value + suit))
      end
    end
  end

  def shuffle
    @cards.shuffle
  end

  def pop
    @cards.pop
  end

  def sorted_deck
    @sorted_deck = @cards.sort
  end
end

class Card

@card_value = {}
SCORES = [10,10,10,10,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,0,0,0,0,
  10,10,10,10,10,10,10,10,10,10,10,10]

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def card_values
    @card_values = @sorted_deck.each_with_index {|suit,score|@card_value[suit] = SCORES[score]}
  end

  def value(card)
    @values = @card_values[card]
  end
end

class Hand

  def initialize
    @player_hand = []
    @dealer_hand = []
    @player_hand = 2.times {hit}
    @dealer_hand = 2.times {dealer_hand.hit}

  def hit(card, hand)
    hand << card
  end

  def stay(hand)

  end

  def score(hand, card)
    total = 0
    hand.each do |card|
      var = @value(card)
      if var == 0 && total < 11
        var = 11
      elsif var == 0 && total >= 11
        var = 1
      end
      total += var
    end
  total
  end

  def busted?
    score > 21
  end
end

class Game
  def initialize
    @deck = Deck.new
  end

  def deal_hand
    @deck.shuffle
    @player_hand = Hand.new
    @dealer_hand = Hand.new
  end
end
