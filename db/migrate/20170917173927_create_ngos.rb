class CreateNgos < ActiveRecord::Migration
  def change
    create_table :ngos do |t|
      t.string :name
      t.string :password

      t.timestamps null: false
    end
  end
end
