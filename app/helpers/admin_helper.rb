module AdminHelper
  def edit_mode
   if current_user && @current_user.admin == TRUE
     session[:edit_mode]
   else
     FALSE
   end
  end
end
