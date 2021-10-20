class RemoveProjectAndProfileOfProposal < ActiveRecord::Migration[6.1]
  def up
    remove_index(:proposals, :name => "index_proposals_on_imageable_type_and_imageable_id")
  end

  def down
    remove_index(:proposals, :name => "index_proposals_on_imageable_type_and_imageable_id")
  end
end
