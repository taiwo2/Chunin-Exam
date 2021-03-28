class WebLink < ApplicationRecord
  belongs_to :user, counter_cache: true

  before_validation :generate_random_uid, on: :create

  VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$\z/ix

  validates :original_url, format: { with: VALID_URL_REGEX }

  private

  def generate_random_uid
    generate_token(:uid)
  end

  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64[0..6]
      break unless self.class.exists?(column => self[column])
    end
  end
end
