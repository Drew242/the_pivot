Category.create(name: "development")
Category.create(name: "infrastructure")
Category.create(name: "design")


Company.create!(name: 'Example Company',
                information: 'Example company has been in
                business for nearly a century and is considered
                by many to be THE name in examples. We pride
                ourselves on our ability to create analogies,
                metaphors, and eliminate confusion through
                abstraction. Come to Example company if you
                believe your literary ability is up to snuff.')

99.times do  |n|
  name = Faker::Company.name
  information = Faker::Lorem.paragraphs(2)
  Company.create!(name: name, information: information)
end

Job.create!(title:        "Example Job",
             description: "example of job info",
             created_at:  Time.now,
             category_id: 3,
             company_id:  3,
             location:    "Denver, CO")

99.times do |n|
  title        = Faker::Name.name
  description  = Faker::Lorem.paragraphs(3)
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
