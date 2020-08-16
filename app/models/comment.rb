class Comment < ApplicationRecord
  # postモデルとの外部キーを設定
  belongs_to :post
  validates :body, presence: true
end
