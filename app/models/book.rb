class Book < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  #refile
  attachment :image
  
  has_many :notifications, dependent: :destroy

end
