class Post < ApplicationRecord
  # postモデル1に対してcommentは複数(comments)
  has_many :comments, dependent: :destroy

  # バリデーション設定はモデル
  validates :title, presence: true, length: {minimum: 3, message: '短かすぎるよ!'}
  validates :body, presence: true, length: {minimum: 3, message: '短かすぎるよ!'}

  # 例外処理はコントローラーで条件分岐
end
