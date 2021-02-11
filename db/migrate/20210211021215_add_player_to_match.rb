class AddPlayerToMatch < ActiveRecord::Migration[5.2]
  def change
    add_reference :matches, :player, foreign_key: true
  end
end
