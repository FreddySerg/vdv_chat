NewApp::Application.routes.draw do
  root :to => 'main#index'
  match '/to_active' => 'main#to_active', :as => :to_active_main
  resources :messages, :only => :destroy
end