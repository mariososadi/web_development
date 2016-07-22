class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    t.belongs_to :post, index: true
    t.belongs_to :tag, index: true
    t.timestamps
    end
  end
end
