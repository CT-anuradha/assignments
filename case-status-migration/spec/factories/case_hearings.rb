FactoryBot.define do
  factory :case_hearing do
    register_number { "1/2017" }
    judge { "THE HON'BLE THE CHIEF JUSTICE T. VAIPHEI" }
    last_hearing { FFaker::Time.date }
    next_hearing { FFaker::Time.date }
    status { "FOR ORDER" }
  end
end
