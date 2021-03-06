class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.references :place, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
