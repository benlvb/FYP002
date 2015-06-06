class AddLatitudeAndLongitudeAndAddressToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :latitude, :float
    add_column :requests, :longitude, :float
    add_column :requests, :address, :string
  end
end
