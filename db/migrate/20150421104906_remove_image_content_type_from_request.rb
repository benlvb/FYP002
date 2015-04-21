class RemoveImageContentTypeFromRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :image_content_type, :string
  end
end
