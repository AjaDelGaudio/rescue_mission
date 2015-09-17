Rails.application.routes.draw do

  resources :questions, only: [:index, :new, :show, :create, :edit, :update] do
    resources :answers, only: [:index, :new, :create]
  end

end
