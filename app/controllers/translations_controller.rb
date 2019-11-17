require 'open-uri'

class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show]

  def show
  end

  def create
    @translation = Translation.new(translation_params)
    if @translation.valid?
      video_id = @translation.url.last(11)
      video_info = JSON.parse(open("https://www.googleapis.com/youtube/v3/videos?id=#{video_id}&key=AIzaSyCo9vIU5QGRC7DKCXbV9JQx9J-xRu73Qm8&part=snippet,contentDetails,statistics,status").read)
      video_title = video_info["items"].first["snippet"]["title"]

      url = "http://video.google.com/timedtext?lang=en&v=#{video_id}"
      doc = Nokogiri::XML(open(url)).text
      if doc != ""
        doc.split('.').each do |sentence|
          fc = Flashcard.create!(user: User.first)
          Sentence.create!(content: sentence, translation: @translation, flashcard: fc)
        end
        @translation.video_title = video_title
        @translation.save!
      else
        # This video does not have subtitles
        raise
      end
      redirect_to translation_path(@translation)
    else
      render 'pages/home'
    end
  end

  private

  def translation_params
    params.require(:translation).permit(:url)
  end

  def set_translation
    @translation = Translation.find(params[:id])
  end
end
