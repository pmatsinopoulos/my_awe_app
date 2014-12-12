class SignUp
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :password
  attr_accessor :name
  attr_reader   :user

  validates :email,    presence: true
  validate  :email_uniqueness

  validates :password, presence: true, confirmation: true
  validates :name,     presence: true

  def save
    return unless valid?

    @user = User.create email: email, password: password, name: name

    @user.present? && !@user.new_record?
  end

  def email_uniqueness
    u = User.find_by_email email
    errors[:email] << "has already been taken" if u.present?
  end
end