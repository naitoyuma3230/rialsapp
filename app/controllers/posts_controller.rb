class PostsController < ApplicationController

  # posts GET    /posts(.:format)        posts#index
  # index.html.erbで使用可能な変数を定義する(@posts)
  def index
    @posts = Post.all.order(created_at:'desc')
  end
  
  # post GET    /posts/:id(.:format)      posts#show
  # params: post/:id(GET)をURLから値を受け取るメソッド
  def show
    @post = Post.find(params[:id])
  end
  
  # new_post GET    /posts/new(.:format)      posts#new
  def new
    @post = Post.new
  end

  # POST   /posts(.:format)          posts#create
  def create
    # save
    # @post = Post.new(params[:post]) エラー：値の検証が必要
    @post = Post.new(post_params)
    if @post.save
      # redirect
      redirect_to posts_path
    else
      # エラーの表示
      render 'new'
    end
  end

  # edit_post GET    /posts/:id/edit(.:format) posts#edit
  def edit
    @post = Post.find(params[:id])
  end
  

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  




  private
  # Strong Parameters:送信された:post(変数)に対しtitle,bodyの検証
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
