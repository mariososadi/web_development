class CreateUrls < ActiveRecord::Migration
 #Este es el bueno, para el ejercicio de bitly con usuarios
 def change
    create_table :urls do |t|
    t.belongs_to :user, index: true
    t.string :long_url
    t.string :short_url
    t.integer :counter, :default => 0
    t.timestamps
    end
  end
end
