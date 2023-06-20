class AddPositionToRessources < ActiveRecord::Migration[7.0]
  def change
    add_column :ressources, :position, :integer
  end
end
