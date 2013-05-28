require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user

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
    task = build :task

    assert_difference('Task.count') do
      post :create, task: {description: task.description, owner_id: task.owner_id, performer_id: task.performer_id, title: task.title}
    end
    assert_response :redirect

    task = Task.find_by_title(task.title)
    assert_not_nil task
  end

  test "should show task" do
    get :show, id: @task.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task.id
    assert_response :success
  end

  test "should update task" do
    task = build :task

    put :update, id: @task.id, task: { description: task.description, owner_id: task.owner_id, performer_id: task.performer_id, title: task.title }
    assert_response :redirect

    @task.reload
    assert_equal task.title, @task.title
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task.id
    end
    assert_response :redirect

    assert !Task.exists?(@user)
  end
end
