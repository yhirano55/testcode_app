Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'auth' => 'auth#create'
    end
  end
end
