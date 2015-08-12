class AddKeywordToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :keyword, :string
  end
end
