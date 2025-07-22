# frozen_string_literal: true

# This is a model class representing a user
class User < ApplicationRecord
  has_secure_password
  has_many :posts
  # # これによりインスタンスメソッド .likes が生成
  # ユーザー削除時に関連するいいねも削除するためアソシエーションオプション:を設定
  has_many :likes, dependent: :destroy

  # バリデーションを追加
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # パスワードの長さを制限
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :line_user_id, uniqueness: true, allow_nil: true
end
