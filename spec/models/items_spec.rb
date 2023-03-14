require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    
    context '商品出品できる時' do
      it 'image,name,description,category,status,delivery_cost,delivery_prefecture,delivery_day,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end


  context '新規登録できない時' do

    it 'imageが空では登録できない' do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Image day can't be blank"
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

    it 'categoryが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it 'statusが空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end

    it 'delivery_costが空では登録できない' do
      @item.delivery_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery cost can't be blank"
    end

    it 'delivery_prefectureが空では登録できない' do
      @item.delivery_prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery prefecture can't be blank"
    end

    it 'delivery_dayが空では登録できない' do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery day can't be blank"
    end

    it 'priceが空では登録できない' do
      @item.praice = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price day can't be blank"
    end

    it 'priceが半角数字以外では登録できない' do
      @item.praice = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
    end

    it 'priceが300～99999以内でなければ登録できない' do
      @item.praice = '280'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
    end



            end
          end
        end
