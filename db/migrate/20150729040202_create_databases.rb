class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.belongs_to :servidor, index:true
      t.string   :nombre
      t.string   :sid
      t.string   :cadena
      t.decimal  :puerto_db
      t.boolean  :is_active, :default => true
      t.timestamps
    end
  end
end
