FactoryBot.define do
  factory :case_information do
    class_code { FFaker::PhoneNumber.area_code }
    date_given_by { "PESHI CLERK DATE" }
    case_bench { "SINGLE" }
    court_number { FFaker::PhoneNumberSN.mobile_phone_prefix }
    sr_number { "CRPSR 18791/2017" }
    stamp_number { "ARAST/31322/2011" }
    snapshot_url { "https://india-casestatus.s3.amazonaws.com/bombay_cs/32ba3a4c49eb4bb00984ad5597cf55edb1160303?AWSAccessKeyId=AKIAINJQRPII6TFWLZDA&Expires=1538473520&Signature=BWHveqAstZmFqfXD4Cxevqagy2g%3D" }
    nature_of_disposal { "Disposed Of" }
    token_number { "69/2017" }
    under_section { "HINDU SUCCESSION (AMENDMENT) ACT, 2005" }
    disposal_type { "Disposed Off" }
    dispose_by_judge { "HON'BLE MR. JUSTICE S.TALAPATRA" }
    stamp_or_register { "register" }
    posted { "ORDERS" }
    last_action { "ADJOURNED" }
    classification_number { FFaker::AddressCHFR.country_code }
    purpose { "For Clarification" }
  end
end
