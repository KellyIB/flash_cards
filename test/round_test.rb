require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'
require './lib/deck'
require './lib/round'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
            reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe, in words, the exact direction that is 697.5°
            clockwise from due north?", "North north west", :STEM)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)

    @round = Round.new(@deck)

  end


  def test_round_exists

    assert_instance_of Round, @round
  end

  def test_deck_in_round

    assert_equal @deck, @round.deck
  end

  def test_turns_starts_as_empty_array

    assert_equal @round.turns, []
  end

  # def test_index0_is_first_in_cards
  #
  #   assert_equal @cards[0], @cards.first
  # end

  def test_current_card_equals_cards_value_at_given_index

    assert_equal @deck.cards[0], @round.current_card
  end

  def test_if_take_turns_creates_new_Turn_object

  new_turn = @round.take_turn("Juneau")
# binding.pry
    assert_instance_of Turn, new_turn
  end

  def test_is_new_turn_correct?

    new_turn = @round.take_turn("Juneau")
# binding.pry
      assert new_turn.correct?
  end

  def test_if_take_turns_is_storing_in_turns_array

    @round.take_turn("Juneau")
      # p @round.turns
    refute_equal [], @round.turns

  end

  def test_if_number_of_correct_changes
    @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_if_take_turns_switches_cards

      @round.take_turn("Juneau")

      assert_equal @deck.cards[1], @round.current_card
  end

  def test_if_take_turn_adds_more_to_the_array
    @round.take_turn("Juneau")

    assert_equal @round.take_turn("Venus"), @round.turns[1]
  end

  def test_if_take_turn_adds_more_than_one_to_the_array
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 2, @round.turns.count
  end

  def test_what_is_the_last_feedback_of_turns
    @round.take_turn("Venus")

    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_if_take_turns_stores_correct
    @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_if_take_turns_stores_correct_geography_stem
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    assert_equal 1, @round.number_geography_correct
    assert_equal 1, @round.number_stem_correct
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Mars")

    assert_equal

end
