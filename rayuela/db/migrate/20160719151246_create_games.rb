class CreateGames < ActiveRecord::Migration
  def change
    create_table :gamess do |t|
    t.string :name
    t.timestamps
  end
  end
end
