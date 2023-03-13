require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    context '新規登録できる時' do
      it 'nicknameとemail、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

  context '新規登録できない時' do

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailに被りがあると登録できない' do
      @User.create(email: "abc@gmail.com")
      @user = User.new(email: "abc@gmail.com")
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailに@が入っていないものは登録できない' do
      @user.email = 'abcdefgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email not include @ "
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "password can't be blank"
    end

    it 'passwordが一致しない場合登録できない' do
      @user.password = password: "password", password_confirmation: "password2"
      @user.valid?
      expect(@user.errors.full_messages).to include "password not match"
    end

    it 'passwordが6文字未満では登録できない' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include "paswword length is not 6"
    end

    it 'passwordが半角英語だけでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "paswword not include number"
    end

    it 'passwordが半角数字だけ登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "paswword not include alphabet"
    end

    it 'passwordが全角入力では登録できない' do
      @user.password = 'ｂｃｆ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include "paswword can't be full-width"
    end

      it 'last_nameが空であれば登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'last_nameが全角ひらがな、カタカナ、漢字以外であれば登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name not be full-width "
      end

        it 'first_nameが空であれば登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
        end

        it 'first_nameが全角ひらがな、カタカナ、漢字以外であれば登録できない' do
          @user.first_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name not be full-width"
        end

          it 'last_name_kanaが空では登録できない' do
            @user.last_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Last name kana can't be blank"
          end

          it 'last_name_kanaが全角ひらがな、カタカナ、漢字以外であれば登録できない' do
            @user.last_name_kana = 'test'
            @user.valid?
            expect(@user.errors.full_messages).to include "Last name kana not be full-width Katakana"
          end

            it 'first_name_kanaが空では登録できない' do
              @user.first_name_kana = ''
              @user.valid?
              expect(@user.errors.full_messages).to include "First name kana can't be blank"
            end

            it 'first_name_kanaが全角カタカナ以外では登録できない' do
              @user.first_name_kana = 'test'
              @user.valid?
              expect(@user.errors.full_messages).to include "First name kana not be full-width Katakana"
            end

              it 'birth_dateが空では登録できない' do
                @user.birth_date = ''
                @user.valid?
                expect(@user.errors.full_messages).to include "Birth date can't be blank"
              end
         end      
      end

end