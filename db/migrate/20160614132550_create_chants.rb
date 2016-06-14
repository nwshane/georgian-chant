class CreateChants < ActiveRecord::Migration[5.0]
  def change
    create_table :chants do |t|
      t.string :title

      t.timestamps
    end
  end
end
