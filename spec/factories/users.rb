FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password123'
    password_confirmation 'password123'
    avatar_url 'https://avatarfiles.alphacoders.com/139/13900.gif'
  end
end
