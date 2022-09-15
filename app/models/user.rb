class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :pokemons
  has_many :sales, class_name: "Sale", foreign_key: "from_user"
  has_many :acquisitions, class_name: "Sale", foreign_key: "to_user"

  # validates :name, :email, :password, presence: true
end
