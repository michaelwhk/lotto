class CreateOzLottos < ActiveRecord::Migration[5.0]
  def change
    create_table :oz_lottos do |t|
      t.integer :n1
      t.integer :n2
      t.integer :n3
      t.integer :n4
      t.integer :n5
      t.integer :n6
      t.integer :n7

      t.timestamps
    end
  end
end
