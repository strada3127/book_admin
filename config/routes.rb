Rails.application.routes.draw do
  get 'profile/show'

  get 'profile/edit'

  get 'profile/update'

  resources :publishers do
    resources :books

    member do
      get 'detail'
    end

    collection do
      get 'search'
    end
  end

  resource :profile, only: %i{show edit update}
end
