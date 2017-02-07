class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :text
      t.integer :number

      t.timestamps
    end
  end
end
