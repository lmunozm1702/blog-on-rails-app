class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: 'author_id'
  has_many :likes, class_name: 'like', foreign_key: 'author_id'
  has_many :comments, class_name: 'comment', foreign_key: 'author_id'

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.last_three_posts(author_id)
    Post.where(author_id:).last(3)
  end
end