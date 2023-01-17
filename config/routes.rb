Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  get "test", to: "personality_tests#test", as: :test
  get "question_attempt", to: "personality_tests#question_attempt", as: :question_attempt
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
