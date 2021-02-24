class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 has_many :books, dependent: :destroy
 has_many :likes, dependent: :destroy

 #既にいいねしているかどうか
 def already_liked?(item)
   self.likes.exists?(item_id: item.id)
 end
end
