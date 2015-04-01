module PubsHelper
  def current_pub
    @pub ||= Pub.find(params[:id])
  end
end


