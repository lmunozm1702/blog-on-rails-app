class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, foreign_key: 'author_id'

  def self.update_comments_count(post_id)
    count = Comment.where(post_id:).count
    Post.where(id: post_id).update!(comments_counter: count)
  end
end
