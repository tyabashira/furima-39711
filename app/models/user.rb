class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :user_name, presence: true
  validate :password_complexity
  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-zA-Z])(?=.*[0-9])/)
      errors.add(:password, 'には英字と数字の両方を含めて設定してください')
    end
  end
  validates :email, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
   validates :first_name, presence: true
   validates :last_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カナを使用してください' } do
    validates :first_kana, presence: true
    validates :last_kana, presence: true
  end
  validates :birth, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
