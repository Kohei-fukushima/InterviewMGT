class Public::InterviewsController < ApplicationController
  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.user_id = current_user.id
    if @interview.save
      redirect_to interviews_path
    else
      render :new
    end
  end

  def index
    @user = current_user
    # ページネーションはinterviewに紐づいているtagにもつけることで実装できる
    @interviews = params[:tag_id].present? ? Tag.find(params[:tag_id]).interviews.page(params[:page]) : @user.interviews.page(params[:page])
    # idsがユーザーのフォローに紐づいたidを取得し、pushでユーザー自身のidも取得する
    ids = current_user.followings.pluck(:id).push(current_user.id)
    @interview_all = Interview.includes(:user).where(users: {id: ids })
    @interview = Interview.new
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
      redirect_to interview_path(@interview.id)
    else
      render :edit
    end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to interviews_path
  end

  # 投稿データのストロングパラメータ
  private

  def interview_params
    params.require(:interview).permit(:title, :body, :schedule, tag_ids: [])
  end
end
