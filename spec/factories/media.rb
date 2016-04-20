# /spec/factories/media.rb
FactoryGirl.define do
  factory :media do
    association :album
    link nil
    image ['image01.jpg']
  end
end