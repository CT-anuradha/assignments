FactoryBot.define do
  factory :case_court_detail do
    court_detail
    association :case
  end
end
