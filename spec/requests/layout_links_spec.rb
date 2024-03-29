require 'spec_helper'
#This is for integration test. Need to test it out base on URL not action in controller_spec

describe "LayoutLinks" do
  # describe "GET /layout_links" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get layout_links_index_path
  #     response.status.should be(200)
  #   end
  # end
  
  it "should have a Home page at '/'" do
      get '/'
      response.should have_selector 'title' , :content => "Home"
    end
    
    it  "should have a Contact page at '/contact'" do
      get '/contact'
      response.should have_selector 'title' , :content => "Contact"
    end
    
    it  "should have a About page at '/about'" do
      get '/about'
      response.should have_selector 'title' , :content => "About"
    end
    
    it  "should have a Help page at '/help'" do
      get '/help'
      response.should have_selector 'title' , :content => "Help"
    end
  
    it "should have a Signup page at '/signup'" do
      visit signup_path  # get '/signup' is alternative 
      response.should have_selector 'title', :content => "Sign Up"
    end
    
    # Make sure link is working
    it "should have the right links on the layout" do
      visit root_path
      response.should have_selector('title', :content=> "Home")
      click_link "About"
      response.should have_selector('title', :content=> "About")
      click_link "Contact"
      response.should have_selector('title', :content=>"Contact")
      # click_link "Sign up now!"
      #       response.should have_selector('title', :content=>"Sign Up")
    end
    
end
