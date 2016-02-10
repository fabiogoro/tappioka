FactoryGirl.define do
  factory :user do
    name "Fabio Gorodscy"
    city "São Paulo"
    email "fabiogo@outlook.com"
    password "12345678"
    password_confirmation "12345678"
    facebook "http://fb.com/gorodscy"
    twitter "http://twitter.com"
  end
end
