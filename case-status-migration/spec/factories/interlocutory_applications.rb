FactoryBot.define do
  factory :interlocutory_application do
    ia_number { "1/2017" }
    ia_date { FFaker::Time.date }
    status { "Disposed" }
  end
end
