class DriversController < ApplicationController

   	before_filter :login_required
	before_filter :check_permissions
	before_filter :selected_tab
	#layout 'default'
	layout 'company'

    def index
	  @drivers = Driver.find :all
	end

	def new
	  @driver = Driver.new
	end

	def create
	  @driver = Driver.new(params[:driver])
	  if @driver.valid?
	     @driver.save
		 redirect_to drivers_path
	  else
	    render :new
	  end
	end
	
	def show
	  @driver = Driver.find(params[:id])
	end

	def edit
	  @driver = Driver.find(params[:id])
	end

	def update
	  @driver = Driver.find(params[:id])
	  if @driver.update_attributes(params[:driver])
		redirect_to drivers_path
	  else
		render :edit
	  end
	end

	def destroy
	  @driver = Driver.find(params[:id])
	  @driver.destroy
	  redirect_to drivers_path
	end
	
	def reports
	  @bookings = Booking.find(:all, :conditions => ['status = ?', 2 ])	  
	end
	
	
	private
	
    def selected_tab
	  @select = "drivers"
	end

	def check_permissions
	  unless current_user.is_company?
		redirect_to "/home"
	  end
	end
	
	
end

