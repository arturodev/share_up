class CreateEsquemas < ActiveRecord::Migration
  def change
    create_table :esquemas do |t|
      t.belongs_to :database, index:true
      t.string   :nombre
      t.string   :user
      t.string   :password
      t.string   :tipo
      t.timestamps
    end
  end
  
end
