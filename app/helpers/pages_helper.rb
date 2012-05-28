module PagesHelper

	TITLE_HELP = "Module Reference | Rex Constant Title | in PagesHelper"

	#This is in a higher piority than another title_help in ApplicationHelper
	def title_help 

		#Define general page title
		base_title = "Rex Ruby on Rails Learning | PagesHelper"
		if(@title.nil?)
			base_title
		else
			base_title = "Rex Ruby on Rails Learning | #{@title} | PagesHelper"
		end
	end
end
