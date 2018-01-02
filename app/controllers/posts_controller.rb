class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
  end

  def create
    @post = Post.create(
      title: params[:title],
      content: params[:content],
      name: params[:name]
    )
    redirect_to "/"

  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

  def update

  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to "/"
  end

end
