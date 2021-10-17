class AddAttrsToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :full_name, :string
    add_column :profiles, :social_name, :string
    add_column :profiles, :birth_date, :string
    add_column :profiles, :educational_background, :string
    add_column :profiles, :work_field, :string
    add_column :profiles, :about_me, :string
    add_column :profiles, :work_experience, :string
  end
end
