Rails.application.routes.draw do
  root "auth#index"
  get "/login", to: "auth#login"
  post "/login", to: "auth#login"
end
