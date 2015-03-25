module TopicsHelper

  def current_topic
    @topic ||= Topic.find(params[:id])
  end

end
