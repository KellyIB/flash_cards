
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards

  end

  def count
     cards.length
  end

  def cards_in_category(category)
     #.select (enumerable)
     cards.select do |card|
       if card.category == (category)
         card
       end
     end
   end
end