Category.create(name: "development")
Category.create(name: "infrastructure")
Category.create(name: "design")

Job.create!(title:        "Example Job",
             description: "example of job info",
             created_at:  Time.now,
             category_id: 3,
             company_id:  3,
             location:    "Denver, CO")

99.times do |n|
  title        = Faker::Name.name
  description  = Faker::Lorem.word
  created_at   = Faker::Time.between(2.days.ago, Time.now)
  category_id  = Faker::Number.between(1, 3)
  company_id   = Faker::Number.between(1, 50)
  location     = Faker::Address.city
  Job.create!(title:        title,
               description: description,
               created_at:  created_at,
               category_id: category_id,
               company_id:  company_id,
               location:    location)
end
