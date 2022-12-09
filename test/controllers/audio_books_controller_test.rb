require "test_helper"

class AudioBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get audio_books_new_url
    assert_response :success
  end
end
