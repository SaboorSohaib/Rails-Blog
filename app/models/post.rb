class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_posts_counter
  validates :title, presence: true
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent_comment
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.all.length)
  end
end
