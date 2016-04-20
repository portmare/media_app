# /spec/factories/token_key.rb
FactoryGirl.define do
  factory :token_key do
    token 'TfxZIkqJh0swz7jKXpAuag'
    access 0

    trait :shared do
      access 1
    end
  end
end