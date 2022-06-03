class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :name
      t.boolean :presence
      t.text :details

      t.timestamps
    end
  end
end
