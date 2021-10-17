class Profile < ApplicationRecord
  validates :full_name, :birth_date, :educational_background, 
            :work_field, :about_me, :work_experience, presence: true
  belongs_to :freelancer
end
