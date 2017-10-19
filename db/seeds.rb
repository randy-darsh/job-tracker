require 'faker'

Company.destroy_all
Job.destroy_all
Category.destroy_all
Contacts.destroy_all
Comments.destroy_all

COMPANIES = ["ESPN"]
10.times {COMPANIES << Faker::Company.name}
JOBS = []
20.times {JOBS << Faker::Job.field}
CITIES = []
10.times {CITIES << Faker::Witcher.location}
CATEGORIES = ["Lame", "Not Lame", "Hella Cool", "Not Hella Cool", "Boring", "Not Boring", "Great", "Not Great"]
COMMENTS = []
200.times {COMMENTS << Faker::TheFreshPrinceOfBelAir.quote}
CONTACT_NAME = []
30.times {CONTACT_NAME << Faker::Witcher.character}
CONTACT_POSITION = []
30.times {CONTACT_POSITION << Faker::Witcher.monster}
CONTACT_EMAIL = []
30.times {CONTACT_EMAIL << Faker::Internet.email}
DESCRIPTION = []
30.times {DESCRIPTION << Faker::Hacker.say_something_smart}

CATEGORIES.each do |title|
  @category = Category.create!(title: title)
  puts "Created #{@category.title}"
end


COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: DESCRIPTION.sample, level_of_interest: num + rand(100), city: CITIES.sample, category: Category.all.sample)
    puts "  Created #{company.jobs[num].title}"
  end
end

COMMENTS.each do |content|
  @comment = Comment.create!(content: content, job: Job.all.sample) 
  puts "Created #{@comment.content}"
end

50.times do 
  @contact = Contact.create!(full_name: CONTACT_NAME.sample, position: CONTACT_POSITION.sample, email: CONTACT_EMAIL.sample, company: Company.all.sample)
  puts "Created #{@contact.full_name}"
end
