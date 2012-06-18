class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper #helper is not available to controller, only to view by default.

end
