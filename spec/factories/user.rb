FactoryGirl.define do
  factory :user, class: 'User' do
    name 'Ronaldo'
    email 'ronaldo@fifa.com'
    password 'iamthebestsoccer'
    password_confirmation 'iamthebestsoccer'

    trait :different_password do
      password 'onepassword'
      password_confirmation 'anotherpassword'
    end

    trait :empty_params do
      name nil
      email nil
      password nil
      password_confirmation nil
    end
  end
end
