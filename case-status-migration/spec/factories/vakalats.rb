FactoryBot.define do
  factory :vakalat do
    pr_number { "5(R)" }
    advocate_code { FFaker::Random.rand(max = 1000) }
    advocate { FFaker::Name.name }
  end
end
