class AddsColumnsToPost < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :description, :string
  	add_column :posts, :image, :string
  	add_index :posts, :description
  	add_index :posts, :image
  end
end
