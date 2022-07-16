class Public::InterviewsController < ApplicationController
  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.user_id = current_user.id
    @interview.save
    redirect_to public_interviews_path
  end

  def index
    @interviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).interviews : Interview.all
    @user = current_user
  end

  def show
    @interview = Interview.find(params[:id])
    @interview_comment = InterviewComment.new
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update(interview_params)
      redirect_to public_interview_path(@interview.id)
    else
      render :edit
    end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to public_interviews_path
  end

  # 投稿データのストロングパラメータ
  private

  def interview_params
    params.require(:interview).permit(:title, :body, tag_ids: [])
  end
end
