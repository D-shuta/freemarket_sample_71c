FactoryBot.define do
  factory :user, class: User do
    id                    {1}
    nickname              {"shiki"}
    email                 {"kkk@gmail.com"}
    password              {"29gaaaaa"}
    password_confirmation {"29gaaaaa"}
    name                  {"taro"}
    first_name            {"suzuki"}
    name_kana             {"tarooo"}
    first_name_kana       {"saaaa"}
    birthday              {"20200320"}
  end
end
