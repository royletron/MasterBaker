require 'faker'
namespace :db do
  desc "Fill database with sample data" 
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                 :email => "darren.royle@oup.com",
                 :password => "lambch0p",
                 :password_confirmation => "lambch0p")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org" 
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end 
  end
end