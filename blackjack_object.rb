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

  def initialize(name="Dealer")
     @cards = []
     @name = name
  end

  def hit(card)
    @cards << card
    @cards
  end

  def stay
    "the player chooses to stay with the cards he has"

  end

  def score
    total = 0
    @cards.each do |card|
      if card.value == 1 && total > 10
        card.value == 11
      end
      total += card.num_value
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
    deal
  end

  def deal
    dealer = Hand.new
    player = Hand.new("Tom")
    2.times {player.hit(@deck.pop)}
    2.times {dealer.hit(@deck.pop)}
    puts "Welcome to Blackjack!"
    puts
    puts "#{player.name} was dealt #{player.cards[0].card} and #{player.cards[1].card}"
    puts "#{player.name}'s score is #{player.score}"
    puts "Hit or stand (H/S): "
    input = gets.chomp
    while input.downcase == "h"
      player.hit(@deck.pop)
      puts "#{player.name} was dealt #{player.cards[-1].card}"
      puts "#{player.name}'s score: #{player.score}"
      if player.busted?
        puts "Bust! You lose..."
        break
      end
    puts "Hit or stand (H/S): "
    input = gets.chomp
    end
    if input.downcase == "s"
      puts player.stay
      puts
      puts "#{player.name}'s score: #{player.score}"
      puts
      puts
      puts  "#{dealer.name} was dealt #{dealer.cards[0].card} and #{dealer.cards[1].card}"
      puts  "#{dealer.name}'s score: #{dealer.score}"
      puts
      if dealer.score >= 17
        puts
        if player.score == dealer.score
          puts "The game ends in a tie"
        elsif player.score < dealer.score
          puts "Sorry, the dealer wins"
        else
          puts "Congratulations, you win!"
        end
      end
      while dealer.score < 17
        dealer.hit(@deck.pop)
        puts "#{dealer.name} was dealt #{dealer.cards[-1].card}"
        puts "#{dealer.name}'s score: #{dealer.score}"
        if dealer.busted?
          puts "#{dealer.name} busts, You win!"
          break
        end
        if dealer.score >= 17
        puts
        puts "#{dealer.name} stands"
        puts
      end
    end
  end
end

Game.new
