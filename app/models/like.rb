class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

  def self.update_likes_count(post_id)
    count = Like.where(post_id:).count
    Post.where(id: post_id).update(likes_counter: count)
  end
end
