class FollowerMailer < ApplicationMailer
  def new_follower_email(user, follower)
    @user = user
    @follower = follower
    mail subject: "New follower: #{follower.full_name}", to: user.email
  end
end
