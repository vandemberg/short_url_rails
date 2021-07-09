class ShortenUrlController < ApplicationController
  def create
    short_url = ShortUrl.new(short_url_params)

    if short_url.save!
      render({
        json: {
          newUrl: short_url.short_url
        }
      })
    else
      render({
        json: { message: "Something happen."},
        status: 500,
      })
    end
  end

  def short_url_params
    params.permit(:url)
  end
end
