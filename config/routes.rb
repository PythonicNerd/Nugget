Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'

  resources "questions" do
    get 'yes'
    get 'no'
  end

  resources "swipes" do
    get 'next'
  end

  resources 'landing_page'
end
