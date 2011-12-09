class HomeController < ApplicationController

    before_filter :login_required
    layout 'default'

    def index
      @select = "home"
	end
	
end
