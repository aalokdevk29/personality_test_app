Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  get "test", to: "personality_tests#test", as: :test
  get "question_attempt", to: "personality_tests#question_attempt", as: :question_attempt

  resources :questions
end
