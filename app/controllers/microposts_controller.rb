class MicropostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @microposts = Micropost.all
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    store_location
    if @micropost.save
      flash[:success] = "Micropost created!"
      #redirect_back_or(user_url)
      redirect_to @current_user
    else
      @feed_items = []
      #redirect_back_or(home_path)
      render 'static_pages/home'
    end
  end


  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        redirect_to @micropost, notice: 'Micropost was successfully updated.'
      else
         render :edit
      end
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

end
