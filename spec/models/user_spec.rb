require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
    context '新規登録できる時' do
      it 'nicknameとemail、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる' do
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

      it 'last_nameが空か、全角ひらがな、カタカナ、漢字以外であれば登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

        it 'first_nameが空か、全角ひらがな、カタカナ、漢字以外であれば登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
        end

          it 'last_name_kanaが空か、全角カタカナ以外では登録できない' do
            @user.last_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Last name kana can't be blank"
          end

            it 'first_nameが空か、全角カタカナ以外では登録できない' do
              @user.first_name_kana = ''
              @user.valid?
              expect(@user.errors.full_messages).to include "First name kana can't be blank"
            end

              it 'birth_dateが空では登録できない' do
                @user.birth_date = ''
                @user.valid?
                expect(@user.errors.full_messages).to include "Birth date can't be blank"
              end
         end      
      end

end