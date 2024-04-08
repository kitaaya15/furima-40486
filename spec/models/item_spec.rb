require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品情報登録' do
    context '商品情報が登録できるとき' do
      it '正常に登録できるとき' do
        expect(@item).to be_valid
      end
    end
    it '商品の状態が「---」以外であれば登録できる' do
      @item.condition_id = 2
      expect(@item).to be_valid
    end
    it '配送料の負担が「---」以外であれば登録できる' do
      @item.fee_id = 2
      expect(@item).to be_valid
    end
    it '発送元の地域が「---」以外であれば登録できる' do
      @item.prefecture_id = 2
      expect(@item).to be_valid
    end
    it '発送までの日数が「---」以外であれば登録できる' do
      @item.day_id = 2
      expect(@item).to be_valid
    end
    it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
  
    context '商品情報が登録できないとき' do
      it 'itemが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担情報が空では登録できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it '発送元の地域情報が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数情報が空では登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it '価格情報が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格は￥299以下の場合は登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '価格は￥1,000,000以上の場合は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it '価格は半角数値でなければ登録できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price should be half-width numbers"
      end
    end
  end
end
