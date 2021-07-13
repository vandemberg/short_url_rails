class ShortUrl < ApplicationRecord
  before_create :generate_shorted_url

  validates_uniqueness_of :url
  validates_uniqueness_of :short_url

  def short
    "#{ENV['ROOT_URL']}/#{short_url}"
  end

  def generate_shorted_url
    random_key = SecureRandom.alphanumeric(10)
    already_exists = ShortUrl.where({ short_url: short_url }).first

    if already_exists.present?
      genereate_shorted_url
    else
      self.short_url = random_key
    end
  end
end
