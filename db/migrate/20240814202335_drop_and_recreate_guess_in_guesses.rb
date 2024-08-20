class DropAndRecreateGuessInGuesses < ActiveRecord::Migration[7.1]
  def change
    remove_column :guesses, :guess
    add_column :guesses, :guess, :integer, :null => false
  end
end
