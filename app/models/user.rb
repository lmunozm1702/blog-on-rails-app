class User < ApplicationRecord
  attr_accessor :email_confirmation

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :email, confirmation: { case_sensitive: false }

  ROLES = %i[admin default].freeze

  def self.last_three_posts(author_id)
    Post.where(author_id:).includes(:user).last(3).reverse
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
