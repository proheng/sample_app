class UsersController < ApplicationController
  def new
    @title = "Sign Up"
  end

  def show
  	@user = User.find_by_id params[:id] # params is http request data 
  	#for debug on params, refer to application.html.erb
  end
end
