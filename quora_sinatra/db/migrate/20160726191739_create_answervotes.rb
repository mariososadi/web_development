class CreateAnswervotes < ActiveRecord::Migration
  def change
    create_table :answer_votes do |t|
    t.belongs_to :answer, index: true
    t.integer :counter, :default => 0
    t.timestamps
      end
  end
end
