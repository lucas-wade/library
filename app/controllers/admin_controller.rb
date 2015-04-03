class AdminController < ApplicationController

  def topics
    @topics = Topic.all
  end

  def index
    @topics = Topic.all
  end




  def edit_toggle
    if current_user.admin == TRUE
      if session[:edit_mode] && session[:edit_mode]==1
        session[:edit_mode]=0
      else
        session[:edit_mode]=1
      end


#      if $edit_mode && $edit_mode==1
 #       $edit_mode=0
  #    else
   #     $edit_mode=1
    #  end

      redirect_to :back

    end
  end

end
