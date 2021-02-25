class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    has_many :books, dependent: :destroy
    has_many :likes, dependent: :destroy

    has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
    has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
    
 #既にいいねしているかどうか
 def already_liked?(book)
   self.likes.exists?(book_id: book.id)
 end
end
