RSpec.describe "ShortUrl", type: :request do
  describe "create a short url" do
    it "Create a new short url" do
      post("/shorten_url", params: attributes_for(:short_url))
      short_url_parsed = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(short_url_parsed['newUrl']).to eql(ShortUrl.last.short_url)
    end

    it "can not repeat the same URL" do
      short_url = create(:short_url)
      post("/shorten_url", params: { url: short_url.url })

      count_short_urls = ShortUrl.where({ url: short_url.url }).length

      expect(count_short_urls).to eql(1)
    end

    it "should repeat if each one of the short_url was older than 1 year" do
      short_url = create(:short_url, { created_at: Time.now - 2.years })
      post("/shorten_url", params: { url: short_url.url })

      count_short_urls = ShortUrl.where({ url: short_url.url }).length
      count_valids_short_urls = ShortUrl.where({ url: short_url.url }).valid.length

      expect(count_short_urls).to eql(2)
      expect(count_valids_short_urls).to eql(1)
    end
  end

  describe "redirect a short url to the original" do
    it "should redirect to true URL" do
      short_url = create(:short_url)
      get("/#{short_url.short_url}")

      expect(response).to redirect_to(short_url.url)
    end

    it "Do not redirect if link was to old" do
      short_url = create(:short_url, { created_at: (Time.now - 2.years)})

      get("/#{short_url.short_url}")

      expect(response).to have_http_status(404)
    end

    it "check if when access register a click" do
      short_url = create(:short_url)
      get("/#{short_url.short_url}")

      expect(short_url.clicks.count).to eql(1)
    end
  end
end
