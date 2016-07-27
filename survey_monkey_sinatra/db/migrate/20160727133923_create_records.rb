class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.belongs_to :user, index: true
      t.belongs_to :survey, index: true
      t.integer :responder, :default => 0
      t.timestamps
    end
  end
end
