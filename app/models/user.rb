class User < ActiveRecord::Base
	attr_accessor	:password#,:password_confirmation		#normal ruby class attribute not belong to ActiveRecord
	attr_accessible :email, :name, :password, :password_confirmation
	#NB: the :password and :password_confirmation are put in attr_accessor for Rspec user_spec.rb testing
	#NB: attr_accessible in rails Active Record http://stackoverflow.com/questions/1789996/attr-accessible-in-rails-active-record

	validates :name, 	:presence => true,
						:length	  => { :maximum => 50 }

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #http://rubular.com/
	validates :email,   :presence 	=> true,
    					:format   	=> { :with => email_regex },
    					:uniqueness => { :case_sensitive => false }
 
	validates :password, :presence	=> true,
						 :confirmation	=> true, #with this field, rails will create a extra field can {field_name}_confirmation under attr_accessor. In this case, it created password_confirmation
					 	 :length => { :in => 6..40 } #with range

	
	before_save :encrypt_password #the callback method, calling on a method called encrypted_password 

	def User.authenticate email, submitted_password 
		# or can be call self.authenticate !!!!!! 
		#self.method_name means the method is class methods not instance methdos. !!!! 
		#different from self.variable_name is instance variable
		#alternatively, can put class method as following, class level methods
		##class << self
		## def method_name
		## end
		##end
		
		user = find_by_email email
		(user && user.has_password?(submitted_password))? user : nil

		# return nil if user.nil?
		# return user if user.has_password? submitted_password
	end

	def has_password? submitted_password
		self.encrypted_password == encrypt(submitted_password)
	end

	def User.authenticate_with_salt id , cookie_salt
		user = User.find_by_id(id)
		(user && user.salt == cookie_salt )? user : nil
	end

	private
		def encrypt_password
			self.salt               = make_salt if new_record? #if it is new record
			self.encrypted_password = encrypt(self.password) # keyword self, call upon the method or variable inside the class 
		end

		def encrypt string
			secure_hash "#{self.salt}--#{string}"
		end

		def secure_hash string
			Digest::SHA2.hexdigest string
		end

		def make_salt
			secure_hash "#{Time.now.utc}--#{self.password}"
		end
end
# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#  salt               :string(255)
#

