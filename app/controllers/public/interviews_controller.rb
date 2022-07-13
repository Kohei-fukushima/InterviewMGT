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
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # 投稿データのストロングパラメータ
  private

  def interview_params
    params.require(:interview).permit(:title, :body)
  end
end
