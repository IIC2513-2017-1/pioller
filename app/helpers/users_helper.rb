# frozen_string_literal: true

##
# Helper for clients
module UsersHelper
  def following_button(user)
    return unless current_user
    return if user == current_user
    following_relation = user.follower_relationships.detect do |relation|
      relation.follower_id == current_user.id
    end
    if following_relation
      link_to 'Unfollow', follower_path(following_relation), method: 'delete', remote: true, data: { type: 'json', 'user-id': user.id }
    else
      link_to 'Follow', user_followers_path(user), method: 'post', remote: true, data: { type: 'json', 'user-id': user.id }
    end
  end
end
