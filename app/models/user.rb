class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      validates :nickname, presence: true
      validates :birthday, presence: true
      validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "can't be blank" }  

        
     # 本人情報確認  
     with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
      validates :first_name
      validates :last_name        
     end

     PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
     validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
       
     with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
      validates :first_name_kana
      validates :last_name_kana
    end
end
