class Owner < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :proposals, through: :projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
