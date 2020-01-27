class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :products
  has_many :likes
  has_many :comments
  has_many :sellers
  has_many :buyers
  has_many :sns_credentials
  has_one :address
  has_one :card


  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :nickname, :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :email, email_format: true

  mount_uploader :image, ImageUploader


  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

end
