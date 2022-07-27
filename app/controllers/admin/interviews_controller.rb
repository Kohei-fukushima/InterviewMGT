class Admin::InterviewsController < ApplicationController
  def index
    @interviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).interviews.page(params[:page]) : Interview.page(params[:page])
    @users = User.all
  end

  def show
    @interview = Interview.find(params[:id])
    @interview_comment = InterviewComment.new
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to admin_interviews_path
  end

   # 投稿データのストロングパラメータ
  private

  def interview_params
    params.require(:interview).permit(:title, :body, :schedule, tag_ids: [])
  end
end
