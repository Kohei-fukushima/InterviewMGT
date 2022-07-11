require "test_helper"

class Public::InterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_interviews_new_url
    assert_response :success
  end

  test "should get index" do
    get public_interviews_index_url
    assert_response :success
  end

  test "should get show" do
    get public_interviews_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_interviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_interviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_interviews_destroy_url
    assert_response :success
  end
end
