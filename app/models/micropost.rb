class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites #??
  has_many :favorited_users, through: :favorites, source: :user #お気に入り(favorite)しているmicrosopostたち  #??
  #has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id'
  #has_many :approvers, through: :reverses_of_favorite, source: :micropost

  mount_uploader :image, ImageUploader
end