class BookingsController < ApplicationController

  	before_filter :login_required
	before_filter :check_permissions
	before_filter :selected_tab
	layout 'default'
	
	def index
	  @bookings = current_user.bookings.order("created_at DESC")
	end
	
	def new
	  @booking = current_user.bookings.new
	end
	
	def create
	  @booking = current_user.bookings.new(params[:booking])
	  if @booking.valid?
	     @booking.status = '0'
	     @booking.save
		 redirect_to "/bookings"
	  else
	    render :new
	  end
	end
	
	def show
	  @booking = current_user.bookings.find(params[:id])
	end
	
	def edit
	end
	
	def update
	end	


	private
	
	def selected_tab
	   @select = "booking"
	end
	
	def check_permissions
	  unless current_user.is_passenger?
	    redirect_to "/home"
	  end
	end
	
end
