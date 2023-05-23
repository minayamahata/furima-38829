class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postcord, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :postcord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, :address, :phone, presence: true

  def save
    # 寄付情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    DeliveryAddress.create(postcord: postcord, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end