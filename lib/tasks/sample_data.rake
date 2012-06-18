require 'faker'

namespace :db do 
	desc "Fill database with sample data"
	task :populate => :environment do  # $rake db:populate
		Rake::Task['db:reset'].invoke # equivalent to $rake db:reset
		User.create!(:name => "example user",
					:email => "example@gmail.com",
					:password => "foobar",
					:password_confirmation => "foobar")

		99.times do |n|
			name                  = Faker::Name.name
			email                 = "rex-#{n+1}@gomeeki.com"
			password              = "password"
			password_confirmation = "password"
			puts User.create!(:name => name,
					:email => email,
					:password => password,
					:password_confirmation => password_confirmation).inspect
		end

	end
end