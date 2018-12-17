require 'test_helper'

class MemberparamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get memberparams_new_url
    assert_response :success
  end

  test "should get edit" do
    get memberparams_edit_url
    assert_response :success
  end

end
