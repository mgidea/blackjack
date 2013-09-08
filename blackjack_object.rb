class Deck

SUITS = ['♠', '♣', '♥', '♦']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize
    build_deck
    shuffle
  end

  def build_deck
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        card = value + suit
        @cards.push(Card.new(value, suit, card))

      end
    end
  end

  def pop
    @cards.pop
  end

  def shuffle
    @cards.shuffle!
  end
end

class Card
  attr_reader :suit, :value, :card

  def initialize(value, suit, card)
    @suit = suit
    @value = value
    @card = card
  end

  def num_value
    if value == "A"
      1
    elsif /[KQJ]/.match(value)
      10
    else
      value.to_i
    end
  end

end


class Hand
  attr_reader :name, :cards

  def initialize(name)
     @cards = []
     @name = name
  end

  def hit(card)
    @cards << card
    @cards
  end

  def stay

  end

  def score
    total = 0
    @cards.each do |card|
      if card.value == 1 && total > 10
        card.calue == 11
      end
      total += card.num_value
    end
    total
  end

  def busted?(player)
    player.score > 21
  end
end

class Game

  def initialize
    @deck = Deck.new
    deal
  end

  def deal
    @dealer_hand = Hand.new("dealer")
    @player_hand = Hand.new("player")
    2.times {@player_hand.hit(@deck.pop)}
    2.times {@dealer_hand.hit(@deck.pop)}
    puts "Welcome to Blackjack!"
    puts
    puts "Player was dealt #{@player_hand.cards[0].card} and #{@player_hand.cards[1].card}"
    puts "Player's score is #{@player_hand.score}"
    puts "Hit or stand (H/S): "
    input = gets.chomp
    while input.downcase == "h"
      @player_hand.hit(@deck.pop)
      puts "Player was dealt #{@player_hand.cards[-1].card}"
      puts "Player score: #{@player_hand.score}"
      if @player_hand.busted?(@player_hand)
        puts "Bust! You lose..."
        break
      end
    input = gets.chomp
    end
    if input.downcase == "s"
      puts
      puts "Player score: #{@player_hand.score}"
      puts
      puts
      puts  "Dealer was dealt #{@dealer_hand.cards[0].card} and #{@dealer_hand.cards[1].card}"
      puts  "Dealer score: #{@dealer_hand.score}"
      puts
      if @dealer_hand.score >= 17
        puts
        puts "Dealer stands"
        puts
        if @player_hand.score == @dealer_hand.score
          puts "The game ends in a tie"
        elsif @player_hand.score < @dealer_hand.score
          puts "Sorry, the dealer wins"
        else
          puts "Congratulations, you win!"
        end
      end
      while @dealer_hand.score < 17
        @dealer_hand.hit(@deck.pop)
        puts "Dealer was dealt #{@dealer_hand.cards[-1].card}"
        puts "Dealer score: #{@dealer_hand.score}"
        if @dealer_hand.busted?(@dealer_hand)
         puts "Dealer busts, You win!"
          break
        else
          puts
          puts "Dealer stands"
          puts
          if @dealer_hand.score == @player_hand.score
            puts "The game ends in a tie"
          elsif @player_hand.score < @dealer_hand.score
            puts "Sorry, the dealer wins"
          else
            puts "Congratulations, you win!"
          end
        end
      end
    end
  end





# puts
# puts
# puts
# puts "Player was dealt #{@player_hand.cards[1]}"
# puts
# puts "Player score: #{@player_hand.score}"

end

game = Game.new



