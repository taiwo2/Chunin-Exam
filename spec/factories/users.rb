FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "email@email#{n}.com" }
    password { "secretpassword" }
    sequence(:auth_token) { |n| "authtoken#{n}" }
  end
end
