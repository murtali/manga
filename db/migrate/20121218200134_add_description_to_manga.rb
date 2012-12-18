class AddDescriptionToManga < ActiveRecord::Migration
  def change
    add_column :mangas, :synopsis, :text
  end
end
