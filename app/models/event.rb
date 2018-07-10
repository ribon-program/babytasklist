class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :articles
end
