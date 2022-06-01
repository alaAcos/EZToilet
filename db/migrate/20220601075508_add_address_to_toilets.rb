class AddAddressToToilets < ActiveRecord::Migration[6.1]
  def change
    add_column :toilets, :address, :string, default: ""
  end
end
