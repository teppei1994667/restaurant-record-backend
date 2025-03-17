# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  # 他に使用可能なモジュール
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # カラムのバリデーション
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # モデルの関連付け
  has_many :stores, dependent: :destroy
end
