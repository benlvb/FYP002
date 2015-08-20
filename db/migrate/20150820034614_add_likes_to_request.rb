class AddLikesToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :likes, :integer
  end
end
