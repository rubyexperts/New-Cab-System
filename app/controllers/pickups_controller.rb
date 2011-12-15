class PickupsController < ApplicationController

    before_filter :login_required
	before_filter :check_permissions
	layout 'default'


	def index
	  @select = "pickups"
	  pick_bookings = Booking.find(:all, :conditions => ['status != ? and accepted_by = ?', 2, 0] )
	  progress_bookings = Booking.find(:all, :conditions => ['accepted_by = ?', current_user.id] )
	  @bookings = pick_bookings.concat(progress_bookings).uniq
	end

	def show
	  @select = "pickups"
	  @booking = Booking.find(params[:id])
	end

	def accept_booking
	  @booking = Booking.find(params[:id])
	  if params[:commit] == "Accept"
	   	@booking.status = 1
		@booking.accepted_by = current_user.id
	  elsif params[:commit] == "Collect"
	    @booking.status = 2
		@booking.collected_by = current_user.id
	  elsif params[:commit] == "Reject"
	    @booking.status = 3
		@booking.rejected_by = current_user.id
	  end
	  @booking.save
	  redirect_to "/pickups/#{@booking.id}"
	end

	def collected
	  @select =  "collected"
      @bookings = Booking.find(:all, :conditions => ['status = ? and collected_by = ?', 2, current_user.id ] )
	end

	private

	def check_permissions
	  unless current_user.is_driver?
		redirect_to "/home"
	  end
	end
	
end
