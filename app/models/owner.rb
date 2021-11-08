class Owner < ApplicationRecord
  has_many :projects
  has_many :proposals, through: :projects
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def validate_owner_signed_in

  validate :owner, presence: true, on: accept
  validate :owner, presence: true, on: turn_down
  validate :owner, presence: true, on: edit
  validate :owner, presence: true, on: update
end
