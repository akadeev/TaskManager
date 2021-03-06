class User < ActiveRecord::Base
  include UsersRepository

  attr_accessible :email, :password
  
  has_many :owner_tasks, dependent: :destroy, class_name: "Task", foreign_key: "owner_id"
  has_many :perfomer_tasks, dependent: :nullify, class_name: "Task", foreign_key: "performer_id"
  has_many :comments

  validates :email, :presence => true
  validates :password_digest, :presence => true

  has_secure_password
end