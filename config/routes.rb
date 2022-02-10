Rails.application.routes.draw do
  root 'todos#index'
  scope '/api/v1' do
    resources :todos do
      member do
        get :uncompleted
        put :update_form
      end
    end
  end
end
