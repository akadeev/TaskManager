require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    user = build :user

    assert_difference('User.count') do
      post :create, user: { password: "test", email: user.email }
    end
    assert_response :redirect

    user = User.find_by_email(user.email)
    assert_not_nil user
  end

  test "should show user" do
    get :show, id: @user.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user.id
    assert_response :success
  end

  test "should update user" do
    user = build :user

    put :update, id: @user.id, user: { password: "test", email: user.email }
    assert_response :redirect

    @user.reload
    assert_equal user.email, @user.email
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.id
    end
    assert_response :redirect

    assert !User.exists?(@user)
  end
end
