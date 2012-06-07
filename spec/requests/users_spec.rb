require 'spec_helper'

describe "Users" do
	describe "signup" do
		describe "failure" do
			it "should not make a new user" do
				lambda do
					visit signup_path
					fill_in "Name" , 		:with => "" #label name 
					fill_in "Email address",:with => ""
					fill_in "Password", 	:with => ""
					fill_in "Confirmation", :with => ""
					click_button
					response.should render_template 'users/new' 
					response.should have_selector "div#error_explanation"
				end.should_not change(User, :count)
			end
		end

		describe "success" do
			it "should make a new user" do
				lambda do
					visit signup_path
					fill_in "Name" , 		:with => "Rex" #label name 
					fill_in "Email address",:with => "proheng@me.com"
					fill_in "Password", 	:with => "123123"
					fill_in "Confirmation", :with => "123123"
					click_button
					# response.should assert_select ".success" , :content => 'welcome'
					response.should render_template 'users/show'  #althought it is redirect. It just monitor server side action
				end.should change(User, :count)
			end
		end
	end
end
