class AddPublicadoToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :publicado, :boolean, default: false
  end
end
