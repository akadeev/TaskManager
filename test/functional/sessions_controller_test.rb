require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
	include AuthHelper

	setup do
		@user = User.create(email: "a", password: "a", password_confirmation: "a")
	end
  
  	test "should get new" do
    	get :new
    	assert_response :success
  	end

	test "log in" do
		post :create, {email: @user.email, password: "a"}
		assert_response :redirect
		assert signed_in?
	end

	test "should delete destroy" do
		attrs = {id: @user.id}
		sign_in @user
	    delete :destroy, attrs
	    assert_response :redirect
	    assert !signed_in?
	end
end