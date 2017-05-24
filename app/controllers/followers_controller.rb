class FollowersController < ApplicationController
  include Secured

  before_action :logged_in?

  def create
    user = User.find(params[:user_id])
    follower_relationship = user.follower_relationships.build(
      follower_id: current_user.id
    )
    if follower_relationship.save
      FollowerMailer.new_follower_email(user, current_user).deliver_later
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json do
          render json: {
            following: {
              id: user.id
            },
            follow: {
              id: follower_relationship.id
            }
          }
        end
      end
    else
      redirect_to users_path, alert: "Can't follow that user"
    end
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: "You are not following #{follow.following.email} anymore" }
      format.json do
        render json: {
          unfollowing: {
            id: follow.following.id
          }
        }
      end
    end
  end
end
