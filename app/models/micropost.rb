class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites #??
  has_many :favorited_users, through: :favorites, source: :user #お気に入り(favorite)しているmicrosopostたち  #??
  #has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id'
  #has_many :approvers, through: :reverses_of_favorite, source: :micropost

  mount_uploader :image, ImageUploader
  
  has_many :comments
  has_many :comments_users, through: :comments, source: :user, dependent: :destroy
  #↑投稿にコメントした人たちの一覧
  
  def self.search(search)
    return Micropost.all unless search
    Micropost.where(['content LIKE ?', "%#{search}%"])
  end
  
end