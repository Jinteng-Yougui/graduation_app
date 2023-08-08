class Booking < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {in: 1..140}
  
  belongs_to :category
  belongs_to :contact
end