class Profile < ApplicationRecord
  validates_presence_of :full_name, :birth_date, :educational_background,
                        :work_field, :about_me, :work_experience, on: :create
  belongs_to :freelancer
  has_one_attached :photo
  has_many :proposals
end
