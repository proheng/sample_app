FactoryGirl.define do
	factory :user_fixture, class: User do 
		name					"Rex Factory Girl"
		sequence(:email) 		{|n| "person#{n}@example.com" }
		password 				"foobar"
		password_confirmation  	"foobar"
	end
end 