class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :piece_id, null: false
      t.integer :rating, null: false
      t.string :title
      t.string :body
      t.integer :rank, null: false, default: 0

      t.timestamps null: false
    end
  end
end
