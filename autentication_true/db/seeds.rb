require 'faker'

10.times { User.create(first_name: (Faker::Name.first_name), last_name: (Faker::Name.last_name), email: (Faker::Internet.email), password: (Faker::Internet.password)) }


10.times { Url.create(user_id: (rand(9) + 1), long_url: (Faker::Internet.url), short_url: (Faker::Lorem.characters(4)))}