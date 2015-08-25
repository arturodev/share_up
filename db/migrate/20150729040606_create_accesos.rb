class CreateAccesos < ActiveRecord::Migration
  def change
    create_table :accesos do |t|
      t.belongs_to :esquema, index:true
      t.string   :user
      t.string   :password
      t.decimal  :tipo
      t.string   :comentario
      t.boolean  :is_active, :default => true
      t.timestamps
    end
  end
  

end
