class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :topic, null: false, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
