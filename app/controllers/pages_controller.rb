class PagesController < ApplicationController
    def home
      if logged_in?
        # Redirect to a specific path when logged in, for example:
        redirect_to articles_path
      end
    end
  
    def about
    end
  end
  