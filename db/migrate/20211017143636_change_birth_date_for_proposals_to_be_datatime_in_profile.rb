class ChangeBirthDateForProposalsToBeDatatimeInProfile < ActiveRecord::Migration[6.1]
  def up
    change_column :profiles, :birth_date, :date
  end

  def down
    change_column :profiles, :birth_date, :date
  end
end
