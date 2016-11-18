class AddLinkColumnToPost < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :link, :string
  	add_index :posts, :link
  end
end
