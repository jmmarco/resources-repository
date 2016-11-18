class FavoritesController < ApplicationController
  def show
    @show = Favorite.all
  end

  def create
    @favorite = Favorite.new(user_id: current_user, post_id: params[:post_id]).save
  end

end
