Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#landing_page'

  resources "questions" do
    get 'swipe_right'
    post 'swipe_right'
  end
end
