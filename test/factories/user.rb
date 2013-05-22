FactoryGirl.define do
  factory :user do
    password "test"
    email

    after(:create) do |user|
      user.activate
    end
  end
end