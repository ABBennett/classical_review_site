class Pieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title, null: false
      t.string :composer, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
