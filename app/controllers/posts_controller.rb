class PostsController < ApplicationController

  def index
    @posts = Post.search(params[:q])
  end

  def show
    @post = Post.find(params[:id])
    if !current_user.favorites.find{|x| x.post_id == @post.id }.nil?
      @is_favorited = true
    else
      @is_favorited = false
    end
  end


end
