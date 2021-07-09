class RedirectShortenUrlController < ApplicationController
  def show
    shorted_url = params[:shorted_url]
    short_url = ShortUrl.where({ short_url: shorted_url }).first

    if short_url.present?
      redirect_to short_url.url
    else
      render({ json: { message: "not found"}, status: 404 })
    end
  end
end
