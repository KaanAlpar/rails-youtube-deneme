class PagesController < ApplicationController
  def home
    @translation = Translation.new
  end
end
