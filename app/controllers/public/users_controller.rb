class Public::UsersController < ApplicationController

  def after_sign_in_path_for(resource)
    #マイページに飛べない
    public_user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def quit
  end

  def out
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path(current_user)
  end
  
  

private
 def user_params
   params.require(:user).permit(:name, :group, :profile_image, :introduction)
 end

end
