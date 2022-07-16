class Public::InteviewCommentsController < ApplicationController
  def create
    interview = Interview.find(params[:interview_id])
    comment = current_user.interview_comments.new(interview_params)
    comment.interview_id = interview.id
    redirect_to public_interview_path(interview)
  end

  def destroy
  end
  
  private
  
  def interview_comment_params
    params.require(:interview_comment).permit(:comment)
  end
end
