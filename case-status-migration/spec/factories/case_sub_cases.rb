FactoryBot.define do
  factory :case_sub_case do
    association :case
    sub_case
  end
end
