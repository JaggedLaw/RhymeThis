class AddColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :clue, :string
  end
end
