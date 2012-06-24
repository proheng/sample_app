class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :user_id, :presence => true
  validates :content, :presence => true,
  					  :length   => { :maximum => 140 }

  default_scope :order => "microposts.created_at DESC" 
  # making sure the microposts will be pulled out from db in that order 
  #Use this macro in your model to set a default scope for all operations on the model.
  #example:
	# class Article < ActiveRecord::Base
	#   default_scope where(:published => true)
	#   default_scope where(:rating => 'G')
	# end

	# Article.all # => SELECT * FROM articles WHERE published = true AND rating = 'G'
 
  self.per_page = 5
end
# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

