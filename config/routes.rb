Rails.application.routes.draw do

  controller :users do
    get  "sign_up", action: :new
    post "users",   action: :create
  end

  controller :sessions do
    get    "login",    action: :new
    post   "login",    action: :create
    delete "sign_out", action: :destroy
    get    "sign_out", action: :destroy
  end

  get "dashboard", to: "dashboard#index"

  root "welcome#index"
end
