class TargetUrlChanges < ActiveRecord::Migration
  def up
    remove_column :events, :targeturl
    add_column    :advertisements, :targeturl, :string
  end

  def down
    remove_column :advertisements, :targeturl
    add_column :events, :targeturl, :string
  end
  
end
