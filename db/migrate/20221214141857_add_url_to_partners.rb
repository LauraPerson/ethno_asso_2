class AddUrlToPartners < ActiveRecord::Migration[7.0]
  def change
    add_column :partners, :url, :string, default: nil
  end
end
