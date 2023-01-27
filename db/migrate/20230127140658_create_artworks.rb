class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :music_file
      t.string :illustration_file

      t.timestamps
    end
  end
end
