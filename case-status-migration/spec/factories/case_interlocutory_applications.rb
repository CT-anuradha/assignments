FactoryBot.define do
  factory :case_interlocutory_application do
    association :case
    interlocutory_application
  end
end
