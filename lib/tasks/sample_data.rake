require 'faker'

namespace :db do 
	desc "Fill database with sample data"
	task :populate => :environment do  # $rake db:populate
		Rake::Task['db:reset'].invoke # equivalent to $rake db:reset
		user = User.create!(:name => "rex he",
					:email => "prohenghzh@gmail.com",
					:password => "123123",
					:password_confirmation => "123123")

		user.toggle! :admin

		10.times do |n|
			name                  = Faker::Name.name
			email                 = "rex-#{n+1}@gomeeki.com"
			password              = "password"
			password_confirmation = "password"
			User.create!(:name => name,
					:email => email,
					:password => password,
					:password_confirmation => password_confirmation).inspect
		end

		User.all(:limit => 6).each do |user| 
			50.times do 

				user.microposts.create!(:content => Faker::Lorem.sentence(5))
			end
		end

	end
end