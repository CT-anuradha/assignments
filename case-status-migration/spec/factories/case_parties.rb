FactoryBot.define do
  factory :case_party do
    party
    association :case
    category { "petitioner" }
  end
end
