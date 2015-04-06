class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
    #@topics = Topic.search(params[:search])



    #@topics = Topic.all.where(language =  '1')
    #@topics = Topic.where(:language => '1')
    #@homeless_topics = Topic.find_by_parents(nil)
  end

  def show
    @topic = Topic.find(params[:id])
    @topics = Topic.all
    if @topic.parents.present?
      @temp_topic = @topic.parents.first.id
    end
  end


  def new
    @topic = Topic.new
    if params[:parent_id].present?
      @parent_topic = Topic.find(params[:parent_id])
    end
    if params[:original_id].present?
      @original_topic = Topic.find(params[:original_id])
    end
  end


  def create
    @topic = Topic.new(topic_params)
    if params[:parent_id].present?
      @parent_topic = Topic.find(params[:parent_id])
    end
    if params[:original_id].present?
      @original_topic = Topic.find(params[:original_id])
    end
    if @topic.save
      if params[:parent_id].present?
        @topic.make_parent(@parent_topic)
      end
      if params[:original_id].present?
        @topic.translation_of(@original_topic)
      end
      flash[:info] = "New Topic Created."
      redirect_to topics_path
    else
      render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if params[:parent_id].present?
      @parent_topic = Topic.find(params[:parent_id])
    end
    if @topic.update_attributes(topic_params)
      flash[:success] = "topic updated"
      render 'edit'
    else
      render 'edit'
    end
  end


  def destroy
    Topic.find(params[:id]).destroy
    flash[:success] = "Topic deleted"
    redirect_to topics_url
  end



  private

  def topic_params
    params.require(:topic).permit(:name,
                                  :language,
                                  :category,
                                  :skill,
                                  :main_content,
                                  :parent_id,
                                  :kid_id,
                                  :publication_id,
                                  :original_id,
                                  :icon)

  end

  def set_topic
    @topic = Topic.find(params[:id])
  end


end
