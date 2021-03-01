class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #バリデーション
  validates :content, presence: true
end
