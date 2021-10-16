class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :photo

      t.timestamps
    end
  end
end
