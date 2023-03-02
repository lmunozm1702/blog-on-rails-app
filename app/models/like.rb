class Like < ApplicationRecord
  validates :author_id, uniqueness: { scope: :post_id }
  belongs_to :post
  belongs_to :user, foreign_key: 'author_id'

  def self.update_likes_count(post_id)
    count = Like.where(post_id:).count
    Post.where(id: post_id).update(likes_counter: count)
  end
end
