module Api::V1
  class TweetsController < ApiController
    def index
      @tweets = Tweet.includes(:user).all
    end

    def create
      @tweet = Tweet.new(tweet_params)
      unless @tweet.save
        render json: { errors: @tweet.errors }, status: :unprocessable_entity
      end
    end

    private

    def tweet_params
      params.require(:tweet).permit(:content, :private, :user_id)
    end
  end
end
