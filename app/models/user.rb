class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :password,format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "must include both letters and numbers" }
validates :nickname, presence: true
validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龠]+\z/, message: "は全角ひらがな・カタカナ・漢字で入力してください" }
validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龠]+\z/, message: "は全角ひらがな・カタカナ・漢字で入力してください" }
validates :last_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
validates :birth_date, presence: true

end