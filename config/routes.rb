Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources "questions" do
    get 'yes'
    get 'no'
  end

  resources "swipes" do
    get 'next'
  end

  resources 'pages' do
    get 'loading'
    get 'number_of_questions'
    post 'number_of_questions'
  end


  root 'pages#index'

end
