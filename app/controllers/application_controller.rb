class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    private
  
    helper_method :current_user, :logged_in?

    def current_user
   
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
 


    def logged_in?
     
        !!current_user
    end  

    
    
    def required_user
      if !logged_in? 
        flash[:alert] = "Login first to perform this action"
        redirect_to login_path
      end  
    end 
    
    

  end
  