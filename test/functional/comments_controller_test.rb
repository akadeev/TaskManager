require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_REFERER'] = root_path # Set up referer for redirecting to :back in Testing mode
    
    @user = create :user
    sign_in @user

    @comment = create :comment
  end

  test "should create comment" do
    attrs = attributes_for :comment

    post :create, comment: attrs
    assert_response :redirect

    comment = Comment.find_by_text(attrs[:text])
    assert comment
  end

  test "should delete comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment.id
    end
    assert_response :redirect

    assert !Comment.exists?(@comment)
  end
end