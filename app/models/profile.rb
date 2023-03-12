class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth, presence: true
  validates :phone, presence: true
  validates :country, presence: true

  enum role: %i[member manager admin superadmin dev]
end
