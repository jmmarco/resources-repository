class PostsController < ApplicationController

  def index
    @posts = Post.search(params[:q])
  end

  def show
    @post = Post.find(params[:id])
  end

  def parse
    doc = Nokogiri::HTML(open(params[:data]))
    image = doc.search('meta[property="og:image"]')[0].values[0]
    description = doc.search('meta[property="og:description"]')[0].values[0]
    title = doc.search('meta[property="og:title"]')[0].values[0]
    respond_to do |format|
      data = { :title => title, :description => description, :image => image }
      format.json { render json: data }
    end
  end

end
