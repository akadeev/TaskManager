FactoryGirl.define do
  factory :user, :aliases => [:owner, :performer] do
    password "test"
    email
  end
end