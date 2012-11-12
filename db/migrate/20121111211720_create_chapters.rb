class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.references :manga

      t.timestamps
    end
    add_index :chapters, :manga_id
  end
end
