require 'test_helper'

class PlanetControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get planet_show_url
    assert_response :success
  end

end
