require 'spec_helper'

describe PagesController do
  render_views
  
  before :each do
    @base_title = "Rex Ruby on Rails Learning | "
  end
  
  describe "GET Rex's  'home' page" do
    it "returns http success" do
      get 'home' # actual function syntax
      response.should be_success
    end
    
    it "Res says 'it should have the right title'" do
      get 'home'
      response.should have_selector("title",:content => "#{@base_title}Home")
    end
    
    it "should not have empty body" do 
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/ # This is use regular expression. =~ is match
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
    it "Res says 'it should have the right title'" do
       get 'contact'
       response.should have_selector("title",:content =>  "#{@base_title}Contact")
    end
  end

  describe "Rex to GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
    it "Res says 'it should have the right title'" do
       get 'about'
       response.should have_selector("title",:content =>   "#{@base_title}About")
    end
  end
  
  describe %(Rex to Get "help") do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'help'
      response.should have_selector 'title', :content => "#{@base_title}Help" 
    end
  end
  
  
end
