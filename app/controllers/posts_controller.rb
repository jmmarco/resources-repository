class PostsController < ApplicationController

  def index
    @posts = Post.search(params[:q])
  end

  def show
    @post = Post.find(params[:id])
  end



  # def search
  #   @q = params[:q]
  #
  #   if @q
  #     @posts = Post.search(@q)
  #   else
  #     @posts = Post.all.limit(50)
  #   end
  # end


end
