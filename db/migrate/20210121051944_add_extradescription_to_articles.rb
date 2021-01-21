class AddExtradescriptionToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :extradescription, :text
  end
end
