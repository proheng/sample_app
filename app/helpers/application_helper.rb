module ApplicationHelper
  
  TITLE_HELP = "Module Reference |Rex Constant Title | in ApplicationHelper"

  def ApplicationHelper.title_help #can be defined without module name. invoke it with module name
    
    #Define general page title
    base_title = "Rex Ruby on Rails Learning"
    if(@title.nil?)
      base_title
    else
      base_title = "Rex Ruby on Rails Learning | #{@title}"
    end
  end
  
  def logo #can be defined as ApplicationHelper.logo, and invoke it as ApplicationHelper.logo
     image_tag("logo.png", :alt => "Sample App", :class => "round") 
  end
  
end
