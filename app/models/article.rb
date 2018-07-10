class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  belongs_to :user
  belongs_to :event
  belongs_to :place
end
