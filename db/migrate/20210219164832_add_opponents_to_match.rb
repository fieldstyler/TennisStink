class AddOpponentsToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :opponent, :string
    add_column :matches, :opponent2, :string
  end
end
