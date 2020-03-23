FactoryBot.define do

  factory :item do
    name                     {"サンプルアイテム"}
    content                  {"テストです。"}
    state                    {"新品"}
    shipping_id              {"1"}
    prefecture_id            {"1"}
    price                    {"100"}
    seller_id                {"1"}
    category_id              {"1"}
    postage                  {"300"}


    association :seller, factory: :user
    association :category

    after(:build) do |item|                           
      item.images << build(:image, item: item)  
    end    

  end
end
 