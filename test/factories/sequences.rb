FactoryGirl.define do
  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  [:state, :title, :description].each do |trait|   
    sequence trait do |n|
      "#{trait}_#{n}"
    end
  end
end