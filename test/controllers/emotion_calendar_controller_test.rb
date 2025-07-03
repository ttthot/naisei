require "test_helper"

class EmotionCalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emotion_calendar_index_url
    assert_response :success
  end
end
