require './lib/turn'
require './lib/card'
require 'pry'
require './lib/deck'
require './lib/round'


card1 = Card.new("What is 3 * 3?", "9", :STEM)
card2 = Card.new("Name the chemical formula for hydrogen peroxide?", "H2O2", :STEM)
card3 = Card.new("What city is Turing located in?", "Denver", "Geography")
card4 = Card.new("What is 5 * 5?", "25", :STEM)

cards = [card1, card2, card3, card4]

deck = Deck.new(cards)

round = Round.new(deck)


puts "Welcome! You're playing with 4 cards."
puts  "-" * 50

round.start

round.take_turn(@guess)

round.start

round.take_turn(@guess)

binding.pry














# def start
#   deck.cards.each do |card|
#     card_num = 1
#     puts "This is card number #{card_num} of #{deck.cards.length}."
#     puts "Question: #{card.question}"
#     guess = gets.chomp
#     round.take_turn(guess)
#     card_num += 1
#   end
# end
  # end
