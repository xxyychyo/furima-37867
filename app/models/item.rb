class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #テーブルとのアソシエーション
  belongs_to :user
  has_one    :order
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :derively_fee
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :status

  validates :category_id, :situation_id, :derively_fee_id, :prefecture_id, :send_day_id,
  numericality: { other_than: 1, message: "を選択してください" }

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
    validates :image
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, presence: true, numericality: { only_integer: true,  greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    # presence: { message: "を選択してください" }
  end
  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :status_id
    validates :derively_fee_id
    validates :send_day_id
  end
end