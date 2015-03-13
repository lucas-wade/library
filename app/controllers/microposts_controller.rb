class MicropostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @microposts = Micropost.all
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
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
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

end
