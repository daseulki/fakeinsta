class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    post = Post.new
    post.title = params[:title]
    post.name = params[:name]
    post.content = params[:content]

    post.save
    
  end

  def edit
  end

  def show
  end

  def update

  end

  def delete
  end

end
