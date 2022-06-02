FactoryBot.define do
  factory :order_form do
      postcode                 { '000-0000' }
      prefecture_id             { 4 }
      city            { "あいうえお" }
      block                   { "aaaaa" }
      building             { "あいうえお" }
      phone_number          { '0000000000' }
      token                     {"aaaaaaaaaaaaaaaaaaaaaaaaaaaaa"}
  end
end