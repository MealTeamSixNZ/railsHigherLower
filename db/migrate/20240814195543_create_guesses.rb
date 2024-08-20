class CreateGuesses < ActiveRecord::Migration[7.1]
  def change
    create_table :guesses do |t|
      t.string :guess

      t.timestamps
    end
  end
end