class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
    t.belongs_to :user, index: true
    t.belongs_to :game, index: true
    t.datetime :game_date
    t.timestamps

  end
end
