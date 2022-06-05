class AddMoviesArrayToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :movies_array, :text, array: true, default: []
  end
end
