class AddAttributesToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :max_hour_payment, :decimal
    add_column :projects, :deadline_for_proposals, :time
    add_column :projects, :face_to_face, :boolean
    add_column :projects, :remote, :boolean
  end
end
