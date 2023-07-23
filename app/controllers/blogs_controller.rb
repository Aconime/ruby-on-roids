class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.all
    @pagy, @blogs = pagy(@blogs)
  end

  def show
    # empty
  end

  def new
    @blog = Blog.new
  end

  def edit
    # empty
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html do
          redirect_to _blog_url(@blog), notice: 'Blog was successfully created.'
        end
        render :show, status: :created, location: @blog
      else
        render :new, status: :unprocessable_entity
        render json: @blog.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html do
          redirect_to _blog_url(@blog), notice: 'Blog was successfully updated.'
        end
        render :show, status: :ok, location: @blog
      else
        render :edit, status: :unprocessable_entity
        render json: @blog.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @blog.destroy

    respond_to do |_format|
      redirect_to _blogs_url, notice: 'Blog was successfully destroyed.'
      head :no_content
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.fetch(:blog, {})
  end
end
