class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable
  has_one :profile
  has_many :scores
end
