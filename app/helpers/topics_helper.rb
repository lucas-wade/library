module TopicsHelper

  def current_topic
    @topic ||= Topic.find(params[:id])
  end

  def tab_active(t)
     if t.main_content == nil || t.main_content == '' && t.placeholder == FALSE && t.growing == FALSE
         the_class = 'tab-cat' + t.category.to_s + ' tab-greyed-out'
       else
         the_class = 'tab-cat' + t.category.to_s
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
