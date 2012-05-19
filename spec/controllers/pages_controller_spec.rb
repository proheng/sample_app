require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET Rex's  'home' page" do
    it "returns http success" do
      get 'home' # actual function syntax
      response.should be_success
    end
    
    it "Res says 'it should have the right title'" do
      get 'home'
      response.should have_selector("title",:content => "Rex Ruby on Rails Learning")
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
       response.should have_selector("title",:content => "Rex Ruby on Rails Learning")
    end
  end

  describe "Rex to GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
    it "Res says 'it should have the right title'" do
       get 'about'
       response.should have_selector("title",:content => "Rex Ruby on Rails Learning")
    end
  end
  
end
