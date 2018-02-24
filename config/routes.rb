Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#landing_page'

  resources "questions" do
    get 'yes'
    post 'yes'
  end

  resources "swipes" do
    get 'next'
    post 'next'

    get 'right'
    post 'right'
  end
end
