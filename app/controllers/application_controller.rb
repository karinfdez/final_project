class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

 
  protect_from_forgery with: :exception

 
 #configuration of parameter first_name and last_name
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_cache_headers

   # def after_sign_in_path_for(resource)
  	
   #  if resource.is_a?(Admin)
  	# 	# puts "Is the resource an admin?"
  	# 	# puts resource
  	# 	# puts Admin
  	# 	#redirect somewhere
  	# 	"/admins/index"
  	# else
  	# 	"/events"
  		
  	# end	
   # end

  def is_admin_user
    if current_user.present? && current_user.admin? == false
      redirect_to '/'
      return
    end
  end

    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name
      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:sign_up) << :password
    end

end
