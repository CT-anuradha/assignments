FactoryBot.define do
  factory :history do
    judge { "Hon'ble The Chief Justice" }
    hearing_date { FFaker::Time.date }
    purpose { "Orders" }
  end
end
