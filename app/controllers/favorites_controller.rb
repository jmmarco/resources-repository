class FavoritesController < ApplicationController
  def show
    @show = Favorite.all
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    if @favorite.save
      200
    else
      500
    end
  end

  def destroy
    @favorite = Favorite.find_by(post_id: params[:id])

    if @favorite.destroy
      200
    else
      500
    end
  end

end
