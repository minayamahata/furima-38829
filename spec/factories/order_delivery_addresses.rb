FactoryBot.define do
  factory :order_delivery_address do
    postcord      { "123-4567" }
    prefecture_id { 3 }
    city          { "横浜市緑区" }
    address       { "青山1-1-1" }
    building      { "柳ビル103" }
    phone         { "09012345678" }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end