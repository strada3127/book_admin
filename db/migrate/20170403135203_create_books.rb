class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.date :pulished_on
      t.integer :price
      t.integer :number_of_page

      t.timestamps
    end
  end
end
