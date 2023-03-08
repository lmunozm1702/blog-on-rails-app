class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }, allow_blank: false
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.last_five_comments(post_id)
    Comment.where(post_id:).includes(:user).last(5).reverse
  end

  def self.update_user_count(author_id)
    count = Post.where(author_id:).count
    User.where(id: author_id).update(posts_counter: count)
  end
end
