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

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailに被りがあると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が入っていないものは登録できない' do
      @user.email = 'abcdefgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが一致しない場合登録できない' do
      @user.password = "password"
      @user = User.new(password_confirmation: "password2")
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordが6文字未満では登録できない' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'passwordが半角英語だけでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'passwordが半角数字だけ登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'passwordが全角入力では登録できない' do
      @user.password = 'ｂｃｆ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

      it 'last_nameが空であれば登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'last_nameが全角ひらがな、カタカナ、漢字以外であれば登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

        it 'first_nameが空であれば登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
        end

        it 'first_nameが全角ひらがな、カタカナ、漢字以外であれば登録できない' do
          @user.first_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include "First name is invalid"
        end

          it 'last_name_kanaが空では登録できない' do
            @user.last_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Last name kana can't be blank"
          end

          it 'last_name_kanaが全角ひらがな、カタカナ、漢字以外であれば登録できない' do
            @user.last_name_kana = 'test'
            @user.valid?
            expect(@user.errors.full_messages).to include "Last name kana is invalid"
          end

            it 'first_name_kanaが空では登録できない' do
              @user.first_name_kana = ''
              @user.valid?
              expect(@user.errors.full_messages).to include "First name kana can't be blank"
            end

            it 'first_name_kanaが全角カタカナ以外では登録できない' do
              @user.first_name_kana = 'test'
              @user.valid?
              expect(@user.errors.full_messages).to include "First name kana is invalid"
            end

              it 'birth_dateが空では登録できない' do
                @user.birth_date = ''
                @user.valid?
                expect(@user.errors.full_messages).to include "Birth date can't be blank"
              end

            end
          end
        end
