require 'faker'

unless User.find_by(email: 'admin@admin.com')
  User.create(email: 'admin@admin.com', first_name: 'admin', last_name: 'user',
              role: 'admin', password: 'admin', password_confirmation: 'admin')
end

def random_email_domain
  %w[gmail.com yahoo.com hotmail.com example.com test.com].sample
end

SOFTWARE_TECHNOLOGIES = [
  'Ruby', 'Ruby on Rails', 'Python', 'Django', 'JavaScript',
  'React', 'Vue.js', 'Angular', 'Node.js', 'Express.js',
  'Java', 'Spring Boot', 'C#', '.NET', 'PHP', 'Laravel',
  'Swift', 'Kotlin', 'Flutter', 'React Native', 'SQL', 'NoSQL'
].freeze

while User.count < 150
  first_name = Faker::Name.first_name.downcase
  last_name = Faker::Name.last_name.downcase
  email = "#{first_name}.#{last_name}@" + random_email_domain
  role = 'user'
  lorem = Faker::Lorem.paragraph(sentence_count: 2)
  technologies = SOFTWARE_TECHNOLOGIES.sample(rand(1..4)).join(', ')

  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    role: role,
    password: 'password',
    password_confirmation: 'password',
    bio: lorem,
    technologies: technologies
  )
end

def create_teams
  20.times do
    name = Faker::Team.name
    user = User.where(team_id: nil).first
    points = rand(1..50)
    team = Team.new(
      name: name,
      owner: user,
      points: points
    )
    user.update(team: team) if team.save
  end
end

def assign_teams
  team_ids = Team.all.map(&:id)
  users = User.where(team_id: nil)
  users.each do |user|
    user.update(team_id: team_ids.sample)
  end
end

def create_blogs
  30.times do
    title = Faker::Lorem.sentence
    body = Faker::Lorem.paragraphs(number: 3).join("\n")
    published = [true, false].sample

    Blog.create!(
      title: title,
      body: body,
      published: published,
      created_at: Faker::Time.backward(days: 30),
      updated_at: Faker::Time.backward(days: 20)
    )
  end
end

def create_events
  10.times do
    name = Faker::Lorem.words(number: 3).join(' ').capitalize
    description = Faker::Lorem.paragraphs(number: 2).join("\n")
    date = Faker::Time.between(from: DateTime.now, to: 1.year.from_now)

    Event.create!(
      name: name,
      description: description,
      date: date,
      created_at: Faker::Time.backward(days: 30),
      updated_at: Faker::Time.backward(days: 20)
    )
  end
end

create_teams
assign_teams
create_events
create_blogs
