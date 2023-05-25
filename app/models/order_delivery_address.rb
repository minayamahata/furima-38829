class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postcord, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :address, :token, :item_id, :user_id
    validates :postcord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "number is invalid."}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 配送先情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    DeliveryAddress.create(postcord: postcord, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end