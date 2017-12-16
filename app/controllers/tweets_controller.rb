class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
    end
    
    def new
        if params[:back]
            @tweet = Tweet.new(tweet_params)
        else
            @tweet = Tweet.new
        end
    end
    
    def create
#        Tweet.create(content: params[:tweet][:content])
#        Tweet.create(tweet_params)
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            redirect_to tweets_path
        else
            render :new
        end
    end
    
    def confirm
        @tweet = Tweet.new(tweet_params)
        render :new if @tweet.invalid?
    end
    
    def destroy
        set_tweet
        @tweet.destroy
        redirect_to tweets_path
    end
    
    def edit
        set_tweet
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
            redirect_to tweets_path
        else
            render :edit
        end
    end
    
    def top
    end
    
    private
    
    def tweet_params
        params.require(:tweet).permit(:content)
    end
    
    def set_tweet
        @tweet =Tweet.find(params[:id])
    end
end
