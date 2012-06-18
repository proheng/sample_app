class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  	render :new # by default, this will be called as in the same name method
  end

  def create
  	user = User.authenticate params[:session_name][:email], params[:session_name][:password]
  	if user.nil? 
  		# flash.[:error] = "Fail to signin (Invalid password email combination)";  
  		# flash will be kept until the the first redirect. render is not counted.
  		# but the trick is using flash.now[:error]
  		flash.now[:error] = "Fail to signin (Invalid password email combination)";  
  		# redirect_to signin_path
  		
  		# render :new or self.new
  		self.new
  	else
  		#Handle successfully sign in
      sign_in user
      redirect_to_back_or user
      clear_return_to
  	end
  	
  end

  def destory
    sign_out
    redirect_to root_path
  end
end
