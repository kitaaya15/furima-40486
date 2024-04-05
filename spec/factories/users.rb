FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { 'test1234' }
    password_confirmation { password }
    first_name { '田中' }
    last_name { 'ココ' }
    first_name_reading { 'タナカ' }
    last_name_reading { 'ココ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end
