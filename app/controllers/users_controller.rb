class UsersController < ApplicationController

   skip_before_filter :login_required, :only => [:new, :create, :confirmation_needed]

   def new
	 @user = User.new
   end

   def create
	 @user = User.new(params[:user])
	 if @user.valid? && @user.save
	   redirect_to :action => :confirmation_needed, :controller => :confirmations
	 else
	   render 'new'
	 end
   end
   
end
