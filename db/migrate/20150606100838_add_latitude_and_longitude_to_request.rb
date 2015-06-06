class AddLatitudeAndLongitudeToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :latitude, :float
    add_column :requests, :longitude, :float
  end
end
