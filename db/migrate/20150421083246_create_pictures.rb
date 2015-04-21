class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :request, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :requests
  end
end
