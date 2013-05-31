require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
	setup do
		@user = create :user
	end
  
  	test "should get new" do
    	get :new
    	assert_response :success
  	end

	test "should log in" do
		attrs = {email: @user.email, password: "test"}
		post :create, attrs
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