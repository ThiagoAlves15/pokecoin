class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :sales

  validates :name, :base_experience, :sprite_url, presence: true

  def is_for_sale
    sales.where(to_user_id: nil).exists?
  end

  def current_value
    sat_usd_rate = Rate.sat_to_usd_rate.rate

    base_experience * sat_usd_rate
  end
end
