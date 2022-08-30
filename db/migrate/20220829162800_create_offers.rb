class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.float :price
      t.text :address
      t.timestamps
    end
    add_column :offers, :seller_id, :integer
    add_foreign_key :offers, :users, column: :seller_id, null: false
  end
end
