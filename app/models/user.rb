class User < ActiveRecord::Base
  include Clearance::User

  BLACKLIST_USERNAMES = ['home']

  attr_accessible :username

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[A-Za-z][A-Za-z_\-0-9]*\z/ }
  validates :username, length: 2..40
  
  validate :allowed_username

  def self.authenticate(email, password)
    if user = find_by_email(email) || find_by_username(email)
      user if user.authenticated?(password)
    end
  end

  protected

  def allowed_username
    path = Rails.applicaton.routes.recognize_path("#{username}", method: :get) rescue nil
    errors.add(:username, "username is not allowed") if path or BLACKLIST_USERNAMES.include?(username)
  end
end
