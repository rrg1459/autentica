class CreateDolar < ActiveRecord::Migration[5.0]
  def change
    create_table :dolars do |t|
      t.integer :cambio
    end
  end
end
