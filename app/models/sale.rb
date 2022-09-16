class Sale < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User", optional: true
  belongs_to :pokemon
end
