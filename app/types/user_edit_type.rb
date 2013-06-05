class UserEditType < User
  include BaseType

  attr_accessible :email

  validates :email, :presence => true
  validates :password, :presence => true
end