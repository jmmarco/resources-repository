class PostsController < ApplicationController

  def index
    @posts = Post.search(params[:q])
  end

  def show
    @post = Post.find(params[:id])
  end

  def parse
    doc = Nokogiri::HTML(open(params[:data]))
    image = doc.search('meta[property="og:image"]').pluck('content')
    description = doc.search('meta[property="og:description"]').pluck('content')
    title = doc.search('meta[property="og:title"]').pluck('content')
    respond_to do |format|
      data = { :title => title, :description => description, :image => image }
      format.json { render json: data }
    end
  end

end
