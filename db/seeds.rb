require 'faker'

Message.destroy_all
User.destroy_all
Channel.destroy_all


10.times {
  User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )
}

puts "#{User.count} created"

Channel.create(name: 'general')
Channel.create(name: 'berlin')
Channel.create(name: 'react')
Channel.create(name: 'freelancers')
Channel.create(name: 'lunch')


puts "#{Channel.count} created"

50.times {
  Message.create!(
    content: Faker::Quotes::Shakespeare.hamlet,
    user: User.all.shuffle.first,
    channel: Channel.all.shuffle.first
  )
}

puts "#{Message.count} created"
