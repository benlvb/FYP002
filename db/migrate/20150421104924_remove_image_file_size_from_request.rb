class RemoveImageFileSizeFromRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :image_file_size, :integer
  end
end
