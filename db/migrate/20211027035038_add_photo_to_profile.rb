class AddPhotoToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :photo, :blob
  end
end
