class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  before_validation :strip_email_address
  before_save :lowercase_email_address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email_address, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } # rubocop:disable Layout/LineLength
  validates :password, presence: true, length: { minimum: 6 }

  private

  def strip_email_address
    self.email_address = email_address.to_s.strip
  end

  def lowercase_email_address
    self.email_address = email_address.to_s.downcase
  end
end
