class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    t.belongs_to :user, index: true
    t.string :photo
    t.datetime :published_at
    t.timestamps
    end
  end
end
