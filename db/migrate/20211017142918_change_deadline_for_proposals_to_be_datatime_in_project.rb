class ChangeDeadlineForProposalsToBeDatatimeInProject < ActiveRecord::Migration[6.1]
  def up
    change_column :projects, :deadline_for_proposals, :datetime
  end

  def down
    change_column :projects, :deadline_for_proposals, :datetime
  end
end
