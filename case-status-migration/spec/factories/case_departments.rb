FactoryBot.define do
  factory :case_department do
    association :case
    department
  end
end
