class RemoveGuessColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :games, :guess
  end
end
