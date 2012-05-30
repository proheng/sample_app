class User < ActiveRecord::Base
	attr_accessor	:password,:password_confirmation		#normal ruby class attribute not belong to ActiveRecord
	attr_accessible :email, :name, :password, :password_confirmation
	#NB: the :password and :password_confirmation are put in attr_accessor for Rspec user_spec.rb testing
	#NB: there is another field called encrypted_password is not accessible

	validates :name, 	:presence => true,
						:length	  => { :maximum => 50 }

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #http://rubular.com/
	validates :email,   :presence 	=> true,
    					:format   	=> { :with => email_regex },
    					:uniqueness => { :case_sensitive => false }
 
	validates :password, :presence	=> true,
						 :confirmation	=> true, #with this field, rails will create a extra field can {field_name}_confirmation. In this case, it created password_confirmation
					 	 :length => { :in => 6..40 } #with range
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
#

