# frozen_string_literal: true

class TweetsController < ApplicationController
  include Secured

  before_action :set_tweet, only: %i[show edit update destroy]
  before_action :logged_in?, only: %i[new create edit update destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.includes(:user)
                   .restricted_for(current_user)
                   .followed_by(current_user)
  end


  # GET /tweets/1
  # GET /tweets/1.json
  def show; end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit; end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html do
          redirect_to @tweet, notice: 'Tweet was successfully created.'
        end
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json do
          render json: @tweet.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html do
          redirect_to @tweet, notice: 'Tweet was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json do
          render json: @tweet.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html do
        redirect_to current_user, notice: 'Tweet was successfully destroyed.'
      end
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def tweet_params
    params.require(:tweet).permit(:content, :private).merge(user_id: current_user.id)
  end
end
