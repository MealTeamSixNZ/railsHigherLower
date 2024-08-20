class AddTableRelationship < ActiveRecord::Migration[7.1]
  def change
    # add_column :guesses, :game_id, :integer, null: false
    # add_reference :guesses, :game, foreign_key: {to_table: :games}
    add_reference :guesses, :game, foreign_key: true, null: false
  end
end
