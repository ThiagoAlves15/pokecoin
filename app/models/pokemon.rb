class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :sales

  validates :name, :base_experience, :sprite_url, presence: true
end
