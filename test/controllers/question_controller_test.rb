require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get question_index_url
    assert_response :success
  end

  test "should get create" do
    get question_create_url
    assert_response :success
  end

  test "should get update" do
    get question_update_url
    assert_response :success
  end

  test "should get destroy" do
    get question_destroy_url
    assert_response :success
  end

end
