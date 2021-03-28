FactoryBot.define do
  factory :web_link do
    sequence(:uid) { |n| "aslfjlsadf#{n}" }
    original_url { "https://abeidahmed.me" }
    title { "example website" }
    user
  end
end
