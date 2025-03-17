class Store < ApplicationRecord
  # モデルの関連付け
  belongs_to :user

  # カラムのバリデーション
  validates :store_name, presence: true
end
