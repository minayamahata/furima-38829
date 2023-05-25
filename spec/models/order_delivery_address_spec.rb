require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery_address = FactoryBot.build(:order_delivery_address, item_id: item.id, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@order_delivery_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_delivery_address.building = nil
        expect(@order_delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcordが空だと保存できないこと' do
        @order_delivery_address.postcord = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postcord can't be blank")
      end
      it 'postcordが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery_address.postcord = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postcord is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_delivery_address.prefecture_id = 1
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_delivery_address.city = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_delivery_address.address = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_delivery_address.phone = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_delivery_address.phone='123456789234'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phoneは、9桁以下では登録できない' do
        @order_delivery_address.phone='123456789'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phoneは、12桁以上では登録できない' do
        @order_delivery_address.phone='1234567892345'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phoneは、半角数字以外が含まれていると登録できない' do
        @order_delivery_address.phone='090-1234-56'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it "user_idが空では登録できないこと" do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end