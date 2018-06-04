FactoryBot.define do
  factory :vehicle do
    vehicle { "RJ15/C" }
    number { FFaker::AddressPL.building_number }
    accident_on { FFaker::Time.date }
  end
end
