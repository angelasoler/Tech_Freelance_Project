class AddProfileRefToProposal < ActiveRecord::Migration[6.1]
  def change
    add_reference :proposals, :profile, null: false, foreign_key: true
  end
end
