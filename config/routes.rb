Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/:shorted_url", { to: "redirect_shorten_url#show" })
  post("/shorten_url", { to:  "shorten_url#create" })
end
