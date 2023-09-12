 class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,     null: false,default:""
      t.text :item_text,       null: false
      t.integer :category_id,  null: false,default:nil
      t.integer :quality_id,   null: false,default:nil
      t.integer :cost_id,      null: false,default:nil
      t.integer :region_id ,   null: false,default:nil
      t.integer :post_day_id,  null: false,default:nil
      t.integer :price   ,     null: false,default:nil
      #t.integer :status_id,    null: false,default:nil
      t.references :user,      null: false,default:nil,foreign_key: true
      t.timestamps
    end
  end
end
    

