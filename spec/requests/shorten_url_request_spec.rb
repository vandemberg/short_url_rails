RSpec.describe "ShortUrl", type: :request do
  describe "create a short url" do
    it "Create a new short url" do
      post("/shorten_url", params: attributes_for(:short_url))
      expect(response).to have_http_status(:success)
    end

    it "can not repeat the same URL" do
      short_url = build(:short_url)
      post("/shorten_url", params: { url: short_url.url })

      count_short_urls = ShortUrl.where({ url: short_url.url }).length

      expect(count_short_urls).to eql(1)
    end
  end

  # describe "redirect a short url to the original" do
  #   pending "check redirect with a existing short_url #{__FILE__}"
  # end

  # describe "top ten accessed short urls" do
  #   pending "list the 10 most accessed URIs #{__FILE__}"
  # end
end
