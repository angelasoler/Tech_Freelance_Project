class AddTotalValueToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :total_value, :decimal
  end
end
