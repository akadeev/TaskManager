require 'test_helper'

class Web::Tasks::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
    
    @comment = create :comment
    @task = create :task
  end

  test "should create comment" do
    attrs = attributes_for :comment, user_id: @user.id, task_id: @task.id

    post :create, task_id: @task.id, comment: attrs
    assert_response :redirect

    comment = Comment.find_by_text(attrs[:text])
    assert comment
  end

  test "should delete comment" do
    delete :destroy, task_id: @comment.task.id, id: @comment.id
    
    assert_response :redirect
    assert !Comment.exists?(@comment)
  end
end