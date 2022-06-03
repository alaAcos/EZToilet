class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :name
      t.boolean :presence
      t.text :details
      t.references :toilet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
