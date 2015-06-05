class EnableUuidOsspExtension < ActiveRecord::Migration
  def change
  	if Rails.env.production?
  	 enable_extension 'uuid-ossp'
  	end
  end
end
