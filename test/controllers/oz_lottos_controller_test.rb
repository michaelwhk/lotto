require 'test_helper'

class OzLottosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oz_lottos_index_url
    assert_response :success
  end

  test "should get add" do
    get oz_lottos_add_url
    assert_response :success
  end

  test "should get remove" do
    get oz_lottos_remove_url
    assert_response :success
  end

end
