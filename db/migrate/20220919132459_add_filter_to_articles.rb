class AddFilterToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :filter, :string
  end
end
