class Admin::InteviewCommentsController < ApplicationController
  def destroy
    InterviewComment.find(params[:id]).destroy
    redirect_to public_interview_path(params[:interview_id])
  end

  private

  def interview_comment_params
    params.require(:interview_comment).permit(:comment)
  end
end
