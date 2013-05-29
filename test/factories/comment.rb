FactoryGirl.define do
  factory :comment do
    text "MyText"
    user
    task
  end
end
