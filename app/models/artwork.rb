class Artwork < ApplicationRecord
  belongs_to :user
  mount_uploader :illustration_file, IllustrationUploader
  mount_uploader :music_file, MusicUploader
  
  validates :music_file, presence: true, unless: :illustration_file?
  validates :illustration_file, presence: true, unless: :music_file?
  validates :title, presence: true

end
