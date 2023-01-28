class Artwork < ApplicationRecord
  belongs_to :user
  mount_uploader :illustration_file, IllustrationUploader
  mount_uploader :music_file, MusicUploader
end
