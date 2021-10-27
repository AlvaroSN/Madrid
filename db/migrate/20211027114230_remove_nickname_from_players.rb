class RemoveNicknameFromPlayers < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :nickname, :string
    add_index :players, :name, unique: true
  end
end
