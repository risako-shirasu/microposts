class AddfavoritesTomicroposts < ActiveRecord::Migration[5.2]
  def change
    add_reference :microposts, :favorites, foreign_key: true
  end
end
