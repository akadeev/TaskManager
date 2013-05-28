class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :password_digest, :presence => true
  
  has_many :owner_tasks, dependent: :destroy, class_name: "Task", foreign_key: "owner_id"
  has_many :perfomer_tasks, dependent: :nullify, class_name: "Task", foreign_key: "performer_id"

  has_secure_password
end