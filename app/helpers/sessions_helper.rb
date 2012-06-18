module SessionsHelper
#by default the model helper is ONLY available in view NOT controller
#to make it available in view, include it in ApplicationController
	def sign_in user
		# cookies[:remember_token]  = { :value => user.id, :expires => 20.years.from_now.utc }
		cookies.permanent.signed[:remember_token] = [user.id , user.salt] 
		#this .signed can encrypt the cookie content and store cookie in array format
		current_user= user

	end 

	def current_user=(user)
		@current_user = user		
	end

	def current_user
		@current_user ||= user_from_remember_token # ||= mean assigning to first variable for the first time 
		
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		cookies.delete(:remember_token)
		current_user= nil	
		puts @current_user.inspect
		# raise current_user
	end

    def deny_access
    	store_location
	    redirect_to signin_path , :notice => "Please login now."
    end

    def store_location
    	session[:return_to] = request.fullpath	# session
    end

    def redirect_to_back_or(default)
    	redirect_to(session[:return_to]||default)
    	clear_return_to
    end

    def clear_return_to
    	session[:return_to] = nil
    end

	private
		def user_from_remember_token
			User.authenticate_with_salt *remember_token # * round the array 
		end
		def remember_token
			cookies.signed[:remember_token] || [nil,nil]
		end
end
