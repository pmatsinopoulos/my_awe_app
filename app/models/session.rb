class Session
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :password
  attr_reader   :user

  validates :email,    presence: true
  validates :password, presence: true

  def save
    return unless valid?

    @user = User.find_by_email email
    @user.authenticate password
  end
end