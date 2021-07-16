class ShortUrl < ApplicationRecord
  before_create :generate_shorted_url

  validates_uniqueness_of :url
  validates_uniqueness_of :short_url

  has_many :clicks

  def self.top_three(start_day, end_day)
    ShortUrl
      .select("COUNT(short_urls.url) as count_clicks, short_urls.url")
      .joins(:clicks)
      .where({ clicks: { created_at: start_day..end_day } })
      .group("short_urls.url")
      .order(count_clicks: :desc)
      .limit(3)
  end

  def self.today_top_three
    ShortUrl.top_three(Time.now.beginning_of_day, Time.now.end_of_day)
  end

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
