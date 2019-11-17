class Sentence < ApplicationRecord
  belongs_to :translation
  belongs_to :flashcard
end
