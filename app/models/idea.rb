class Idea < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  belongs_to :user

  has_many :comments
  has_many :commenting_users, through: :comments, source: :user

  has_many :joins
  has_many :joined_users, through: :joins, source: :user

  has_many :likes
  has_many :liking_users, through: :likes, source: :user

  validates :title, uniqueness:{scope: :body}, presence: true
  validates :body, presence: true

  def joined_by?(user)
  # likes.find_by_user_id(user.id).present?
   join_for(user).present?
  end

  def join_for(user)
    joins.find_by_user_id(user.id)
  end

  def liked_by?(user)
  # likes.find_by_user_id(user.id).present?
   like_for(user).present?
  end

  def like_for(user)
    likes.find_by_user_id(user.id)
  end
end
