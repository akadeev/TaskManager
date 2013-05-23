require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
	include AuthHelper

	setup do
		@user = create :user
	end
  
  	test "should get new" do
    	get :new
    	assert_response :success
  	end

	test "log in" do
		post :create, {email: @user.email, password: "test"}
		assert_response :redirect
		assert signed_in?
	end

	test "should delete destroy" do
		sign_in @user
	    delete :destroy, id: @user.id
	    assert_response :redirect
	    assert !signed_in?
	end
end