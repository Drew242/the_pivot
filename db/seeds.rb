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
  company_admin.company.jobs.create(title: Faker::Hacker.adjective,
                                           description: Faker::Lorem.paragraphs(3),
                                           location: Faker::Address.city)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user         = User.create!(username: username, password: password)
  @user.company = Company.create!(name: name, information: information)
  @user.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user1         = User.create!(username: username, password: password)
  @user1.company = Company.create!(name: name, information: information)
  @user1.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user2         = User.create!(username: username, password: password)
  @user2.company = Company.create!(name: name, information: information)
  @user2.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user3         = User.create!(username: username, password: password)
  @user3.company = Company.create!(name: name, information: information)
  @user3.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user4         = User.create!(username: username, password: password)
  @user4.company = Company.create!(name: name, information: information)
  @user4.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user5         = User.create!(username: username, password: password)
  @user5.company = Company.create!(name: name, information: information)
  @user5.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user6         = User.create!(username: username, password: password)
  @user6.company = Company.create!(name: name, information: information)
  @use6.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user7         = User.create!(username: username, password: password)
  @user7.company = Company.create!(name: name, information: information)
  @user7.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user8         = User.create!(username: username, password: password)
  @user8.company = Company.create!(name: name, information: information)
  @user8.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

50.times do |n|
  name           = Faker::Company.name
  information    = Faker::Lorem.paragraphs(2)
  username       = Faker::Name.name
  password       = Faker::Name.name
  title          = Faker::Hacker.adjective
  description    = Faker::Lorem.paragraphs(3)
  created_at     = Faker::Time.between(2.days.ago, Time.now)
  location       = Faker::Address.city
  @user9         = User.create!(username: username, password: password)
  @user9.company = Company.create!(name: name, information: information)
  @user9.company.jobs.create(title: title,
                           description: description,
                           location: location,
                           created_at: created_at)
end

Job.bulk_update_fuzzy_title
Job.bulk_update_fuzzy_location
