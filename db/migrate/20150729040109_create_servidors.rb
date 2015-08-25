class CreateServidors < ActiveRecord::Migration
  def change
    create_table :servidors do |t|
      t.string   :hostname
      t.string   :ip
      t.string   :puerto
      t.string   :usuario
      t.string   :password
      t.timestamps null: false
    end
  end
end
