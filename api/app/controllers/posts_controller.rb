class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @topic = Topic.find(params[:topic_id])
    # @post = @topic.posts.find(params[:id])
  end

  # POST /posts or /posts.json
  def create
    @topic = Topic.find(params[:topic_id])
    @new_post = @topic.posts.build(post_params)
    # @post = Post.new(post_params)

    respond_to do |format|
      if @new_post.save
        format.html { redirect_to topic_url(@topic), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @topic = Topic.find(params[:topic_id])
    # @post = @topic.posts.find(params[:id])
    puts "POSTSSSSSSSSSSSSSSS"

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_url(@topic), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])

    if @post.destroy
      flash[:notice] = "Post deleted successfully."
    else
      flash[:alert] = "Error deleting the post."
    end
    respond_to do |format|
      format.html { redirect_to topic_url(@topic), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
    # redirect_to topic_path(@topic)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:topic_id, :body)
    end
end
