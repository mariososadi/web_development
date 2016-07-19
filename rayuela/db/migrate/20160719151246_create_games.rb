class CreateGames < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :nick_name
    t.timestamps
  end
  end
end
