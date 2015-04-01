class PubTopicRelationshipsController < ApplicationController



  before_action :logged_in_user

  def create
    #if params[:parent_id].present?
    # @parent_topic = Topic.find(params[:parent_id])
    #else
    @parent_topic = Topic.find(params[:id])
    end
    #@user = User.find(params[:followed_id])
    #current_user.follow(@user)

    current_pub.make_parent(@parent_topic)

    #@family = current_topic.build(:parent_id => params[:parent_id])
    if @family.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end


  def edit
    #@family = current_topic.parent_families.find(params[:id])
  end


  def destroy

    #active_relationships.find_by(:parent_id => params[:parent_id]).destroy
    @family = Family.find(params[:id])
    @topic = Topic.find(@family.kid_id)
    #@topic.remove_parent(@family)
    @family.destroy

    #@fam = Family.find(params[:parent_id]).parent_id.destroy
    #@fam.destroy

    #remove_parent(@fam)
    flash[:notice] = "Removed parent."
    redirect_to root_path
  end




# from relationships
  before_action :logged_in_user

  def cdogreate
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end



end
