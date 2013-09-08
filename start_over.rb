class Deck

  def initialize
    @deck = deck.build_deck
  end

  def sorted_deck
    @sorted_deck = @deck.sort
  end

  def build_deck
  deck = []

  SUITS.each do |suit|
    VALUES.each do |value|
      deck.push(value + suit)
    end
  end

  deck.shuffle
end

  def pop
  end
end

class Card

  def initialize

  end
end

class Hand

  def initialize(dealer_hand, player_hand)
    dealer_hand = []
    player_hand = []
    @dealer_hand = dealer_hand
    @player_hand = player_hand
  end
  def hit(card)
  end

  def stay
    break
  end

  end

  def score
  end

  def busted?
    if @dealer_hand && score > 21
      "Dealer busts, You win!"
    elsif @


  end
end
