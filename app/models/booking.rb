class Booking < ActiveRecord::Base

    belongs_to :user
	
	validates :pickup_address, :presence => true, :length => { :maximum => 500 }
	validates :drop_address, :presence => true, :length => { :maximum => 500 }
	
	
	def current_status
	  if self.status == 0
	    "Waiting For Driver to Accept"
	  elsif self.status == 1
	    "Collection in Progress"
	  elsif self.status == 2
	    "Collected"
	  elsif self.status == 3
	    "Rejected"
	  end
	end

	def is_pending?
	  self.status == 0
	end

	def is_progress?
	  self.status == 1
	end

	def is_collected?
	  self.status == 2
	end

	def is_rejected?
	  self.status == 3
	end



end
