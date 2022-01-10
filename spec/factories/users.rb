FactoryBot.define do
  factory :user do
    user_name { "hoge" }
    email { "hoge@example.com" }
    password { "hoge" } 
    password_confirmation { "hoge" }
  end
end
