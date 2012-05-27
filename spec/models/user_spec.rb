require 'spec_helper'

describe User do

	before(:each) do
		@attr = {:name => "Rex", :email => "proheng@me.com"}
	end

	it "should create a new instance given a valid attribute" do
		User.create! @attr
	end

	it "should require a name in new method" do 
		no_name_user = User.new @attr.merge({:name => ""})
		no_name_user.should_not be_valid 
		#be_valid be_something call a boolean method on object
		#in this case, calling valid? on no_name_user

		no_name_user.save
		no_name_user.errors.size.should == 1  	
			
		no_name_user = User.create  @attr.merge({:name => ""})
		no_name_user.should_not be_valid 

	end

	it "should require an email address" do
		no_email_user = User.new @attr.merge({:email => ""})
		no_email_user.should be_invalid 
	end

	it "should reject names that are too long" do
		long_name = "a" * 51
		long_name_user = User.new @attr.merge(:name => long_name)
		long_name_user.should_not be_valid
	end

	it "should accept valid email addresses" do
		addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp] 
		addresses.each do |address|
			valid_email_user = User.new (@attr.merge(:email => address))
			valid_email_user.should be_valid
		end
	end

	it "should reject invalid email addresses" do
		addresses = %w[user@foo,com THE_USER_at_foo.bar.org first.last@foo.] 
		addresses.each do |address|
			valid_email_user = User.new (@attr.merge(:email => address))
			valid_email_user.should_not be_valid
		end
	end

	it "should reject duplicate email address" do
		User.create! @attr
		user_with_duplicate_email = User.new @attr
		user_with_duplicate_email.should_not be_valid
	end

	it "should reject email addressese identical up to case" do
		upcased_email = @attr[:email].upcase
		User.create! @attr.merge(:email => upcased_email)
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end

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
