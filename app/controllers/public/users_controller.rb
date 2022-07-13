class Public::UsersController < ApplicationController

  def after_sign_in_path_for(resource)
    #マイページに飛べない
    public_user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  def new
  end

  def show
    @user = current_user.id
    @interviews = @user.interviews
  end

  def index
  end

  def quit
  end

  def out
  end

  def edit
  end

  def update
  end

private


end
