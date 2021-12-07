class Profile < ApplicationRecord
  validates :full_name, :birth_date, :educational_background,
            :work_field, :about_me, :work_experience, presence: { on: :create }
  belongs_to :freelancer
  has_one_attached :photo
  has_many :proposals, dependent: :destroy
end
