class CreateAplicacions < ActiveRecord::Migration
  def change
    create_table :aplicacions do |t|

      t.timestamps null: false
    end
  end
end
