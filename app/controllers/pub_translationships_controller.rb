class PubTranslationshipsController < ApplicationController
  def create
    @original_pub = Pub.find(params[:original_id])
    current_pub.translation_of(@original_pub)

    respond_to do |format|
      format.html { redirect :back }
      format.js
    end

  end

  def destroy
    @original_pub = PubTranslationship.find(params[:id]).original
    current_pub.not_translation_of(@original_pub)
    respond_to do |format|
      format.html { redirect :back }
      format.js
    end
  end

end
