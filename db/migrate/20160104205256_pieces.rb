class Pieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title, null: false
      t.string :composer, null: false

    end
  end
end
