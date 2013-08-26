class Card
  def initialize(rank = nil, suit = nil)
    if suit.nil?
      @suit = ['♠', '♣', '♥', '♦'].sample
    else
      @suit = suit
    end
    if rank.nil?
      @rank = ["1","2","3","4","5","6","7","8","9","10"].sample
    else
    @rank = rank
    end
    puts "Create a new card: #{@rank} of #{@suit}"
  end
end
 Card.new
