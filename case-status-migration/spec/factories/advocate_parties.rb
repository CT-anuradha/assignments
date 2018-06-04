FactoryBot.define do
  factory :advocate_party do
    advocate
    party
    category { "petitioner" }
  end
end
