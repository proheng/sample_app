class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index]  # protect user edit page from unauthenticated page
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user ,  :only => :destroy

  def index
    # WillPaginate.per_page = 10
    @users_result = User.paginate(:page => params[:page])
  end

  def show
    
    	@user_controller = User.find_by_id params[:id] # params is http request data 
    	#for debug on params, refer to application.html.erb
    	  
      redirect_to user_path(current_user) unless @user_controller

      @microposts = @user_controller.microposts.paginate(:page => params[:page])
      
      @title = @user_controller.name
     
      # if  @user_controller != current_user
      #   redirect_to user_path(current_user), :notice => "You have no permission."
      #   return
      # end   
  end
  
  def new
    if signed_in?
      redirect_to edit_user_path(current_user), :notice => "Please sign out befoer signing up"
    else
    	@user  = User.new
    	@title = "Sign Up"
    end
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

  def edit
    @title = "Edit User Profile"
    if signed_in? 
      @user = User.find_by_id(params[:id])
      # if current_user != @user
      #   redirect_to edit_user_path(current_user.id) , :notice => "You don't have permission to edit this user."
      # end
    else
      redirect_to signin_path, :notice => "Please login." 
    end 
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user.id), :notice => "Update success"
    else
      flash.now[:error] = "Update Fails";
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User destory"
    redirect_to users_path
  end

  private 


   

    def admin_user
      redirect_to root_path unless current_user.admin?
      @user = User.find_by_id(params[:id])
    end

end
