class AddVideoTitleToTranslations < ActiveRecord::Migration[5.2]
  def change
    add_column :translations, :video_title, :string
  end
end
