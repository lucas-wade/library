class PubsController < ApplicationController
  def index
    @pubs = Pub.all
    #@users = User.where(activated: true).paginate(page: params[:page])
  end


  def show
    @pub = Pub.find(params[:id])
    #@microposts = @user.microposts.paginate(page: params[:page])
    #@micropost = current_user.microposts.build if logged_in?
    #redirect_to root_url and return unless @user.activated?
  end

  def new
    @pub = Pub.new
  end

  def edit
    @pub = Pub.find(params[:id])
  end

  def create
    @pub = Pub.new(pub_params)
    if @pub.save
      #@user.send_activation_email
      flash[:info] = "New Publication Saved."
      redirect_to :back
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
                                :translated,
                                :type,
                                :url,
                                :media,
                                :pub_type,
                                :meta_data)
  end

end
