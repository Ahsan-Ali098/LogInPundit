# frozen_string_literal: true

# Posts controller
#
class PostsController < ApplicationController
  before_action :set_post
  before_action :authorized

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    @post ||= Post.new
  end

  def authorized
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
