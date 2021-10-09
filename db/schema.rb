ActiveRecord::Schema.define(version: 2021_10_09_015716) do

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "desire_habilities"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
