FactoryBot.define do
  factory :furima_shopping do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {'123-1234'}
    region_id {'2'}
    city      {'東京都'}
    street    {'11'}
    phone     {'1111111111'}
    build     {'11'}
  end
end
