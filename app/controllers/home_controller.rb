class HomeController < ApplicationController

    before_filter :login_required
   # layout 'default'
   # layout 'passenger'

    def index
      if current_user.type == "Passenger"
        render :layout => 'passenger'
      elsif current_user.type == "Driver"
        render :layout => 'driver'
      elsif current_user.type == "Company"
        render :layout => 'company'
      end 
	end
	
end
