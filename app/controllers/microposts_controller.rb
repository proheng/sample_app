class MicropostsController < ApplicationController
	
	before_filter :authenticate
	
	def create

		@micropost = current_user.microposts.build params[:micropost] #not create which save db

		if @micropost.save
			redirect_to root_path, :flash => {:success => "Micropost Created!"}
		else 
			flash.now[:error] =  @micropost.errors.messages
			render 'pages/home' 
		end
	end

	def destroy
	end
end