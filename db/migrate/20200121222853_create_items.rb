class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image_url
      t.string :name
      t.integer :times_worn
      t.boolean :favorite
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
