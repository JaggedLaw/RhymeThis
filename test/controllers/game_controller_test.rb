require "test_helper"

class GameControllerTest < ActionController::TestCase
  def test_show
    get :show
    assert_response :success
  end

end
