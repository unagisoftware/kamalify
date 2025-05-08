Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/yaml_preview", to: "yaml_previews#create", as: :yaml_preview
  get "/about", to: "home#about", as: :about

  root "home#show"
end
