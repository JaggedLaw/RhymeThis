require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  def player
    @player ||= Player.new
  end

  def test_valid
    assert player.valid?
  end
end
