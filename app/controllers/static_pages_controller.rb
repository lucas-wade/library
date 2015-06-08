class StaticPagesController < ApplicationController

    def home
      if logged_in?
        @micropost = current_user.microposts.build if logged_in?
        @feed_items = current_user.feed.paginate(page: params[:page])

      end
    end

    def library
      if params[:search]
        @topics = Topic.search_name(params[:search]).order("created_at DESC")
        @topics += Topic.search_main_content(params[:search]).order("created_at DESC")


        @pubs = Pub.search_name(params[:search]).order("created_at DESC")
        #@pubs += Pub.search_main_content(params[:search]).order("created_at DESC")
        @pubs += Pub.search_meta_data(params[:search])

      else
        @topics = Topic.all.where("language like ?", I18n.locale.to_s)
        @pubs = Pub.all.where("language like ?", I18n.locale.to_s)
        #.order('created_at DESC')
      end
    end

    def translations
      if params[:search]
        @topics = Topic.search_name(params[:search]).order("created_at DESC")
        @topics += Topic.search_main_content(params[:search]).order("created_at DESC")


        @pubs = Pub.search_name(params[:search]).order("created_at DESC")
        #@pubs += Pub.search_main_content(params[:search]).order("created_at DESC")
        @pubs += Pub.search_meta_data(params[:search])

      else
        @topics = Topic.all
        @pubs = Pub.all
        #.order('created_at DESC')
      end
    end


    def about
    end

    def admin
      @topics = Topic.all
    end

    def language_select
    end

    def classroom_doors
    end
end
