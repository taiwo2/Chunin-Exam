FactoryBot.define do
  factory :web_link do
    sequence(:uid) { |n| "aslfjlsadf#{n}" }
    original_url { "https://hello.com" }
    user
  end
end
