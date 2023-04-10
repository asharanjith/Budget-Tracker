class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :expenses

  validates :name, presence: true, length: { minimum: 3, message: 'must be at least 3 characters long' }
  validates :email, presence: true, length: { minimum: 3, maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 25 }
end
