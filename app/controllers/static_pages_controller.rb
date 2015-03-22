class StaticPagesController < ApplicationController
  def home
    def home
      if logged_in?
        @micropost = current_user.microposts.build if logged_in?
        @feed_items = current_user.feed.paginate(page: params[:page])
        #@topic = Topic.all
      end
    end
  end

  def about
  end

end
