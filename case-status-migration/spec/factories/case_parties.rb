FactoryBot.define do
  factory :case_party do
    party
    association :case
  end
end
