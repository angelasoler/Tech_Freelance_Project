class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.string :motivation
      t.integer :hourly_rate
      t.integer :hours_per_week
      t.integer :weeks

      t.timestamps
    end
  end
end
