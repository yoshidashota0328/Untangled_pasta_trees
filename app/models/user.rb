class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, confirmation: true
  has_many :layers, dependent: :destroy 
  has_many :trees, dependent: :destroy 
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, uniqueness: true, allow_nil: true
  def mine?(object)
    # 呼び出し元のオブジェクトのIDを示す self.id を省略した記法。
    # @user.mine?(object)のように利用すると、object.user_id と @user.id を比較する。
    object.user_id == id
  end
end
