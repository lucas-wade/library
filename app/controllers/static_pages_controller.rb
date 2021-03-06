class StaticPagesController < ApplicationController
  #include TopicsHelper
  #before_action :set_locale, :home

    def home
      if logged_in?
        @micropost = current_user.microposts.build if logged_in?
        @feed_items = current_user.feed.paginate(page: params[:page])
        redirect_to topics_url
      else
        session[:instructions] = nil
      end
    end

    def library
      # *** topics all your language name ordered
      #@topics = Topic.all.where("language like ?", I18n.locale.to_s).order(:name)
      @topics = Topic.all.where("language like ?", I18n.locale.to_s).order(:name)
      @pubs = Pub.all.where("language like ? or language like ?", I18n.locale.to_s, "na").order(:name).paginate(page: params[:page], per_page: 5)

      # remove empty topics from list
      @topics = @topics.where.not(main_content: '').paginate(page: params[:page], per_page: 5)

      #
      #current_page = params[:page] ||= 1

      #@topics = WillPaginate::Collection.create(current_page, 5, @topics.length) do |pager|
    #    pager.replace @topics
    #  end

      #search
      if params[:search]
        #@topics = Topic.search_name(params[:search]).order("created_at DESC")
        #@topics = Topic.search_name(params[:search]).order(:name)
        topics = @topics.search_name(params[:search]).order(:name)

        #@topics += Topic.search_main_content(params[:search]).order("created_at DESC")
        #@topics += Topic.search_main_content(params[:search]).order(:name)
        topics += @topics.search_main_content(params[:search]).order(:name)
        @topics = topics

        #@pubs = Pub.search_name(params[:search]).order("created_at DESC")
        #@pubs += Pub.search_meta_data(params[:search])

        pubs = @pubs.search_name(params[:search]).order("created_at DESC")
        pubs += @pubs.search_meta_data(params[:search])
        @pubs = pubs

      #else
        #.order('created_at DESC')

        @pubs = @pubs.paginate(page: params[:page], per_page: 5)
        @topics = @topics.paginate(page: params[:page], per_page: 5)
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
      @topic = Topic.find_by(id: 4)
      #@topic = Topic.find(params[:id])
      @topics = Topic.all

      if params[:publication_id].present?
        @show_pub = Pub.find(params[:publication_id])
      end
      if @topic.parents.present?
        @temp_topic = @topic.parents.first.id
      end
    end

    def admin
      @topics = Topic.all
    end

    def language_select
    end

    def classroom_doors
    end
end
