class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :likes

  def self.last_five_comments(post_id)
    Comment.where(post_id:).last(5)
  end

  def self.update_user_count(author_id)
    count = Post.where(author_id:).count
    User.where(id: author_id).update(posts_counter: count)
  end
end
