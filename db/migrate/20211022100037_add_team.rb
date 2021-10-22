class AddTeam < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :PO
      t.string :LI
      t.string :DCI
      t.string :DCD
      t.string :LD
      t.string :MCI
      t.string :MD
      t.string :MCD
      t.string :EI
      t.string :DC
      t.string :ED
      t.timestamps
    end
  end
end
