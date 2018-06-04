FactoryBot.define do
  factory :other do
    uri { FFaker::Internet.http_url }
  end
end
