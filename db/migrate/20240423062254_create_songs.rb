class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.references :show, null: false, foreign_key: true
      t.string :image_url
      t.string :track_id

      t.timestamps
    end
  end
end
