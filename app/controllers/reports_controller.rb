class ReportsController < ApplicationController
  def index
    render({
      json: {
        today_top_three: ShortUrl.today_top_three.map{ |short| short.url }
      }
    })
  end
end
