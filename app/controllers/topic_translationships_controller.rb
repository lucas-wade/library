class TopicTranslationshipsController < ApplicationController

  def create
    @parent_topic = Topic.find(params[:original_id])
    current_topic.translation_of(@parent_topic)

    respond_to do |format|
      format.html { redirect :back }
      format.js
    end

  end

  def destroy
    @parent_topic = TopicTranslationship.find(params[:id]).original
    current_topic.not_translation_of(@parent_topic)
    respond_to do |format|
      format.html { redirect :back }
      format.js
    end
  end

end
