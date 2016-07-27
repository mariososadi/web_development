class CreateQuestionvotes < ActiveRecord::Migration
  def change
      create_table :question_votes do |t|
      t.belongs_to :question, index: true
      t.integer :counter, :default => 0
      t.timestamps
      end
  end
end
