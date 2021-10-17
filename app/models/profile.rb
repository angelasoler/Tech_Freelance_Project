class Profile < ApplicationRecord
  validates :full_name, presence: true
  belongs_to :freelancer
end
