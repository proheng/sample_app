class UsersController < ApplicationController

  def show
    
    	@user_controller = User.find_by_id params[:id] # params is http request data 
    	#for debug on params, refer to application.html.erb
    	@title = @user_controller.name
      
      if(!signed_in?)
        redirect_to signin_path, :notice => "Please login."
        return 
      end

      if  @user_controller != current_user
        redirect_to user_path(current_user), :notice => "You have no permission."
        return
      end
    
  end
  
  def new
	@user  = User.new
	@title = "Sign Up"
  end

  def create
  	# raise params[:user].inspect #var_dump();exit;
  	@user = User.new params[:user]
  	if @user.save
      sign_in @user
  		#Handle a successful save.
      # flash[:success] = "Welcome to the sample app"
      redirect_to user_path(@user) , :flash =>  { :success => "Welcome to the sample app" }
      #!!!CANNOT render here!
      #There is an important difference between render and redirect_to: render will tell Rails what view it should use (with the same parameters you may have already sent) but redirect_to sends a new request to the browser.
      #http://en.wikibooks.org/wiki/Ruby_on_Rails/ActionView/Rendering_and_Redirecting
  	else
		  @title = "Sign Up"
	  	render 'new'
  	end
  end
end
