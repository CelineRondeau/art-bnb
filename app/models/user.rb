class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :paintings, dependent: :destroy
  has_many :reviews
  has_many :requests, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :first_name, length: { minimum: 3 }
  validates :last_name, length: { minimum: 3 }
  validates :last_name, length: { maximum: 10 }
  validates :first_name, length: { maximum: 10 }
  
  def name
    "#{first_name} #{last_name}"
  end

end
