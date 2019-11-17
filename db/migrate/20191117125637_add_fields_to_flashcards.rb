class AddFieldsToFlashcards < ActiveRecord::Migration[5.2]
  def change
    add_column :flashcards, :sentence, :text
    add_column :flashcards, :unknown_word, :string
    add_column :flashcards, :translation, :string
  end
end
