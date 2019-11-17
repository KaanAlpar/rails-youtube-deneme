class CreateSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :sentences do |t|
      t.text :content
      t.references :translation, foreign_key: true
      t.references :flashcard, foreign_key: true

      t.timestamps
    end
  end
end
