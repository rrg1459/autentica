class AddColumnsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :existencia, :integer, default: 0
    add_column :posts, :precio, :integer, default: 0
  end
end
