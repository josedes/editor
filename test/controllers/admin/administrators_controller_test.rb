require 'test_helper'

class Admin::AdministratorsControllerTest < ActionController::TestCase
  test "should get cms" do
    get :cms
    assert_response :success
  end

  test "should get alervac" do
    get :alervac
    assert_response :success
  end

end
