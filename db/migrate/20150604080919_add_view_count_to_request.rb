class AddViewCountToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :view_count, :int
  end
end
