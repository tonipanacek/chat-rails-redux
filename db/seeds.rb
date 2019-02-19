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

Channel.create(name: 'General')
Channel.create(name: 'Berlin')
Channel.create(name: 'React')
Channel.create(name: 'Freelancers')
Channel.create(name: 'Lunch')


puts "#{Channel.count} created"

50.times {
  Message.create!(
    content: Faker::Quotes::Shakespeare.hamlet,
    user: User.all.shuffle.first,
    channel: Channel.all.shuffle.first
  )
}

puts "#{Message.count} created"
