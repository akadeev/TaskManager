class SessionEditType
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include Virtus

  attribute :email, String
  attribute :password, String

  validates :email, presence: true
  validates :password, presence: true

  validates_each :email do |record, attr, value|
    user = record.user
    p record.password.inspect
    if user.nil? || !user.try(:authenticate, record.password)
      record.errors.add(attr, :user_or_password_invalid)
    end
  end

  def persisted?
    false
  end

  def user
    @user ||= User.find_by_email(email)
  end
end