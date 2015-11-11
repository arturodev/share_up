class CreatePortals < ActiveRecord::Migration
  def change
    create_table :portals do |t|
      t.belongs_to :servidor, index:true
      t.string   :type
      t.string   :name
      t.string   :configuracion
      t.string   :url
      t.string   :user
      t.string   :password
      t.string   :comments
      t.boolean  :is_active, :default => true
      t.timestamps null: false
    end
  end
end