class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.text    :description
      t.integer :price
      t.string  :email
      t.integer :category_id
      t.string  :key

      t.timestamps 
    end
  end
end
