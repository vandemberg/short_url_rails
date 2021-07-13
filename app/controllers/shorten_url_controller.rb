class ShortenUrlController < ApplicationController
  def create
    short_url = ShortUrl.create_or_find_by(short_url_params)

    if short_url
      return render(json: { newUrl: short_url.short_url })
    end


    render({
      json: { message: "Nothing happen. what going on? call the support please"},
      status: 500,
    })
  end

  def short_url_params
    params.permit(:url)
  end
end
