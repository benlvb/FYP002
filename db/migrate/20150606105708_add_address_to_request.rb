class AddAddressToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :address, :string
  end
end
