class RemoveImageUpdatedAtFromRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :image_updated_at, :integer
  end
end
