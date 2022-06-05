class RemoveMovieNameFromMovie < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :movie_name, :string
  end
end
