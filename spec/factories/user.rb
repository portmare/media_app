FactoryGirl.define do
  factory :user, class: 'User' do
    name 'Ronaldo'
    email 'ronaldo@fifa.com'
    password 'iamthebestsoccer'
    password_confirmation 'iamthebestsoccer'
  end
end
