class AddAttrToProposal < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :feed_back, :string
  end
end
