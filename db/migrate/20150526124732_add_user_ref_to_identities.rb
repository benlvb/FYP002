class AddUserRefToIdentities < ActiveRecord::Migration
  def change
    add_reference :identities, :user, index: true
    add_foreign_key :identities, :users
  end
end
