class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :text, presence: true
  belongs_to :user
end
