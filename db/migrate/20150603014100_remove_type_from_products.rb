class RemoveTypeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :type, :string
  end
end
