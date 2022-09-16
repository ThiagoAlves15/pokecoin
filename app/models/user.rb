class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :pokemons
  has_many :sales, class_name: "Sale", foreign_key: "from_user"
  has_many :acquisitions, class_name: "Sale", foreign_key: "to_user"

  def total_wallet_value
    sat_usd_rate = Rate.sat_to_usd_rate.rate

    pokemons.sum(:base_experience) * sat_usd_rate
  end
end
