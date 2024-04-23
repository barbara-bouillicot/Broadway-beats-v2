class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :banner_url

      t.timestamps
    end
  end
end
