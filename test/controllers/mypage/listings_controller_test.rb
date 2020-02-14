require 'test_helper'

class Mypage::ListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_listings_index_url
    assert_response :success
  end

  test "should get show" do
    get mypage_listings_show_url
    assert_response :success
  end

  test "should get new" do
    get mypage_listings_new_url
    assert_response :success
  end

  test "should get edit" do
    get mypage_listings_edit_url
    assert_response :success
  end

  test "should get create" do
    get mypage_listings_create_url
    assert_response :success
  end

  test "should get update" do
    get mypage_listings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get mypage_listings_destroy_url
    assert_response :success
  end

end
