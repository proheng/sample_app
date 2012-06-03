require 'spec_helper'

describe UsersController do
  render_views

  describe "GET show" do

    before :each do
      @user = FactoryGirl.create :user_fixture
    end

    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user # the effect is exactly same as above, rails will look for id in @user
      assigns(:user_controller).inspect #reach inside the user controller
      assigns(:user_controller).should == @user # :user is get from controller
    end

    it "should have the right title" do
      get :show, :id => @user
      puts @user.name
      response.should have_selector('title', :content => @user.name)
    end

    it "should have the user's name" do
      get :show, :id => @user
      response.should have_selector :h1, :content => @user.name  # :h1 is as same as 'h1'
    end

    it "should have the profile image" do
      get :show, :id => @user 
      response.should have_selector "h1>img", :class => "gravatar"
    end

    it "should have the right URL" do
      get :show, :id => @user
      response.should have_selector "a",  :content  => user_path(@user), 
                                          :href     => user_path(@user)
    end
     
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
    
    it "should have the right titile" do
      get 'new' #action name
      response.should have_selector('title', :content => "Sign Up")
    end
  end

end
