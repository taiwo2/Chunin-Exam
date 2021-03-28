class WebLink < ApplicationRecord
  belongs_to :user

  after_create_commit { generate_token(:uid) }

  VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$\z/ix

  validates :original_url, format: { with: VALID_URL_REGEX }

  private

  def generate_token(column)
    loop do
      self[column] = Digest::SHA256.hexdigest(original_url)[0..6]
      break unless self.class.exists?(column => self[column])
    end
  end
end
