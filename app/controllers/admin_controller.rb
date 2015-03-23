class AdminController < ApplicationController


  def edit_toggle
    if $edit_mode && $edit_mode==1
      $edit_mode=0
    else
      $edit_mode=1
      end
    redirect_back_or(home_path)

  end

end
