FactoryBot.define do
  factory :user do
    name "#{Faker::Lorem.word}#{Faker::Number.hexadecimal(2)}"
    sequence(:email) { |n| "somebody#{n}@example.com" }
    password 'secret42'
    password_confirmation 'secret42'
  end
end
