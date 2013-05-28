class Task < ActiveRecord::Base
  attr_accessible :description, :title, :description, :owner_id, :performer_id
   
  belongs_to :owner, class_name: "User"
  belongs_to :performer, class_name: "User"

  state_machine :state, :initial => :new do
    state :new
    state :begin
    state :end
    state :accepted
    state :rejected
  end
end
