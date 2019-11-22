require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
                    reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe, in words, the exact direction that is 697.5°
                    clockwise from due north?", "North north west", :STEM)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)

  end

  def test_deck_exists

    assert_instance_of Deck, @deck
  end

  def test_it_has_cards_in_deck

    assert_equal @cards, @deck.cards
  end

  def test_how_many_in_deck

    assert_equal 3, @deck.count
  end

  def test_cards_in_category


    assert @deck.cards_in_category(:STEM)
  end

  def test_cards_in_another_category

    assert @deck.cards_in_category("Pop Culture")
  end

end
