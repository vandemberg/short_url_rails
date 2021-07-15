class ReportsController < ApplicationController
  def index
    render({ json: { today_top_three: ShortUrl.today_top_three.pluck(:url) } })
  end
end
