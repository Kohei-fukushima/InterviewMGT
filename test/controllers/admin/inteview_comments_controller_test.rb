require "test_helper"

class Admin::InteviewCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_inteview_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_inteview_comments_destroy_url
    assert_response :success
  end
end
