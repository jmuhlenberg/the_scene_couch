class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :video
      # t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
