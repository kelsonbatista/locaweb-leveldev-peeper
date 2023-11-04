class TopicsController < ApplicationController
  before_action :set_topic, only: %i[ show edit update destroy create_post]

  # GET /topics or /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1 or /topics/1.json
  def show
    @posts = @topic.posts
    @topic = Topic.find(params[:id])
    @new_post = @topic.posts.build
  end

  def create_post
    @new_post = @topic.posts.build(post_params)

    if @new_post.save
      redirect_to @topic, notice: "Post created successfully."
    else
      render :show
    end
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics or /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topic_url(@topic), notice: "Topic was successfully created." }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1 or /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        puts "passou aqui update topics"
        format.html { redirect_to topic_url(@topic), notice: "Topic was successfully updated." }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_post
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
  end

  def update_post
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    puts "UPDATE POST"

    if @post.update(post_params)
      redirect_to @topic, notice: "Post updated successfully."
    else
      render :edit_post
    end
  end

  # DELETE /topics/1 or /topics/1.json
  def destroy
    @topic.destroy!

    respond_to do |format|
      format.html { redirect_to topics_url, notice: "Topic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def topic_params
      params.require(:topic).permit(:title)
    end

    def post_params
      params.require(:post).permit(:body)
    end
end
