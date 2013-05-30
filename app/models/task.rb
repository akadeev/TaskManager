  class Task < ActiveRecord::Base
  attr_accessible :description, :title, :description, :owner_id, :performer_id, :state_event
   
  belongs_to :owner, class_name: "User"
  belongs_to :performer, class_name: "User"
  has_many :comments

  state_machine :initial => :new do
    state :new
    state :started
    state :finished
    state :accepted
    state :rejected

    event :start do
      transition [:new] => :started
    end
    event :finish do
      transition [:started] => :finished
    end
    event :accept do
      transition [:finished] => :accepted
    end
    event :reject do
      transition [:finished] => :rejected
    end
  end
end
