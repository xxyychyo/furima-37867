class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      validates :nickname, presence: true
      validates :birthday, presence: true 

       has_many :items
       has_many :orders
        
     # 本人情報確認  
     with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を入力してください' } do
      validates :first_name
      validates :last_name        
     end

     PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
     validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
       
     with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を入力してください' } do
      validates :first_name_kana
      validates :last_name_kana
      VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
      validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
     end
    # validates :text, presence: true
    # message: "を入力してください" 
    # message: 'Full-width characters'
    # ァ-ヶー－
  end


