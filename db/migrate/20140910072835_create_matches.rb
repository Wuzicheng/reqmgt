class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :requirement_id
      t.integer :product_id
      t.string :comments

      t.timestamps
    end
  end
end
