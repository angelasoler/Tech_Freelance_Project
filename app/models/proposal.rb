class Proposal < ApplicationRecord
  belongs_to :Project
  belongs_to :Profile
end
