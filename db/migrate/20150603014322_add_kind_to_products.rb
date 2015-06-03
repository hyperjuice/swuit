class AddKindToProducts < ActiveRecord::Migration
  def change
    add_column :products, :kind, :string
  end
end
