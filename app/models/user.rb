class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas

  has_many :comments, dependent: :destroy
  has_many :commented_ideas, through: :comments, source: :idea

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true

end
