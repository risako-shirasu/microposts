class AddfavoritesTousers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :favorites, foreign_key: true
  end
end
