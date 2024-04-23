class AddColumnToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :artists, :string, array: true, default: []
  end
end
