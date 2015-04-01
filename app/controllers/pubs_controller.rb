class PubsController < ApplicationController
  def index
    @pubs = Pub.all
    #@users = User.where(activated: true).paginate(page: params[:page])
  end


  def show
    @pub = Pub.find(params[:id])
    @pubs = Pub.all
    #if @pub.topics.present?
     # @temp_pub = @pub.topics.first.id
   # end
  end

  def new
    @pub = Pub.new
    if params[:parent_id].present?
      @parent_topic = Topic.find(params[:parent_id])
    end
  end

  def edit
    @pub = Pub.find(params[:id])
  end

  def create
    @pub = Pub.new(pub_params)
    @parent_topic = Topic.find(params[:parent_id])
    if @pub.save
      @pub.make_parent(@parent_topic)
      #@user.send_activation_email
      flash[:info] = "New Publication Saved."
      redirect_to pubs_path
    else
      render 'new'
    end
  end

  def update
    @pub = Pub.find(params[:id])
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
    redirect_to pub_url
  end


  private

  def pub_params
    params.require(:pub).permit(:name,
                                :language,
                                :translation,
                                :type,
                                :url,
                                :media,
                                :pub_type,
                                :meta_data,
                                :topic_id)
  end

end
