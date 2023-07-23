class Api::BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /api/blogs or /api/blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /api/blogs/1 or /api/blogs/1.json
  def show
  end

  # GET /api/blogs/new
  def new
    @blog = Blog.new
  end

  # GET /api/blogs/1/edit
  def edit
  end

  # POST /api/blogs or /api/blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to api_blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/blogs/1 or /api/blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to api_blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/blogs/1 or /api/blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to api_blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.fetch(:blog, {})
    end
end
