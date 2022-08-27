class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @interviews = @user.interviews.page(params[:page])
  end

  def index
    # notによってログインユーザー以外のidのみを取得する
    @users = User.where.not(id: current_user.id)
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
        redirect_to interviews_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:interview_id)
    @favorite_interviews = Interview.find(favorites)
  end

private
 def user_params
   params.require(:user).permit(:name, :group, :profile_image, :introduction)
 end

end
