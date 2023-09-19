class CreateShoppings < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppings do |t|
      t.string :post_code,      null:false
      t.integer :states_id,     null: false,default:nil
      t.string :city,           null:false
      t.string :street,         null:false
      t.string :build
      t.string :phone,          null:false
      t.references :furima,       null:false, foreign_key: true 
      t.timestamps 
    end
  end
end
