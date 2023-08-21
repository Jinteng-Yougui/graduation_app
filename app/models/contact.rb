class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :categories, through: :bookings, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name", "id", "email", "created_at", "updated_at", "user_id"]
	end
end