FactoryBot.define do
  factory :case_associated_case_detail do
    associated_case_detail
    association :case
  end
end
