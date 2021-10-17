class AddFreelancerToProfile < ActiveRecord::Migration[6.1]
  def change
    add_reference :profiles, :freelancer, null: false, foreign_key: true
  end
end
