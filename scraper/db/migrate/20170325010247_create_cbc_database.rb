class CreateCbcDatabase < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.text :sentence
      t.timestamps
    end
    add_index :contents, :sentence
  end
end
