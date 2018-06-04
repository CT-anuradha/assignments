FactoryBot.define do
  factory :location do
    state { FFaker::AddressIN.state }
    district { FFaker::AddressIN.city }
  end
end
