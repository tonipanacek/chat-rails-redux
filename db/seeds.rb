require 'faker'

Message.destroy_all
Channel.destroy_all
User.destroy_all


10.times {
  User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )
}

puts "#{User.count} created"

general = Channel.create(name: 'General')
berlin = Channel.create(name: 'Berlin')
react = Channel.create(name: 'React')
freelancers = Channel.create(name: 'Freelancers')
lunch = Channel.create(name: 'Lunch')

channels = [general, berlin, react, freelancers, lunch]

puts "#{Channel.count} created"

50.times {
  Message.create!(
    content: Faker::Quotes::Shakespeare,
    user: User.all.shuffle.first,
    channel: Channel.all.shuffle.first
  )
}

puts "#{Message.count} created"
