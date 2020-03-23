FactoryBot.define do

  factory :user do
    name                     {"サンプルアイテム"}
    content                  {"テストです。"}
    state                    {"新品"}
    shipping_id              {"1"}
    prefecture_id            {"1"}
    price                    {"100"}
    seller_id                {"1"}
    category_id              {"1"}
    postage                  {"300"}
  end
end
 