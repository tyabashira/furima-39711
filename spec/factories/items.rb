FactoryBot.define do
  factory :item do
    item_name       {"aa"}
    item_text       {"aaa"}
    category_id     {2}
    quality_id      {2}
    cost_id         {2}
    region_id       {2}
    post_day_id     {2}
    price           {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
