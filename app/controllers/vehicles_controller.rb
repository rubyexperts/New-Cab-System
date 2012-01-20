class VehiclesController < ApplicationController

   	before_filter :login_required
	before_filter :check_permissions
	before_filter :selected_tab
	#layout 'default'
	
	layout 'company'

    def index
	   @vehicles = Vehicle.find :all
	end
	
	def new
	  @vehicle = Vehicle.new
	end
	
	def create
	  @vehicle = Vehicle.new(params[:vehicle])
	  if @vehicle.valid?
	    @vehicle.save
		redirect_to vehicles_path
	  else
        render :new
	  end
	end
	
	def edit
	 @vehicle = Vehicle.find(params[:id])
	end
	
	def update
	  @vehicle = Vehicle.find(params[:id])
	  if @vehicle.update_attributes(params[:vehicle])
	    redirect_to vehicles_path
	  else
	    render :edit
	  end
	end
	
	def destroy
	  @vehicle = Vehicle.find(params[:id])
	  @vehicle.destroy
	  redirect_to vehicles_path
	end
		
	
	private
	
    def selected_tab
	  @select = "vehicles"
	end

	def check_permissions
	  unless current_user.is_company?
		redirect_to "/home"
	  end
	end
	
end
