class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @post = Post.where("title LIKE ?", "%#{params["q"]}%")
  end

  def new
  end

  def create

    #current_user => User의 인스턴스
    #current_user.posts => Post의 인스턴스
    current_user.posts.create(post_params)

    # Post.create(post_params)
    # post = Post.new
    # post.title = params[:title]
    # post.content = params[:content]
    # post.save
    puts "************************"
    puts post_params.inspect
    puts "************************"
    redirect_to '/'

  end

  def show
    # @post = Post.find(params[:id])
  end

  def edit
    # @post = Post.find(params[:id])
  end


  def update
    @post.update(post_params
    )
    redirect_to "/"
  end

  def destroy
    @post.destroy
    redirect_to "/"
  end

  # private 위에는 public이라서 url로 요청오면 그것을 받아서 뷰를 보여준다.
    private
    # private은 해당 컨트롤러(PostsController)에서만 사용가능함.
    # 객체에서 private 속성을 가지면.. 클래스 내부에서만 접근이 가능했었고,
    # 이외의 상속받은 클래스나 객체 인스턴스에서도 접근이 불가능했음.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :postimage)

  end

end
