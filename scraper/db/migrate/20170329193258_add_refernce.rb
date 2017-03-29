class AddRefernce < ActiveRecord::Migration[5.0]
  def change
    add_reference :contents, :article, foreign_key: true
  end
end
