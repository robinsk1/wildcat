require "test_helper"

class WildcatPriorityAreasControllerTest < ActionDispatch::IntegrationTest
  test "should get polygons that contain coordinate" do
    get contains_wildcat_priority_areas_url, params: { coord: "-71.73249306285165 25.346688401045476 " }

    assert_equal 1, JSON.parse(response.body).count
    assert_response :success
  end
end
