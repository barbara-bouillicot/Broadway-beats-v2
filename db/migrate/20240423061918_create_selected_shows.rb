class CreateSelectedShows < ActiveRecord::Migration[7.1]
  def change
    create_table :selected_shows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
