class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :ranking
      t.string :location
      t.string :username
      t.string :password
    end
  end
end
