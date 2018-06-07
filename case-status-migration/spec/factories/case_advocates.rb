FactoryBot.define do
  factory :case_advocate do
    advocate
    association :case
  end
end
