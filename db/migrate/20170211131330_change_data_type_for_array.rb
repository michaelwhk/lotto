class ChangeDataTypeForArray < ActiveRecord::Migration[5.0]
  def change
    change_column :results, :array, :string
    rename_column :results, :array, :lotto
  end
end
