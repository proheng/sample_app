class User < ActiveRecord::Base
	attr_accessible :email, :name


	validates :name, 	:presence => true,
						:length	  => { :maximum => 50 }

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #http://rubular.com/
	validates :email,   :presence 	=> true,
    					:format   	=> { :with => email_regex },
    					:uniqueness => { :case_sensitive => false }
end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

