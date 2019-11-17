class FlashcardsController < ApplicationController
  before_action :set_flashcard, only: [:show]
  def index
  end

  def show
  end

  private

  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
  end
end
