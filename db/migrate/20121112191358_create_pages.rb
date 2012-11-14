class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :chapter
      t.string :name

      t.timestamps
    end
    add_index :pages, :chapter_id
  end
end
