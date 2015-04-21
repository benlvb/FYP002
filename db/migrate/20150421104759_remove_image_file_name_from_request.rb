class RemoveImageFileNameFromRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :image_file_name, :string
  end
end
