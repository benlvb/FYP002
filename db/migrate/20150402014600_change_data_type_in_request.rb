class ChangeDataTypeInRequest < ActiveRecord::Migration
  def up
  	change_column :requests, :phone_no, :string
  	change_column :requests, :rate, :string
  end

  def down
  	change_column :requests, :phone_no, :integer
  	change_column :requests, :rate, :decimal
  end
end
