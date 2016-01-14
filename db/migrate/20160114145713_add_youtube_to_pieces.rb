class AddYoutubeToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :url, :string
  end
end
