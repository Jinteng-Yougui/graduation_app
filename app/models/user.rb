class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts
  has_many :bookings, through: :contacts

  def self.guest
    find_or_create_by!(email: 'guest_example@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin_example@example.com', admin: true) do |user|
      user.name = "ゲスト管理者"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
