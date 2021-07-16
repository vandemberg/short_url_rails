require 'rails_helper'

RSpec.describe "Reports", type: :request do
  before(:each) do
    ShortUrl.destroy_all
  end

  describe "GET /index" do
    it "check report results for today" do
      short1 = create(:short_url)
      short2 = create(:short_url)
      short3 = create(:short_url)
      short4 = create(:short_url)

      FactoryBot.create_list(:click, 8, { short_url_id: short1.id })
      FactoryBot.create_list(:click, 10, { short_url_id: short2.id })
      FactoryBot.create_list(:click, 5, { short_url_id: short3.id })
      FactoryBot.create_list(:click, 1, { short_url_id: short4.id })

      get("/reports")

      report_parsed = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(report_parsed["today_top_three"]).to match_array([short2.url, short1.url, short3.url])
    end
  end
end
