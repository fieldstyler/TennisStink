class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :type
      t.string :score
      t.string :result
      t.string :date
      t.string :surface
      t.string :notes
    end
  end
end
