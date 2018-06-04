FactoryBot.define do
  factory :act do
    act { FFaker::Lorem.sentence }
    section { FFaker::Random.rand(max = 500) }
  end
end
