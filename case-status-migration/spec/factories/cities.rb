FactoryBot.define do
  factory :city do
    name { FFaker::AddressIN.city }
  end
end
