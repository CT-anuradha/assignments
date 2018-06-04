FactoryBot.define do
  factory :fir_detail do
    fir_number { "180/2015" }
    district { FFaker::AddressIN.city }
    place { FFaker::AddressIN.state }
  end
end
