class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :number
      t.integer :guess

      t.timestamps
    end
  end
end
