module ApplicationHelper
  
  def title_help
    
    #Define general page title
    base_title = "Rex Ruby on Rails Learning"
    if(@title.nil?)
      base_title
    else
      base_title = "Rex Ruby on Rails Learning | #{@title}"
    end
  end
  
  def logo
     image_tag("logo.png", :alt => "Sample App", :class => "round") 
  end
  
end
