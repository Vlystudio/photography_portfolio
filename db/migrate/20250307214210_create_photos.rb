class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
