class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :name, :null => false
      t.string :ident, :limit => 15, :null => false 
      t.timestamps
    end
  end
end
