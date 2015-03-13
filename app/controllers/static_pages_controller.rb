class StaticPagesController < ApplicationController
  def home
    def home
      @micropost = current_user.microposts.build if logged_in?
    end
  end

  def about
  end

end
