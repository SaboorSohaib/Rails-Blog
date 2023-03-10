class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:comments_counter)
  end
end
