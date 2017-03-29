class CreateArticleTable < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :url
      t.text :title
      t.date :date

    end
  end
end
