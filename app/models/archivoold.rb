class Archivo < ApplicationRecord
validates :nombres, presence: true
validates :email, presence: true
validates :video, presence: true
validates :mensaje, presence: true


belongs_to :concurso

	extend CarrierWave::Mount
	mount_uploader :video, VideoUploader

end
