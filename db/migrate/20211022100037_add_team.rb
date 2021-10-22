class AddTeam < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :po
      t.string :li
      t.string :di
      t.string :dd
      t.string :ld
      t.string :mi
      t.string :mc
      t.string :md
      t.string :ei
      t.string :dc
      t.string :ed
      t.timestamps
    end
  end
end
