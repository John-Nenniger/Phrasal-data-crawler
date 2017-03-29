class CreateCbcDatabase < ActiveRecord::Migration[5.0]
  def change
    create_table :cbc do |t|
      t.text :url
      t.text :article
      
      t.timestamps
    end
  end
end
