class User < ActiveRecord::Base
  include Clearance::User

  attr_accessible :username

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: /\A[A-Za-z][A-Za-z_\-0-9]*\z/ }
  validates :username, length: 2..40

  def self.authenticate(email, password)
    if user = find_by_email(email) || find_by_username(email)
      user if user.authenticated?(password)
    end
  end
end
