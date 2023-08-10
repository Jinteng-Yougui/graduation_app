class Booking < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {in: 1..140}
  
  belongs_to :category
  belongs_to :contact

  def self.ransackable_attributes(auth_object = nil)
    ["title", "content", "date_on", "created_at", "updated_at", "user_id"]
	end

  def self.ransackable_associations(auth_object = nil)
    ["category", "contact"]
  end
end