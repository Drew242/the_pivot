Category.create(name: "Open Source")
Category.create(name: "System Admin")
Category.create(name: "Project Management")
Category.create(name: "Full Stack")
Category.create(name: "Network Admin")
Category.create(name: "Support")
Category.create(name: "Front End")
Category.create(name: "Web Development")
Category.create(name: "Database")
Category.create(name: "Graphic Design")

# user_auth     = Role.create(name: "registered_user")
# company_auth  = Role.create(name: "company_admin")
# platform_auth = Role.create(name: "platform_admin")
#
# registered_user  = User.create(username: "josh@turing.io", password: "password")
# company_admin    = User.create(username: "andrew@turing.io", password: "password")
# platform_admin   = User.create(username: "jorge@turing.io", password: "password")
#
# registered_user.roles << user_auth
# company_admin.roles   << company_auth
# platform_admin.roles  << platform_auth

50.times do  |n|
  name = Faker::Company.name
  information = Faker::Lorem.paragraphs(2)
  Company.create!(name: name, information: information)
end

600.times do |n|
  title        = Faker::Hacker.adjective
  description  = Faker::Lorem.paragraphs(3)
  created_at   = Faker::Time.between(2.days.ago, Time.now)
  category_id  = Faker::Number.between(1, 10)
  company_id   = Faker::Number.between(1, 50)
  location     = Faker::Address.city
  Job.create!(title:        title,
               description: description,
               created_at:  created_at,
               category_id: category_id,
               company_id:  company_id,
               location:    location)
end

Job.bulk_update_fuzzy_title
Job.bulk_update_fuzzy_location
