

class Round
  attr_reader :deck, :turns, :current_card, :number_correct, :cards_index,
              :number_stem_correct, :number_geography_correct

  def initialize(deck, turns = [])
    @deck = deck
    @cards_index = 0
    @current_card = @deck.cards[0]#.cards
    @number_correct = 0
    @number_stem_correct = 0
    @number_geography_correct = 0
    @turns = turns
    @feedback_array = []
    @percent_correct =
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    @cards_index += 1
      if new_turn.correct? == true
      @feedback_array << new_turn.feedback
      @number_correct += 1
        if new_turn.category == :STEM
          @number_stem_correct += 1
        else
           new_turn.category == "Geography"
           @number_geography_correct += 1
        end
      end

      @percent_correct = (@number_correct.to_f/@turns.length).round(1)


      @current_card = @deck.cards[@cards_index]
      new_turn

  end

  def percent_correct
















end
