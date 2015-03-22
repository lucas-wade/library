class FamiliesController < ApplicationController
  def create
    @family = current_topic.build(:parent_id => params[:parent_id])
    if @family.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end



=begin
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
=end

end