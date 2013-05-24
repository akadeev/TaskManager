FactoryGirl.define do
  factory :task do
    owner
    performer
    state
    title
    description
  end
end
