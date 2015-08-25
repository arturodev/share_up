class CreateSisoperativos < ActiveRecord::Migration
  def change
    create_table :sisoperativos do |t|

      t.timestamps null: false
    end
  end
end
