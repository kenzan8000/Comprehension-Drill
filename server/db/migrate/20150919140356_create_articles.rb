class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :web_site_id
      t.string :link
      t.string :title
      t.string :language
      t.datetime :pub_date
      t.text :body
      t.text :question

      t.timestamps null: false
    end
  end
end
