class PagesController < ApplicationController
	
	def show
		# This will send every url that matches /pages/ to the pages controller 
		 render template: "pages/#{params[:page]}"
    end

    def about
    	render 'about'
    end

    def gallery
    	render 'gallery'
    end
end
