require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    

  end

  describe '商品出品' do
    
    context '商品出品できる時' do
      it 'image,name,description,category,status,delivery_cost,delivery_prefecture,delivery_day,price,user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end


  context '新規登録できない時' do

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end

    it 'categoryが2以上でないと登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it 'statusが2以上でないと登録できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end

    it 'delivery_costが2以上でないと登録できない' do
      @item.delivery_cost_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery cost can't be blank"
    end

    it 'delivery_prefectureが2以上でないと登録できない' do
      @item.delivery_prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery prefecture can't be blank"
    end

    it 'delivery_dayが2以上でないと登録できない' do
      @item.delivery_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery day can't be blank"
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it 'priceが半角数字以外では登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end

    it 'priceが300円未満では登録できない' do
      @item.price = '250'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end

    it 'priceが9,999,999円を超えると登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end

    it 'userが紐づいていないと、登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end
    



            end
          end
        end
