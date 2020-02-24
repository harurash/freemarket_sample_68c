class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :family_name        , presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name         , presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana   , presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana    , presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday           , presence: true
  # validates :phonenumber  , format: { with:  /\A\d{10}$|^\d{11}\z/ }

  has_many :items
  has_many :likes
  has_many :like_items, through: :likes, source: :item 
  has_many :comments
  has_many :orders
  has_one :adress
end