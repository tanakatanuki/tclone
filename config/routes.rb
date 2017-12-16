Rails.application.routes.draw do
    root to:"tweets#top"
    get "/tweets/top", to:"tweets#top"

    resources :tweets do
        collection do
            post :confirm
        end
    end
end
