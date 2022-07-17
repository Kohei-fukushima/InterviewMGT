class Public::FavoritesController < ApplicationController

  def create
    @interview = Interview.find(params[:interview_id])
    favorite = current_user.favorites.new(interview_id: @interview.id)
    favorite.save
  end

  def destroy
    @interview = Interview.find(params[:interview_id])
    favorite = current_user.favorites.find_by(interview_id: @interview.id)
    favorite.destroy
  end
end
