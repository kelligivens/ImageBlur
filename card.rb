class Card
  attr_accessor :rank, :suit
    
  def initialize(rank, suit)
      @rank = rank
      @suit = suit
  end
  
  def output_card
      puts "#{self.rank} of #{self.suit}"
  end
 
   def self.random_card
    @ranks = [2,3,4,5,6,7,8,9,10, :Jack, :Queen, :King, :Ace]
    @suits = [:Spades, :Clubs, :Diamonds, :Hearts]
    Card.new(ranks[rand(ranks.length-1)], suits[rand(suits.length-1)])
  end
end

class Deck
  def initialize
    @cards = []
    @ranks = [2,3,4,5,6,7,8,9,10, :Jack, :Queen, :King, :Ace]
    @suits = [:Spades, :Clubs, :Diamonds, :Hearts]
  
    @suits.each do |suit|
      @ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.shift
  end
  
  def output_deck
    @cards.each do |card|
      card.output_card
  end
 end
end


deck = Deck.new
deck.shuffle  
deck.deal.output_card