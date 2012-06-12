module SessionsHelper
#by default the model helper is ONLY available in view NOT controller
#to make it available in view, include it in ApplicationController
	def sign_in user
		# cookies[:remember_token]  = { :value => user.id, :expires => 20.years.from_now.utc }
		cookies.permanent.signed[:remember_token] = [user.id , user.salt] 
		#this .signed can encrypt the cookie content and store cookie in array format
		current_user = user
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
		self.current_user = nil
	end

	private
		def user_from_remember_token
			User.authenticate_with_salt *remember_token # * round the array 
		end
		def remember_token
			cookies.signed[:remember_token] || [nil,nil]
		end
end
