# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    owner_id User.first.id
    performer_id User.first.id
    state "asf"
    title "sdga"
    description "MyText"
  end
end
