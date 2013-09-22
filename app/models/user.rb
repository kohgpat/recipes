class User < ActiveRecord::Base
  include Clearance::User

  BLACKLIST_USERNAMES = ['home']

  attr_accessible :username

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[A-Za-z][A-Za-z_\-0-9]*\z/ }
  validates :username, length: 2..40
  
  validate :allowed_username, on: :create

  def self.authenticate(email, password)
    if user = find_by_email(email) || find_by_username(email)
      user if user.authenticated?(password)
    end
  end

  protected

  def allowed_username
    path = Rails.application.routes.recognize_path(username, method: :get)

    if (path and !path.has_key?(:id)) or BLACKLIST_USERNAMES.include?(username)
      errors.add(:username, "is not allowed")
    end
  end
end
