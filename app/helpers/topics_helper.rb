module TopicsHelper

  def current_topic
    @topic ||= Topic.find(params[:id])
  end

  def tab_active(t)
     if t.main_content == nil || t.main_content == '' && t.placeholder == FALSE && t.growing == FALSE
         the_class = 'tab-cat' + t.category.to_s + ' tab-greyed-out'
     else if t.id == @topic.id
            the_class = 'tab-cat' + t.category.to_s + ' tab-active'
       else
         the_class = 'tab-cat' + t.category.to_s
          end
     end

  end

  def rtl_checker(t = @topic.language)
    if t.to_s == 'ar'
      rtl_class = 'rtl'
    else
      rtl_class = ''
    end
  end

  def show_topic_first_parent_or_self
    if @topic.parents.first.present?
      @topic.parents.first
    else
      @topic
    end
  end

  def setup_active_menu_buttons
    @active_column = top_parent(@topic)
    @active_main_menu = top_topic(@topic)
    @active_sub_menu = active_sub_menu(@topic)
  end

  def top_parent(t)
    if t.parents.first.present?
      top_parent(t.parents.first)
      #t.parents.first
    else
      t
    end
  end

  def top_topic(t)
    if t.parents.first.present? && t.parents.first.id > 3
      top_topic(t.parents.first)
    else
      t
    end
  end

  def active_sub_menu(t)
    if t.parents.first.present? && t.parents.first.id != @active_main_menu.id
      active_sub_menu(t.parents.first)

    else
      t
    end
  end


  def col_finder
    t = self.parents.first || self
    while t.parents.present?
      t = t.parents.first
    end
    if t.id.present?
      t.id
    else
      1
    end
  end


end
