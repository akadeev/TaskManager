require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)

    @task = create :task
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, { description: @task.description, owner_id: @task.owner_id, performer_id: @task.performer_id, state: @task.state, title: @task.title }
    end

    assert_response :redirect
  end

  test "should show task" do
    get :show, id: @task.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    put :update, id: @task, task: { description: @task.description, owner_id: @task.owner_id, performer_id: @task.performer_id, state: @task.state, title: @task.title }
    assert_response :redirect
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_response :redirect
  end
end
