class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :username, uniqueness: {
    message: "An account already exists for that username!"
  }

  validates :email, presence: true
  validates :email, email: true
  validates :email, uniqueness: {
    message: "An account already exists for that email address!"
  }
end
