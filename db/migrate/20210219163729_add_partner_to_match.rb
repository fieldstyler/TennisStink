class AddPartnerToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :partner, :string
  end
end
