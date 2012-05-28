module PagesHelper

	TITLE_HELP = "Module Reference | Rex Constant Title | in PagesHelper"

	def title_help

		#Define general page title
		base_title = "Rex Ruby on Rails Learning"
		if(@title.nil?)
			base_title
		else
			base_title = "Rex Ruby on Rails Learning | #{@title}"
		end
	end
end
