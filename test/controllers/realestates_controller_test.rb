require 'test_helper'

class RealestatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @realestate = realestates(:one)
  end

  test "should get index" do
    get realestates_url
    assert_response :success
  end

  test "should get new" do
    get new_realestate_url
    assert_response :success
  end

  test "should create realestate" do
    assert_difference('Realestate.count') do
      post realestates_url, params: { realestate: { category: @realestate.category, city: @realestate.city, description: @realestate.description, district: @realestate.district, img: @realestate.img, price: @realestate.price, re_type: @realestate.re_type, state: @realestate.state, street: @realestate.street } }
    end

    assert_redirected_to realestate_url(Realestate.last)
  end

  test "should show realestate" do
    get realestate_url(@realestate)
    assert_response :success
  end

  test "should get edit" do
    get edit_realestate_url(@realestate)
    assert_response :success
  end

  test "should update realestate" do
    patch realestate_url(@realestate), params: { realestate: { category: @realestate.category, city: @realestate.city, description: @realestate.description, district: @realestate.district, img: @realestate.img, price: @realestate.price, re_type: @realestate.re_type, state: @realestate.state, street: @realestate.street } }
    assert_redirected_to realestate_url(@realestate)
  end

  test "should destroy realestate" do
    assert_difference('Realestate.count', -1) do
      delete realestate_url(@realestate)
    end

    assert_redirected_to realestates_url
  end
end
