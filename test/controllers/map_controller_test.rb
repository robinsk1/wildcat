require "test_helper"

class MapControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get map_show_url, params: { xmin: 26.468840334661323, 
                                ymin: -74.95585551599015,
                                xmax: 37.6126981403826,
                                ymax: -54.76298442224015 }
    assert_response :success
  end
end
