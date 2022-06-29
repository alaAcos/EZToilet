class DropReviewsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :reviews
  end
end
