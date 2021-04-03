FactoryBot.define do
  factory :keyword do
    phrase { "MyString" }
    volume { "" }
    ciq_score { "" }
    cpr_eight_day_giveaway { "" }
    product { nil }
  end
end
