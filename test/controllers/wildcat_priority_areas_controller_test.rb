require "test_helper"

class WildcatPriorityAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wildcat_priority_area = wildcat_priority_areas(:one)
  end

  test "should get index" do
    get wildcat_priority_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_wildcat_priority_area_url
    assert_response :success
  end
end
