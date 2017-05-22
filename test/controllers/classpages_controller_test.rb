require 'test_helper'

class ClasspagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get classpages_new_url
    assert_response :success
  end

end
