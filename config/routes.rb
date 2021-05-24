Rails.application.routes.draw do
  resources :staffs
  resources :departments
  root :to => 'claims#index'

  resources :claims do 
    collection do
      get 'claim_type', :as => "ct"
      get 'new_claim_type', :as => "newct"
      post 'create_claim_type', :as => "createct"  

      get 'maillist', :as => "ml"
      get 'new_maillist', :as => 'newml'
      post 'create_maillist', :as => "createml"
    end

    member do 
      get 'edit_claim_type', :as => 'editct'
      patch 'update_claim_type', :as => 'updatect'
      delete 'delete_claim_type', :as => 'deletect'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'claim#index'


end
