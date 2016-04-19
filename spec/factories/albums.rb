FactoryGirl.define do
  factory :album do
    name "My first album"
    association :user
  end
end
