class CreateMangas < ActiveRecord::Migration
  def change
    create_table :mangas do |t|
      t.string :name
      t.string :slug
      t.references :author
      t.timestamps
    end
    add_index :mangas, :author_id
    add_index :mangas, :slug
  end
end
