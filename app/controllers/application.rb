# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_folvhp_session_id'
  
  private
  
  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in"
      redirect_to(:controller => "user", :action => "login")
    end
  end
  
  def determine_layout
    if params[:action] != "rss"
      if params[:controller] == "page" and (params[:action] == "new" or params[:action] == "edit")
        "admin_page"
      else
        if params[:action] != "index" and params[:action] != "view" and params[:action] != "login"
          "admin"
        else
          "application"
        end   
      end
    end
  end
  
end
