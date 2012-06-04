class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type, :limit => 1
      t.string :targeturl
      t.string :ad_ident, :limit => 15
      t.string :uniqueuser, :limit => 20
      t.string :user_agent
      t.string :ip, :limit => 16
      t.datetime :ad_gen_time
      t.timestamps
    end
    
    suppress_messages {
      add_index :events, :uniqueuser
      add_index :events, :ad_ident
    }
    say "and an indexes!", true
    
  end
end
