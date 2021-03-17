class ChangeColumnNameMatchType < ActiveRecord::Migration[5.2]
  def change
    rename_column :matches, :type, :match_type
  end
end
