class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :nombre2
      t.string :tipo
      t.string :permisos
      t.timestamps null: false
    end
  end
end
