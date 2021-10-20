class AddProjectAndProfileToProposal < ActiveRecord::Migration[6.1]
  def change
    add_index :proposals, [:imageable_type, :imageable_id]
  end
end
