# Preview all emails at http://localhost:3000/rails/mailers/follower_mailer
class FollowerMailerPreview < ActionMailer::Preview
  def new_follower_email
    FollowerMailer.new_follower_email(User.first, User.second)
  end
end
