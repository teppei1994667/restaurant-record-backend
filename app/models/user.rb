# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  # 他に使用可能なモジュール
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
