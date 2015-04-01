class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.string :matric_no
      t.integer :phone_no
      t.decimal :rate
      t.text :description

      t.timestamps null: false
    end
  end
end
