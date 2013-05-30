FactoryGirl.define do
  factory :comment do
    text "MyText"
    association :user
    association :task
  end
end
