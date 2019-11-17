class RenameFlashcardsColumn < ActiveRecord::Migration[5.2]
  def change
    change_table :flashcards do |t|
      t.rename :translation, :unknown_word_translation
    end
  end
end
