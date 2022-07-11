class Public::InterviewsController < ApplicationController
  def new
    @interview = Interview.new
  end

  def create
    @interview = PostImage.new(interview_params)
    @interview.user_id = current_user.id
    @interview.save
    redirect_to public_user_path(current_user)
  end

  def index
  end

  def show
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
    params.require(:interview).permit(:title, :body,)
  end
end
