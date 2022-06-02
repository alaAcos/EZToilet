class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.boolean :magazines
      t.boolean :toilet_paper
      t.boolean :bidet
      t.boolean :sit_warming
      t.boolean :funny_flushing_sound
      t.boolean :window
      t.boolean :air_freshner
      t.boolean :washlet

      t.timestamps
    end
  end
end
