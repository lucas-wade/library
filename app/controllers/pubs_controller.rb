class PubsController < ApplicationController
  def index
    @pubs = Pub.all
    #@users = User.where(activated: true).paginate(page: params[:page])
  end


  def show
    @pub = Pub.find(params[:id])
    @pubs = Pub.all
    #if @pub.parents.present?
    #  @temp_topic = @topic.parents.first.id
    #end
  end

  def new
    @pub = Pub.new
    if params[:parent_id].present?
      @parent_topic = Topic.find(params[:parent_id])
    end
    if params[:original_id].present?
      @original_pub = Pub.find(params[:original_id])
    end
  end



  def create
    @pub = Pub.new(pub_params)
    if params[:parent_id].present?
      @parent_topic = Topic.find(params[:parent_id])
    end
    if params[:original_id].present?
      @original_pub = Pub.find(params[:original_id])
    end
    if @pub.save
      if params[:parent_id].present?
        @pub.make_parent(@parent_topic)
      end
      if params[:original_id].present?
        @pub.translation_of(@original_pub)
      end
      flash[:info] = "New Publication Saved."
      redirect_to pubs_path
    else
      render 'new'
    end
  end

  def edit
    @pub = Pub.find(params[:id])
  end

  def update
    @pub = Pub.find(params[:id])
    if params[:parent_id].present?
      @parent_topic = Topic.find(params[:parent_id])
    end
    if params[:original_id].present?
      @original_pub = Pub.find(params[:original_id])
    end
    if @pub.update_attributes(pub_params)
      flash[:success] = "Publication updated"
      redirect_to @pub
    else
      render 'edit'
    end
  end

  def destroy
    Pub.find(params[:id]).destroy
    flash[:success] = "Publication deleted"
    redirect_to pubs_path
  end


  private

  def pub_params
    params.require(:pub).permit(:name,
                                :language,
                                :translation,
                                :type,
                                :url,
                                :media,
                                :skill,
                                :pub_type,
                                :meta_data,
                                :topic_id,
                                :original_id,
                                :translation_id)
  end

end
