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

user_auth     = Role.create(name: "registered_user")
company_auth  = Role.create(name: "company_admin")
platform_auth = Role.create(name: "platform_admin")

registered_user  = User.create(username: "josh@turing.io", password: "password")
company_admin    = User.create(username: "andrew@turing.io", password: "password")
platform_admin   = User.create(username: "jorge@turing.io", password: "password")

registered_user.roles << user_auth
company_admin.roles   << user_auth << company_auth
platform_admin.roles  << user_auth << company_auth << platform_auth

company_admin.company = Company.create(name: "Carmer's Cupcakery",
information: Faker::Lorem.paragraphs(2))

50.times do |n|
  jobs          = Job.create(title: Faker::Hacker.adjective,
                             description: Faker::Lorem.paragraphs(3),
                             location: Faker::Address.city)
  jobs.category = Category.find(rand(1..Category.count))
  company_admin.company.jobs << jobs
end

10.times do |n|
  username       = Faker::Name.name
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  user = User.create!(username: "username#{n}", password: "password")
  user.company = Company.create!(name: name, information: information)
  50.times do |n|
    title          = Faker::Hacker.adjective
    description    = Faker::Lorem.paragraphs(3)
    created_at     = Faker::Time.between(2.days.ago, Time.now)
    location       = Faker::Address.city
    job            = Job.create!(
                       title:       title,
                       description: description,
                       location:    location,
                       created_at:  created_at,
                       )
    job.category   = Category.find(rand(1..Category.count))

    user.company.jobs << job
  end
end
