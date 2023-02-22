class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: 'author_id'
  has_many :likes, class_name: 'like', foreign_key: 'author_id'
  has_many :comments, class_name: 'comment', foreign_key: 'author_id'

  def self.last_three_posts(author_id)
    Post.where(author_id:).last(3)
  end
end
