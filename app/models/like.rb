class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # validates method 第二引数にscopeオプションを指定する、スコープ内での一意性持たせる
  validates :user_id, uniqueness: { scope: :post_id }
end
