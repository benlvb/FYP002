class AddVisitIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :visit_id, :integer
  end
end
