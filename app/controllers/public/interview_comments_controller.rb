class Public::InterviewCommentsController < ApplicationController
  def create
    interview = Interview.find(params[:interview_id])
    comment = current_user.interview_comments.new(interview_comment_params)
    comment.interview_id = interview.id
    comment.save!
    redirect_to interview_path(interview)
  end

  def destroy
    InterviewComment.find(params[:id]).destroy
    redirect_to interview_path(params[:interview_id])
  end

  private

  def interview_comment_params
    params.require(:interview_comment).permit(:comment)
  end
end
