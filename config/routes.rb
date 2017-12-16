Rails.application.routes.draw do
    resources :tweets do
        collection do
            post :confirm
        end
    end
    
    get "/top", to:"tweets#top"
end
