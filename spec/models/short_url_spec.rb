require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  describe "test validations fields" do
    it "can not repeat url" do
      ShortUrl.create url: "google.com"
      short_url = ShortUrl.create url: "google.com"

      expect(short_url.errors[:url]).to include("has already been taken")
    end

    it "can not short url" do
      short_url_first = ShortUrl.create url: "facebook.com"

      short_url_second = ShortUrl.create url: "twitter.com"
      short_url_second.short_url = short_url_first.short_url
      short_url_second.save

      expect(short_url_second.errors[:short_url]).to include("has already been taken")
    end
  end
end
