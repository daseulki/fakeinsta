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
      name: params[:name],
      postimage: params[:postimage]
    )
    
    redirect_to "/"

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id]).update(
      title: params[:title],
      content: params[:content],
      name: params[:name]
    )
    redirect_to "/"
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to "/"
  end

end
