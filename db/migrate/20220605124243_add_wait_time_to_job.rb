class AddWaitTimeToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :wait_time, :integer
  end
end
