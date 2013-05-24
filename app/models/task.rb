class Task < ActiveRecord::Base
  attr_accessible :description, :title, :description, :owner_id, :performer_id, :state
   
  belongs_to :owner, class_name: "User"
  belongs_to :performer, class_name: "User"
end
