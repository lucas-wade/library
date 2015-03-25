class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
    #@homeless_topics = Topic.find_by_parents(nil)

  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
    @topics = Topic.all
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      #@user.send_activation_email
      flash[:info] = "New Topic Created."
      redirect_to root_url
    else
      render 'new'
    end
  end


  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:success] = "topic updated"
      redirect_to @topic
    else
      render 'edit'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :language, :main_content, :parent_id, :kid_id, :skill)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end


end
