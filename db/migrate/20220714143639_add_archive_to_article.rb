class AddArchiveToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :archive, :boolean, default: false
  end
end
