require 'faker'

10.times { User.create(first_name: (Faker::Name.first_name), last_name: (Faker::Name.last_name), email: (Faker::Internet.email), password_digest: (Faker::Internet.password)) }
10.times { Survey.create(title: Faker::Space.star, surv_date: (Faker::Date.backward(5)))}
10.times { Record.create(user_id: (rand(9) + 1), survey_id: (rand(9) + 1), responder: (rand(2)) )}
