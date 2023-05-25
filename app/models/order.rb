class Order < ApplicationRecord
  belongs_to :user
  has_one :delivert_address
  belongs_to :item
end
