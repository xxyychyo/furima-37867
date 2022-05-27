class Item < ApplicationRecord
  #テーブルとのアソシエーション
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :derively_fee
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :status
  # active_storageとのアソシエーション
  # （items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :send_day_id
    validates :derively_fee_id
    validates :price
    validates :user
  end
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :send_day_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :derively_fee_id, numericality: { other_than: 1 , message: "can't be blank"}

    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
