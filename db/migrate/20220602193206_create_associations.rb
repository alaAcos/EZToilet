class CreateAssociations < ActiveRecord::Migration[6.1]
  def change
    create_table :associations do |t|
      t.references :toilet, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
