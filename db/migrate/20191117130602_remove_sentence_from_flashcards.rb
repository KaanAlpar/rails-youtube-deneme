class RemoveSentenceFromFlashcards < ActiveRecord::Migration[5.2]
  def change
    remove_column :flashcards, :sentence, :text
  end
end
