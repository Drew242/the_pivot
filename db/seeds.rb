Category.create(name: "development")
Category.create(name: "infrastructure")
Category.create(name: "design")

Job.create!(title:        "Example Job",
             description: "example of job info",
             created_at:  Time.now,
             category_id: 3,
             location:    "Denver, CO")

99.times do |n|
  title        = Faker::Name.name
  description  = "example-#{n+1}"
  created_at   = Faker::Time.between(2.days.ago, Time.now)
  category_id  = Faker::Number.between(1, 3)
  Job.create!(title:        title,
               description: description,
               created_at:  created_at,
               location: Faker::Address.city)
end
