class UsersController < ApplicationController

  def show
  	@user_controller = User.find_by_id params[:id] # params is http request data 
  	#for debug on params, refer to application.html.erb
  	@title = @user_controller.name
  end
  
  def new
    @title = "Sign Up"
  end

end
