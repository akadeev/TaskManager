class UserEditType < User
  include BaseType

  attr_accessible :email

  validates :password, :presence => true
end