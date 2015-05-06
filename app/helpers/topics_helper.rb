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


end
